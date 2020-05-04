package graphic.components.bheditor;

import bh.enums.DispenserType;
import openfl.display.Sprite;
import graphic.Shapes.LineStyle;
import bh.Pattern;
import bh.PropObj;
import haxe.Timer;
import openfl.display.SimpleButton;
import openfl.filters.ColorMatrixFilter;
import ConnectionManager.BHParameterDetails;
import ConnectionManager.BHParameterUnit;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.events.MouseEvent;
import openfl.text.TextFormat;
import openfl.display.MovieClip;
import openfl.text.TextField;
import openfl.display.DisplayObject;

using engine.MathUtils;
using graphic.SpriteExtension;

enum EditorMode
{
    Add;
    Edit;
    Delete;
    Move;
    Playtest;
}

class BHEditor extends Sprite
{

    private var BH_RECT:Rectangle = new Rectangle(0, 0, GameRules.bhRectW, GameRules.bhRectH);

    private var ability:ID.AbilityID;
    private var properties:PropObj;
    private var patterns:Array<Pattern>;

    private var bg:ScalableBackground;

    private var patternBtns:Array<StickyButton>;
    private var acceptBtn:BHAcceptButton;
    private var declineBtn:BHDeclineButton;

    private var addBtn:ParticleButton;
    private var editBtn:StickyButton;
    private var deleteBtn:StickyButton;
    private var moveBtn:StickyButton;
    private var testBtn:StickyButton;

    private var patternButtonsHeader:TextField;

    private var paramBox:ParamBox;

    private var patternContainer:Sprite;
    private var fieldBorder:Sprite;
    private var soul:DisplayObject;
    private var objects:Array<MovieClip>;
    private var selectionRectangle:Sprite;

    private var warnField:TextField;

    private var mode:EditorMode;
    private var zoom:Float;
    private var selectedPattern:Int;
    private var selectedObjects:Array<Int>;
    private var objectDragStartPos:Null<Point>;

    private var onClosed:Null<String>->Void; 

