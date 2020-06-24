package graphic.components.bheditor;

import graphic.components.hints.BasicHint;
import graphic.components.bheditor.ParamBox.WarnType;
import bh.BehaviourData;
import bh.BHGame;
import openfl.events.KeyboardEvent;
import engine.CommandStack;
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
using Lambda;

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
    ///Preretrieved danmaku properties of the ability. Unchangeable and same for every particle/dispenser
    private var properties:PropObj;
    ///Represent the current, not yet confirmed patterns and are changed as the player edits object parameters or adds, deletes, moves the objects 
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
    ///Images of particles/dispensers that are placed by a player onto the pattern 'blueprint'.
    private var objects:Array<MovieClip>;
    private var selectionRectangle:Sprite;
    private var posRestrictionCircle:Sprite;
    private var objCursor:MovieClip;

    private var bhgame:Null<BHGame>;

    private var warnField:TextField;
    private var warnFieldTimer:Null<Timer>;

    private var mode:EditorMode;
    private var zoom:Float;
    private var selectedPattern:Int;
    private var selectedObjects:Array<Int>;
    private var objectDragStartPos:Null<Point>;
    private var actionStack:CommandStack;

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
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
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
        removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function keyHandler(e:KeyboardEvent) 
    {
        switch e.keyCode 
        {
            case 90:
                if (e.ctrlKey)
                    actionStack.backward();
            case 89:
                if (e.ctrlKey)
                    actionStack.forward();
            default:
        }
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

        if (mode == Move)
        {
            var ind:Null<Int> = detectObject(e.stageX, e.stageY);
            if (ind == null)
                return;

            select([ind]);
            objectDragStartPos = new Point(e.stageX, e.stageY);
            objects[ind].startDrag(false);
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

        if (hasEventListener(MouseEvent.MOUSE_MOVE))
            removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);

        if (objectDragStartPos != null)
        {
            for (i in selectedObjects)
            {
                objects[i].stopDrag();
                if (Utils.overlaps(objects[i], posRestrictionCircle, stage))
                {
                    objects[i].x = patternX(objectDragStartPos.x);
                    objects[i].y = patternY(objectDragStartPos.y);
                    warn("You can't move objects that close to the soul");
                }
                else
                    updateObjectPosition(i, patternX(e.stageX) - patternX(objectDragStartPos.x), patternY(e.stageY) - patternY(objectDragStartPos.y));
            }
            objectDragStartPos = null;
        }
        else if (selectionRectangle.width + selectionRectangle.height > 0)
        {
            
            var intersected:Array<Int> = detectIntersectedObjects(selectionRectangle.x, selectionRectangle.y, e.stageX, e.stageY);
            if (mode == EditorMode.Delete)
                delete(intersected);
            else
                select(intersected);
            selectionRectangle.graphics.clear();
        }
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
                    delete([i]);
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
        if (warnFieldTimer != null)
            warnFieldTimer.stop();
		warnField.text = text;
		warnField.visible = true;
        warnFieldTimer = new Timer(3000);
		warnFieldTimer.run = function() {
            warnField.visible = false; 
            warnFieldTimer.stop(); 
            warnFieldTimer = null;
        }
	}

    private function create(pX:Float, pY:Float, ?fromActionStack:Bool = false, ?addTo:Int)
    {
        if (patterns[selectedPattern].objects.length >= properties.count)
            warn("You have already placed a maximum amount of particles allowed for this ability");
        else if (!fromActionStack && Utils.overlaps(objCursor, posRestrictionCircle, stage))
            warn("Objects should be placed more far from the player's soul");
        else
        {
            var obj:MovieClip = getObject();
            patterns[selectedPattern].createObject(pX, pY, null, addTo);
            patternContainer.add(obj, pX, pY);
            addBtn.decrementCount();
            if (addTo == null)
                objects.push(obj);
            else
                objects.insert(addTo, obj);
            if (!fromActionStack)
                actionStack.addEntry(delete.bind([objects.length-1], true), create.bind(pX, pY, true));
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
        {
            var parameters = patterns[selectedPattern].objects[objectsToSelect[0]].params;
            var warning:Null<WarnType>;
            if (Lambda.empty(parameters))
                warning = WarnType.Empty;
            else if (objectsToSelect.length > 1)
                warning = WarnType.Multiple;
            else
                warning = null;
            paramBox.init(parameters, parameterChanged, warning);
        }
        else 
            paramBox.init([], parameterChanged);
    }

    private function delete(indexes:Array<Int>, ?ignoreStack:Bool = false)
    {
        indexes.sort(((i1, i2) -> i1 - i2));
        select([]);
        if (!ignoreStack)
        {
            function createBunch(inds:Array<Int>, prevObjectsState:Array<MovieClip>)
            {
                for (i in inds) //* This works because inds are sorted
                    create(prevObjectsState[i].x, prevObjectsState[i].y, true, i);
            }
            actionStack.addEntry(createBunch.bind(indexes.copy(), objects.copy()), delete.bind(indexes.copy(), true));
        }
        for (i in 0...indexes.length) //* Also works only since indexes are sorted
        {
            patternContainer.removeChild(objects[indexes[i] - i]);
            objects.splice(indexes[i] - i, 1);
            patterns[selectedPattern].objects.splice(indexes[i] - i, 1);
            addBtn.incrementCount();
        }
    }

    private function parameterChanged(name:String, newValue:Float)
    {
        function setParams(values:Array<Float>, objIndexes:Array<Int>)
        {
            for (i in 0...objIndexes.length)
            {
                patterns[selectedPattern].objects[objIndexes[i]].params[name].value = values[i];
                if (name == "Rotation")
                    objects[objIndexes[i]].rotation = values[i];
            }
            var parameters = patterns[selectedPattern].objects[selectedObjects[0]].params;
            var warning:Null<WarnType>;
            if (Lambda.empty(parameters))
                warning = WarnType.Empty;
            else if (selectedObjects.length > 1)
                warning = WarnType.Multiple;
            else
                warning = null;
            paramBox.init(parameters, parameterChanged, warning);
        }
        var currentValues:Array<Float> = [for (i in selectedObjects) patterns[selectedPattern].objects[i].params[name].value];
        actionStack.addEntry(setParams.bind(currentValues, selectedObjects.copy()), setParams.bind([newValue].stretch(selectedObjects.length), selectedObjects.copy()));
        setParams([newValue].stretch(selectedObjects.length), selectedObjects.copy());
    }

    private function updateObjectPosition(index:Int, deltaX:Float, deltaY:Float, ?fromActionStack:Bool = false)
    {
        patterns[selectedPattern].objects[index].x += deltaX;
        patterns[selectedPattern].objects[index].y += deltaY;
        if (!fromActionStack)
            actionStack.addEntry(updateObjectPosition.bind(index, -deltaX, -deltaY, true), updateObjectPosition.bind(index, deltaX, deltaY, true));
        else
        {
            objects[index].x += deltaX;
            objects[index].y += deltaY;
        }
    }

    private function detectObject(xc:Float, yc:Float):Null<Int>
    {
        for (i in 0...objects.length)
            if (objects[i].hitTestPoint(xc, yc, true))
                return i;
        return null;
    }

    private function detectIntersectedObjects(x1:Float, y1:Float, x2:Float, y2:Float):Array<Int>
    {
        var rectInContainer = MathUtils.rectByPoints(x1, y1, x2, y2);
        rectInContainer.moveRect(-patternContainer.x, -patternContainer.y);
        return [for (i in 0...objects.length) if (new Point(objects[i].x, objects[i].y).inside(rectInContainer)) i];
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
        objCursor.scaleX = zoom;
        objCursor.scaleY = zoom;
    }

    private function toPatterns():String
    {
        var s:String = "[";
        for (p in patterns)
        {
            if (s != "[")
                s += ",";
            s += p.toJson();
        }
        return s + "]";
    }

    private function onAccept(e)
    {
        var ps:String = toPatterns();
        trace(ps);
        ConnectionManager.setPatternsByID(ability, ps, returnToParent.bind(ps)); //TODO: Consider the importance of waiting for the response
    }

    private function onDecline(e)
    {
        returnToParent(null);
    }

    private function returnToParent(ps:Null<String>)
    {
        deInit();
        onClosed(ps);
    }

    private function selectPattern(num:Int)
    {
        if (selectedPattern == num)
            return;

        patternBtns[selectedPattern].pushOut();
        select([]);

        for (o in objects)
            patternContainer.removeChild(o);
        objects = [];
        selectedPattern = num;
        disposeObjects(patterns[selectedPattern]);
        addBtn.setCount(properties.count - patterns[selectedPattern].objects.length);
    }

    private function selectMode(newMode:EditorMode)
    {
        if (mode != null)
        {
            if (mode == newMode)
                return;
            
            switch mode {
                case Add:
                    posRestrictionCircle.visible = false;
                    objCursor.visible = false;
                    objCursor.stopDrag();
                    addBtn.pushOut();
                case Edit: 
                    editBtn.pushOut();
                case Delete: 
                    deleteBtn.pushOut();
                case Move: 
                    posRestrictionCircle.visible = false;
                    moveBtn.pushOut();
                case Playtest: 
                    testBtn.pushOut();
            }
        }
        mode = newMode;
        if (mode == Playtest)
        {
            var bdata:BehaviourData = new BehaviourData(ability, patterns[selectedPattern]);
            bhgame = new BHGame([bdata], null, exitPlaytest);
            Utils.centre(bhgame);
            addChild(bhgame);
        }
        else if (mode == Add)
        {
            posRestrictionCircle.visible = true;
            objCursor.startDrag(true);
            objCursor.visible = true;
        }
        else if (mode == Move)
            posRestrictionCircle.visible = true;
    }

    private function exitPlaytest() 
    {
        removeChild(bhgame);
        bhgame = null;
        selectMode(Add);
        addBtn.pushIn();
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
        posRestrictionCircle = Shapes.round(GameRules.bhObjectPosRestrictionRadius, 0xFF3333, 2, 1, 0xFF3333, 0.35);
        posRestrictionCircle.visible = false;
        objCursor = getObject();
        objCursor.stop();
        objCursor.visible = false;

        this.add(bg, 0, 0);
        this.add(patternContainer, 360, 85);
        this.add(objCursor, 0, 0);
        this.add(selectionRectangle, 0, 0);
        this.add(patternButtonsHeader, 45, 28);
        patternContainer.add(fieldBorder, 0, 0);
        patternContainer.add(soul, fieldBorder.x + BH_RECT.width / 2, fieldBorder.y + BH_RECT.height / 2);
        patternContainer.add(posRestrictionCircle, soul.x, soul.y);
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
        addBtn = new ParticleButton([for (i in 0...3) getObject()], properties.count - patterns[selectedPattern].objects.length, selectMode.bind(EditorMode.Add));
        editBtn = new StickyButton(new BHEditButton(), selectMode.bind(EditorMode.Edit), true);
        deleteBtn = new StickyButton(new BHDeleteButton(), selectMode.bind(EditorMode.Delete));
        moveBtn = new StickyButton(new BHMoveButton(), selectMode.bind(EditorMode.Move));
        testBtn = new StickyButton(new BHTestButton(), selectMode.bind(EditorMode.Playtest));

        addBtn.setHint(new BasicHint(new RichString("Add"), new RichString("Click to add particle or dispenser to pattern. Total number of objects is limited for each ability")));
        editBtn.setHint(new BasicHint(new RichString("Edit"), new RichString("Click and drag to select objects. You can edit parameters of selected objects using the box below")));
        deleteBtn.setHint(new BasicHint(new RichString("Delete"), new RichString("Click to delete the object from pattern. To delete multiple objects, click and drag")));
        moveBtn.setHint(new BasicHint(new RichString("Move"), new RichString("Click and drag the object to move it")));
        testBtn.setHint(new BasicHint(new RichString("Playtest"), new RichString("Open danmaku mode to test your patterns")));
        
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
        declineBtn.addEventListener(MouseEvent.CLICK, onDecline);
        acceptBtn.setHint(new BasicHint(new RichString("Accept"), new RichString("Save all patterns and quit")));
        declineBtn.setHint(new BasicHint(new RichString("Decline"), new RichString("Quit without saving\n&FF0000[WARNING!] This will discard all changes")));

        this.add(acceptBtn, 1240, 35);
        this.add(declineBtn, 1300, 35);
    }

    private function getObject():MovieClip
    {
        var isParticle:Bool = properties.dispenser == DispenserType.Obstacle;
        return isParticle? Assets.getParticle(ability) : Assets.getDispenser(ability);
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
        zoom = 1;
        selectedObjects = [];
        objectDragStartPos = null;
        actionStack = new CommandStack();

        createBasicObjects();
        createPatternButtons(); 
        createActionButtons();
        createExitButtons();
        disposeObjects(patterns[selectedPattern]);
        //TODO: add help and manual
        this.add(paramBox, 25, 340); //top-layer
        this.add(warnField, 0, 10);
        selectMode(Edit);
    }
}