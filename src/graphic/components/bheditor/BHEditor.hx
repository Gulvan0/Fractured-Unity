package graphic.components.bheditor;

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

enum EditorMode
{
    Add;
    Edit;
    Delete;
}

class BHEditor extends SSprite
{

    private var BH_RECT:Rectangle = new Rectangle(0, 0, 750, 250);

    private var ability:ID;
    private var particleCount:Int;
    private var parameters:Array<BHParameterDetails>;

    private var bg:ScalableBackground;

    private var patternBtns:Array<StickyButton>;
    private var acceptBtn:BHAcceptButton;
    private var declineBtn:BHDeclineButton;

    private var addBtn:ParticleButton;
    private var editBtn:StickyButton;
    private var deleteBtn:StickyButton;

    private var textPatterns:TextField;

    private var paramBox:ParamBox;

    private var patternContainer:SSprite;
    private var fieldBorder:SSprite;
    private var soul:DisplayObject;
    private var particles:Array<MovieClip>;
    private var selectionRectangle:SSprite;

    private var mode:EditorMode;
    private var zoom:Float;
    private var selectedPattern:Int;
    private var currentPositions:Array<Array<Point>>;
    private var currentParams:Array<Array<Map<String, Float>>>;
    private var selectedParticles:Array<Int>;

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
        patternContainer.startDrag(false);
    }

    private function rightReleasedHandler(e:MouseEvent)
    {
        patternContainer.stopDrag();
    }

    private function leftPressedHandler(e:MouseEvent)
    {
        if (mode != EditorMode.Add)
        {
            selectionRectangle.x = e.stageX;
            selectionRectangle.y = e.stageY;
            addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        }
    }

    private function leftReleasedHandler(e:MouseEvent)
    {
        if (mode != EditorMode.Add)
        {
            removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
            var intersected:Array<Int> = detectIntersectedParticles(selectionRectangle.x, selectionRectangle.y, e.stageX, e.stageY);
            if (mode == EditorMode.Delete)
                for (i in intersected)
                    delete(i);
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
        var deadFields:Array<DisplayObject> = [addBtn, editBtn, deleteBtn, acceptBtn, declineBtn, paramBox, patternBtns[0], patternBtns[1], patternBtns[2]];
        for (b in deadFields)
            if (b.hitTestPoint(e.stageX, e.stageY))
                return;
        
        switch (mode)
        {
            case EditorMode.Add:
                create(e.stageX - patternContainer.x, e.stageY - patternContainer.y);
            case EditorMode.Edit:
                var i:Null<Int> = detectParticle(e.stageX, e.stageY);
                if (i != null)
                    select([i]);
            case EditorMode.Delete:
                var i:Null<Int> = detectParticle(e.stageX, e.stageY);
                if (i != null)
                    delete(i);
        }
    }

    private function create(pX:Float, pY:Float)
    {
        for (i in 0...particleCount)
            if (particles[i] == null)
            {
                particles[i] = Assets.getParticle(ability);
                currentPositions[selectedPattern][i] = new Point(pX, pY);
                currentParams[selectedPattern][i] = [for (p in parameters) p.name => 1.0];
                patternContainer.add(particles[i], pX, pY);//scale/move may be needed due to zoom
                addBtn.decrementCount();
                return;
            }
    }

    private function select(particlesToSelect:Array<Int>)
    {
        for (i in selectedParticles)
            particles[i].filters = [];
        selectedParticles = particlesToSelect;
        for (i in selectedParticles)
            particles[i].filters = [new ColorMatrixFilter([0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0])];

        if (particlesToSelect != [])
            paramBox.init(parameters, currentParams[selectedPattern][selectedParticles[0]], parameterChanged);
        else 
            paramBox.init([], [], parameterChanged);
    }

    private function delete(i:Int)
    {
        patternContainer.remove(particles[i]);
        particles[i] = null;
        currentPositions[selectedPattern][i] = null;
        currentParams[selectedPattern][i] = null;
        addBtn.incrementCount();
    }

    private function parameterChanged(name:String, newValue:Int)
    {
        for (i in selectedParticles)
            currentParams[selectedPattern][i][name] = newValue;
    }

    private function detectParticle(xc:Float, yc:Float):Null<Int>
    {
        for (i in 0...particleCount)
            if (particles[i] != null && particles[i].hitTestPoint(xc, yc, true))
                return i;
        return null;
    }

    private function detectIntersectedParticles(x1:Float, y1:Float, x2:Float, y2:Float):Array<Int>
    {
        return [for (i in 0...particleCount) if (currentPositions[selectedPattern][i] != null && MathUtils.inside(currentPositions[selectedPattern][i], new Rectangle(x1, y1, x2 - x1, y2 - y1))) i];
    }

    private function wheelHandler(e:MouseEvent)
    {
        if (e.delta == 0)
            return;

        var up:Bool = e.delta > 0;
        if (up && zoom > 0.125)
        {
            zoom -= 0.125;
            bg.zoomIn();
        }
        else if (up && zoom < 1)
        {
            zoom += 0.125;
            bg.zoomOut();
        }
        patternContainer.scaleX = zoom;
        patternContainer.scaleY = zoom;
    }

    private function toPatterns():String
    {
        var s:String = "";
        for (i in 0...3)
        {
            s += '<pattern num="$i">\n';
            for (pi in 0...particleCount)
                if (particles[pi] != null)
                {
                    var pPos:Point = currentPositions[i][pi];
                    s += '<particle x="${pPos.x}" y="${pPos.y}">\n';
                    for (param in currentParams[i][pi].keys())
                        s += '<param name="$param">${currentParams[i][pi][param]}</param>\n';
                    s += "</particle>\n";
                }
            s += "</pattern>";
            if (i != 2)
                s += "\n";
        }
        return s;
    }

    private function onAccept(e)
    {
        var patterns:String = toPatterns();
        ConnectionManager.setPatternsByID(ability, patterns, returnToParent.bind(patterns));
    }

    private function onDecline(e)
    {
        returnToParent(null);
    }

    private function returnToParent(patterns:String)
    {
        deInit();
        onClosed(patterns);
    }

    private function selectPattern(num:Int)
    {
        patternBtns[selectedPattern].pushOut();
        for (i in 0...particleCount)
            if (particles[i] != null)
                patternContainer.remove(particles[i]);
        selectedPattern = num;
        particles = [for (i in 0...particleCount) currentPositions[selectedPattern][i] != null? Assets.getParticle(ability) : null];
        var placedParticleCount:Int = 0;
        for (i in 0...particleCount)
            if (particles[i] != null)
            {
                placedParticleCount++;
                patternContainer.add(particles[i], currentPositions[selectedPattern][i].x, currentPositions[selectedPattern][i].y);
            }
        addBtn.setCount(particleCount - placedParticleCount);
    }

    private function selectMode(newMode:EditorMode)
    {
        if (mode == EditorMode.Add)
            addBtn.pushOut();
        else if (mode == EditorMode.Edit)
            editBtn.pushOut();
        else
            deleteBtn.pushOut();
        mode = newMode;
    }

    public function new(ability:ID, selectedPattern:Int, particleCount:Int, patterns:Xml, onClosed:Null<String>->Void)
    {
        super();
        this.ability = ability;
        this.selectedPattern = selectedPattern;
        this.particleCount = particleCount;
        this.onClosed = onClosed;
        mode = EditorMode.Add;
        zoom = 1;
        selectedParticles = [];
        parameters = Omniscient.bhParameters(ability);

        bg = new ScalableBackground();
        textPatterns = new TextField();
        textPatterns.defaultTextFormat = new TextFormat(Fonts.TAHOMABOLD, 30, 0xffffff);
        textPatterns.selectable = false;
        textPatterns.text = "Patterns";
        textPatterns.width = textPatterns.textWidth + 5;
        textPatterns.height = textPatterns.textHeight + 5;
        paramBox = new ParamBox();
        fieldBorder = new SSprite();
        fieldBorder.graphics.lineStyle(5, 0xffffff, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
        fieldBorder.graphics.drawRect(0, 0, BH_RECT.width, BH_RECT.height);
        soul = Assets.getSoul();
        currentPositions = [];
        currentParams = [];
        var placedParticleCount:Int = 0;
        for (pattern in patterns.elementsNamed("pattern"))
        {
            currentPositions.push([]);
            currentParams.push([]);

            var pNum:Int = Std.parseInt(pattern.get("num"));
            var i:Int = 0;
            for (particle in pattern.elementsNamed("particle"))
            {
                currentPositions[pNum][i] = new Point(Std.parseFloat(particle.get("x")), Std.parseFloat(particle.get("y")));
                currentParams[pNum][i] = [for (param in particle.elementsNamed("param")) param.get("name") => Std.parseFloat(param.firstChild().nodeValue)];
                i++;
            }
            if (pNum == selectedPattern)
                placedParticleCount = i;
            for (iLeft in i...particleCount)
            {
                currentPositions[pNum].push(null);
                currentParams[pNum].push(null);
            }
        }
        particles = [for (i in 0...particleCount) currentPositions[selectedPattern][i] != null? Assets.getParticle(ability) : null];
        patternContainer = new SSprite();
        selectionRectangle = new SSprite();
        patternBtns = [new StickyButton(new BH1Button(), selectPattern.bind(0)), new StickyButton(new BH2Button(), selectPattern.bind(1)), new StickyButton(new BH3Button(), selectPattern.bind(2))];
        acceptBtn = new BHAcceptButton();
        declineBtn = new BHDeclineButton();
        addBtn = new ParticleButton(ability, particleCount - placedParticleCount, selectMode.bind(EditorMode.Add));
        editBtn = new StickyButton(new BHEditButton(), selectMode.bind(EditorMode.Edit));
        deleteBtn = new StickyButton(new BHDeleteButton(), selectMode.bind(EditorMode.Delete));
        acceptBtn.addEventListener(MouseEvent.CLICK, onAccept);
        declineBtn.addEventListener(MouseEvent.CLICK, onDecline);

        add(bg, 0, 0);
        add(textPatterns, 40, 30);
        for (i in 0...particleCount)
            if (particles[i] != null)
                patternContainer.add(particles[i], currentPositions[selectedPattern][i].x, currentPositions[selectedPattern][i].y);
        patternContainer.add(fieldBorder, 0, 0);
        patternContainer.add(soul, fieldBorder.x + soul.width * 2, fieldBorder.y + BH_RECT.height / 2);
        add(patternContainer, 330, 255);
        add(selectionRectangle, 0, 0);
        for (i in 0...3)
            add(patternBtns[i], 45 + 60 * i, 68);
        add(acceptBtn, 1240, 35);
        add(declineBtn, 1300, 35);
        add(addBtn, 40, 135);
        add(editBtn, 40, 202);
        add(deleteBtn, 40, 269);
        add(paramBox, 25, 340);
        addBtn.pushIn();
        patternBtns[selectedPattern].pushIn();
    }
}