    public function init(unfoldX:Float, unfoldY:Float)
    {
        bg.x = unfoldX;
        bg.y = unfoldY;
        bg.unfoldAndInit(0.2);
        addEventListener(MouseEvent.CLICK, clickHandler);
        addEventListener(MouseEvent.MOUSE_DOWN, leftPressedHandler);
        addEventListener(MouseEvent.MOUSE_UP, leftReleasedHandler);
        addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rightPressedHandler);
        addEventListener(MouseEvent.RIGHT_MOUSE_UP, rightReleasedHandler);
        addEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
    }

    private function deInit()
    {
        acceptBtn.removeEventListener(MouseEvent.CLICK, onAccept);
        declineBtn.removeEventListener(MouseEvent.CLICK, onDecline);
        removeEventListener(MouseEvent.CLICK, clickHandler);
        removeEventListener(MouseEvent.MOUSE_DOWN, leftPressedHandler);
        removeEventListener(MouseEvent.MOUSE_UP, leftReleasedHandler);
        removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rightPressedHandler);
        removeEventListener(MouseEvent.RIGHT_MOUSE_UP, rightReleasedHandler);
        removeEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
    }

    private function rightPressedHandler(e:MouseEvent)
    {
        if (mode != EditorMode.Playtest)
            patternContainer.startDrag(false);
    }

    private function rightReleasedHandler(e:MouseEvent)
    {
        if (mode != EditorMode.Playtest)
            patternContainer.stopDrag();
    }

    private function leftPressedHandler(e:MouseEvent)
    {
        if (isDeadPos(e.stageX, e.stageY) || mode == Add || mode == Playtest)
            return;

        var ind:Null<Int> = detectObject(e.stageX, e.stageY);
        if (mode == Move && i != null)
        {
            if (selectedObjects.empty())
                select([ind]);
            objectDragStartPos = new Point(e.stageX, e.stageY);
            for (i in selectedObjects)
                objects[i].startDrag(false);
        }
        else
        {
            selectionRectangle.x = e.stageX;
            selectionRectangle.y = e.stageY;
            addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        }
    }

    private function leftReleasedHandler(e:MouseEvent)
    {
        if (mode == Add || mode == Playtest)
            return;

        if (objectDragStartPos != null)
        {
            for (i in selected)
            {
                updateObjectPosition(i, patternX(e.stageX) - patternX(objectDragStartPos), patternY(e.stageY) - patternY(objectDragStartPos));
                objects[i].stopDrag();
            }
            objectDragStartPos = null;
        }
        else if (selectionRectangle.width + selectionRectangle.height > 0)
        {
            removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
            var intersected:Array<Int> = detectIntersectedObjects(selectionRectangle.x, selectionRectangle.y, e.stageX, e.stageY);
            if (mode == EditorMode.Delete)
                for (i in intersected)
                    delete(i);
            else
                select(intersected);
            selectionRectangle.graphics.clear();
        }
    }

    private function updateObjectPosition(index:Int, deltaX:Float, deltaY:Float)
    {
        patterns[selectedPattern].objects[index].x += deltaX;
        patterns[selectedPattern].objects[index].y += deltaY;
    }

    private function moveHandler(e:MouseEvent)
    {
        updateSelRect(e.stageX, e.stageY);
    }

    private function updateSelRect(toX:Float, toY:Float)
    {
        selectionRectangle.graphics.clear();
        selectionRectangle.graphics.lineStyle(2, 0x00ff00);
        selectionRectangle.graphics.beginFill(0x00ff00, 0.35);
        selectionRectangle.graphics.drawRect(0, 0, toX - selectionRectangle.x, toY - selectionRectangle.y);
    }

    private function clickHandler(e:MouseEvent)
    {
        if(isDeadPos(e.stageX, e.stageY))
            return;
        
        switch (mode)
        {
            case Add:
                create(patternX(e.stageX), patternY(e.stageY));
            case Edit, Move:
                var i:Null<Int> = detectObject(e.stageX, e.stageY);
                if (i != null)
                    select([i]);
            case Delete:
                var i:Null<Int> = detectObject(e.stageX, e.stageY);
                if (i != null)
                    delete(i);
            case Playtest:
                return;
        }
    }

    private inline function patternX(stageX:Float):Float
    {
        return (stageX - patternContainer.x)/zoom;
    }

    private inline function patternY(stageY:Float):Float
    {
        return (stageY - patternContainer.y)/zoom;
    }

    private function isDeadPos(x:Float, y:Float):Bool
    {
        var deadFields:Array<DisplayObject> = [addBtn, editBtn, deleteBtn, moveBtn, testBtn, acceptBtn, declineBtn, paramBox, patternBtns[0], patternBtns[1], patternBtns[2]];
        for (b in deadFields)
            if (b.hitTestPoint(x, y))
                return true;
        return false;
    }

    private function warn(text:String):Void 
	{
		warnField.text = text;
		warnField.visible = true;
		var timer = new Timer(3000);
		timer.run = function() {warnField.visible = false; timer.stop();}
	}

    private function create(pX:Float, pY:Float)
    {
        if (new Point(pX, pY).inside(BH_RECT))                          //TODO: Replace with soul and object radial check
            warn("You cannot place particles inside the rectangle");
        else
        {
            var obj:MovieClip = getObject();
            patterns[selectedPattern].createObject(pX, pY);
            patternContainer.add(obj, pX, pY);
            addBtn.decrementCount();
            objects.push(obj);
            return;
        }
    }

    private function select(objectsToSelect:Array<Int>)
    {
        for (i in selectedObjects)
            objects[i].filters = [];
        selectedObjects = objectsToSelect;
        for (i in selectedObjects)
            objects[i].filters = [new ColorMatrixFilter([0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0])];

        if (!Lambda.empty(objectsToSelect))
            paramBox.init(parameters, patterns[selectedPattern].objects[objectsToSelect[0]].params, parameterChanged, objectsToSelect.length > 1); //TODO: CHange parambox constructor signature
        else 
            paramBox.init([], [], parameterChanged);
    }

    private function delete(i:Int)
    {
        patternContainer.remove(objects[i]);
        objects.splice(i, 1);
        patterns[selectedPattern].objects.splice(i, 1);
        addBtn.incrementCount();
    }

    private function parameterChanged(name:String, newValue:Int)
    {
        for (i in selectedObjects)
            patterns[selectedPattern].objects[i].params[name].value = newValue;
    }

    private function detectObject(xc:Float, yc:Float):Null<Int>
    {
        for (i in 0...patterns[currentPattern].objects.length)
            if (patterns[currentPattern].objects[i].hitTestPoint(xc, yc, true))
                return i;
        return null;
    }

    private function detectIntersectedObjects(x1:Float, y1:Float, x2:Float, y2:Float):Array<Int>
    {
        var rectInContainer = MathUtils.rectByPoints(x1, y1, x2, y2);
        rectInContainer.moveRect(-patternContainer.x, -patternContainer.y);
        return [for (i in 0...objects.length) if (objects[i].inside(rectInContainer)) i];
    }

    private function wheelHandler(e:MouseEvent)
    {
        if (e.delta == 0)
            return;

        var up:Bool = e.delta > 0;
        if (up && zoom < 1)
        {
            zoom += 0.125;
            bg.zoomIn();
        }
        else if (!up && zoom > 0.125)
        {
            zoom -= 0.125;
            bg.zoomOut();
        }
        patternContainer.scaleX = zoom;
        patternContainer.scaleY = zoom;
    }

    private function toPatterns():String
    {
        //TODO: Re-implement
    }

    private function onAccept(e)
    {
        var patterns:String = toPatterns();
        ConnectionManager.setPatternsByID(ability, patterns, returnToParent.bind(patterns)); //TODO: Consider the importance of waiting for the response
    }

    private function onDecline(e)
    {
        returnToParent(null);
    }

    private function returnToParent(patterns:Null<String>)
    {
        deInit();
        onClosed(patterns);
    }

    private function selectPattern(num:Int)
    {
        if (selectedPattern == num)
            return;

        patternBtns[selectedPattern].pushOut();
        select([]);

        for (o in objects)
            patternContainer.remove(o);
        selectedPattern = num;
        disposeObjects(patterns[selectedPattern]);
        addBtn.setCount(properties.count - patterns[selectedPattern].objects.length);
    }

    private function selectMode(newMode:EditorMode)
    {
        if (mode == newMode)
            return;
        
        switch mode {
            case Add: addBtn.pushOut();
            case Edit: editBtn.pushOut();
            case Delete: deleteBtn.pushOut();
            case Move: moveBtn.pushOut();
            case Playtest: testBtn.pushOut(); //TODO: Launch playtest
        }
        mode = newMode;
    }

    //================================================================================================================================================================

    private function createBasicObjects()
    {
        bg = new ScalableBackground();
        patternButtonsHeader = TextFields.editorPatternButtonsHeader();
        paramBox = new ParamBox();
        fieldBorder = Shapes.noFillRect(BH_RECT.width, BH_RECT.height, 0xffffff, 5, LineStyle.Square);
        soul = Assets.getSoul();
        patternContainer = new Sprite();
        selectionRectangle = new Sprite();
        warnField = TextFields.editorWarn();
		warnField.visible = false;

        this.add(bg, 0, 0);
        this.add(patternButtonsHeader, 45, 28);
        this.add(patternContainer, 360, 85);
        this.add(selectionRectangle, 0, 0);
        patternContainer.add(fieldBorder, 0, 0);
        patternContainer.add(soul, fieldBorder.x + BH_RECT.width / 2, fieldBorder.y + BH_RECT.height / 2);
    }

    private function disposeObjects(pattern:Pattern)
    {
        for (object in pattern.objects)
        {
            var obj:MovieClip = getObject();
            objects.push(obj);
            patternContainer.add(obj, object.x, object.y);
        }
    }

    private function getObject():MovieClip
    {
        var isParticle:Bool = properties.dispenser == DispenserType.Obstacle;
        return isParticle? Assets.getParticle(ability) : Assets.getDispenser(ability);
    }

    private function createPatternButtons()
    {
        var patternBtnBases:Array<SimpleButton> = [new BH1Button(), new BH2Button(), new BH3Button()];
        patternBtns = [];
        for (i in 0...3)
        {
            var btn = new StickyButton(patternBtnBases[i], selectPattern.bind(i), selectedPattern == i);
            patternBtns.push(btn);
            this.add(btn, 45 + 60 * i, 68);
        }
    }

    private function createActionButtons()
    {
        addBtn = new ParticleButton(ability, properties.count - patterns[selectedPattern].objects.length, selectMode.bind(EditorMode.Add), true);
        editBtn = new StickyButton(new BHEditButton(), selectMode.bind(EditorMode.Edit));
        deleteBtn = new StickyButton(new BHDeleteButton(), selectMode.bind(EditorMode.Delete));
        moveBtn = new StickyButton(new BHMoveButton(), selectMode.bind(EditorMode.Move));
        testBtn = new StickyButton(new BHTestButton(), selectMode.bind(EditorMode.Playtest));
        
        this.add(addBtn, 45, 175);
        this.add(editBtn, 125, 175);
        this.add(deleteBtn, 45, 255);
        this.add(moveBtn, 125, 255);
        this.add(testBtn, 205, 215);
    }

    private function createExitButtons()
    {
        acceptBtn = new BHAcceptButton();
        declineBtn = new BHDeclineButton();
        acceptBtn.addEventListener(MouseEvent.CLICK, onAccept);
        declineBtn.addEventListener(MouseEvent.CLICK, onDecline); //TODO: Add hover tips and onDecline warning

        add(acceptBtn, 1240, 35);
        add(declineBtn, 1300, 35);
    }

    public function new(ability:ID.AbilityID, selectedPattern:Int, patterns:Array<Pattern>, onClosed:Null<String>->Void, ?preretrievedProps:PropObj)
    {
        super();
        this.ability = ability;
        this.selectedPattern = selectedPattern;
        this.properties = preretrievedProps == null? PropObj.createForAbility(ability) : preretrievedProps;
        this.patterns = patterns;
        this.onClosed = onClosed;
        this.objects = [];
        mode = EditorMode.Add;
        zoom = 1;
        selectedObjects = [];
        objectDragStartPos = null;

        createBasicObjects();
        createPatternButtons(); //TODO: BevelFilter onPush and maybe redraw accordingly
        createActionButtons();
        createExitButtons();
        disposeObjects(patterns[selectedPattern]);
        //TODO: add help and manual
        add(paramBox, 25, 340); //top-layer
        add(warnField, 0, 125);
    }
}