package graphic.components.bheditor;

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

    private var onClosed:Void->Void;

    public function init(unfoldX:Float, unfoldY:Float)
    {
        //add click, wheel, right-drag listeners
    }

    private function deInit()
    {
        acceptBtn.removeEventListener(MouseEvent.CLICK, onAccept);
        declineBtn.removeEventListener(MouseEvent.CLICK, returnToParent);
        //remove the listeners added in init()
    }

    private function onAccept(e)
    {
        //send change request, wait till the answer is recieved, then:
        //returnToParent();
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
        soul = Assets.getSoul();
        particles = [];
        mode = EditorMode.Add;
        this.selectedPattern = selectedPattern;
        currentParams = [];//fill according to patterns
        acceptBtn.addEventListener(MouseEvent.CLICK, onAccept);//configure everything created above this line
        declineBtn.addEventListener(MouseEvent.CLICK, returnToParent);
        //add everything on stage
    }
}