package graphic.components.bheditor;

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

    private var bg:ScalableBackground;

    private var patternBtns:Array<StickyButton>;
    private var acceptBtn:BHAcceptButton;
    private var declineBtn:BHDeclineButton;

    private var addBtn:ParticleButton;
    private var editBtn:StickyButton;
    private var deleteBtn:StickyButton;

    private var textPatterns:TextField;

    private var paramBox:ParamBox;

    private var fieldBorder:SSprite;
    private var soul:DisplayObject;
    private var particles:Array<MovieClip>;

    private var mode:EditorMode;
    private var selectedPattern:Int;
    private var currentParams:Array<Array<Map<String, Float>>>;

    private var onClosed:Void->Void; //Should return stringified pattern (use xmlutils or smth before returning). Use position of soul, fieldBorder and all the particles in container

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
        declineBtn.removeEventListener(MouseEvent.CLICK, returnToParent);
        removeEventListener(MouseEvent.CLICK, clickHandler);
        removeEventListener(MouseEvent.MOUSE_DOWN, leftPressedHandler);
        removeEventListener(MouseEvent.MOUSE_UP, leftReleasedHandler);
        removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rightPressedHandler);
        removeEventListener(MouseEvent.RIGHT_MOUSE_UP, rightReleasedHandler);
        removeEventListener(MouseEvent.MOUSE_WHEEL, wheelHandler);
    }

    private function rightPressedHandler(e:MouseEvent)
    {
        //startDrag for container of soul, fieldBorder and all the particles
    }

    private function rightReleasedHandler(e:MouseEvent)
    {
        //stopDrag for container of soul, fieldBorder and all the particles
    }

    private function leftPressedHandler(e:MouseEvent)
    {
        //if not addMode:
        //add selection rect
            addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
    }

    private function leftReleasedHandler(e:MouseEvent)
    {
        //if not addMode:
            removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        //push all the intersected particles into "selected" array (use selrect.x,.y and e.localX,.localY) | use select(x1,x2,y1,y2) function that will _/reinit parambox/delete selected
        //remove selection rect
    }

    private function moveHandler(e:MouseEvent)
    {
        //reshape selection rect 
    }

    private function clickHandler(e:MouseEvent)
    {
        //switch mode - add (scale if needed before adding to container, mind the coord system), select or delete
    }

    private function wheelHandler(e:MouseEvent)
    {
        //Depending on the e.delta's sign:
        //if scale (scaleX for example or use additional property like in bg) hasn't reached its upper/lower limit:
        //increase/decrease scaleX, scaleY of container of soul, fieldBorder and all the particles
        //zoom/zoomout bg (remove the wheel event handling from the bg's code)
    }

    private function onAccept(e)
    {
        //send change request, wait till the answer is recieved, then:
        //returnToParent();
        //Keep in mind that user should not be able to send multiple requests
    }

    private function returnToParent(?e)
    {
        deInit();
        onClosed();
    }

    private function selectPattern(num:Int)
    {
        patternBtns[selectedPattern].pushOut();
        //replace particles, leave everything else as it was
        selectedPattern = num;
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

    public function new(ability:ID, selectedPattern:Int, particleCount:Int, patterns:Array<Xml>, onClosed:Void->Void)
    {
        super();
        this.onClosed = onClosed;
        bg = new ScalableBackground();
        patternBtns = [new StickyButton(new BH1Button(), selectPattern.bind(0)), new StickyButton(new BH2Button(), selectPattern.bind(1)), new StickyButton(new BH3Button(), selectPattern.bind(2))];
        acceptBtn = new BHAcceptButton();
        declineBtn = new BHDeclineButton();
        addBtn = new ParticleButton(ability, particleCount, selectMode.bind(EditorMode.Add));
        editBtn = new StickyButton(new BHEditButton(), selectMode.bind(EditorMode.Edit));
        deleteBtn = new StickyButton(new BHDeleteButton(), selectMode.bind(EditorMode.Delete));
        textPatterns = new TextField();
        textPatterns.defaultTextFormat = new TextFormat(Fonts.NONAME, 30, 0xffffff);
        textPatterns.text = "Patterns";
        paramBox = new ParamBox();
        fieldBorder = new SSprite();
        fieldBorder.graphics.lineStyle(5, 0xffffff, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
        fieldBorder.graphics.drawRect(0, 0, BH_RECT.width, BH_RECT.height);
        soul = Assets.getSoul();
        particles = [];//fill according to pattern, add nulls
        mode = EditorMode.Add;
        this.selectedPattern = selectedPattern;
        currentParams = [];//fill according to patterns
        //container = new SSprite();
        acceptBtn.addEventListener(MouseEvent.CLICK, onAccept);
        declineBtn.addEventListener(MouseEvent.CLICK, returnToParent);

        add(bg, 0, 0);
        //particles, border and soul should be added to container!
        //add particles according to selectedPattern
        add(fieldBorder, 0, 0);
        add(soul, fieldBorder.x + soul.width * 2, fieldBorder.y + BH_RECT.height / 2);
        //add(container, 330, 255);
        for (i in 0...3)
            add(patternBtns[i], 45 + 60 * i, 68);
        add(acceptBtn, 1240, 35);
        add(declineBtn, 1240, 35);
        add(addBtn, 40, 135);
        add(editBtn, 40, 202);
        add(deleteBtn, 40, 269);
        add(textPatterns, 40, 30);
        add(paramBox, 25, 340);
    }
}