package graphic.components.abilityscreen;

import openfl.events.MouseEvent;
import openfl.display.DisplayObject;

class BHPreview extends SSprite
{

    private var btn1:PatternChooseBtn1;
    private var btn2:PatternChooseBtn2;
    private var btn3:PatternChooseBtn3;
    private var editBtn:EditPatternBtn;
    private var previewBox:SSprite;
    private var selectedArrow:SelectedPatternArrow;
    private var abIcon:DisplayObject;

    private var ability:ID;
    private var selectedPattern:Int;

    private function selectPattern(num:Int, e)
    {
        selectedPattern = num;
        selectedArrow.x = 458 + (num - 1) * 45; 
        redrawPreview();
    }

    private function initEditor(e)
    {

    }

    private function redrawPreview()
    {

    }

    public function changeAbility(newAb:ID)
    {
        ability = newAb;
        remove(abIcon);
        abIcon = Assets.getBattleAbility(ability);
        add(abIcon, 485, 390);
        redrawPreview();
    }

    public function new()
    {
        super();
        selectedPattern = 1;
        btn1 = new PatternChooseBtn1();
        btn2 = new PatternChooseBtn2();
        btn3 = new PatternChooseBtn3();
        editBtn = new EditPatternBtn();
        previewBox = new SSprite();
        selectedArrow = new SelectedPatternArrow();
        ability = ID.EmptyAbility;
        abIcon = new NoAbility();
        add(btn1, 449, 464);
        add(btn2, 494, 464);
        add(btn3, 538, 464);
        add(editBtn, 450, 560);
        add(abIcon, 485, 390);
        add(selectedArrow, 458, 522);
        add(previewBox, 483, 433);
        redrawPreview();
        btn1.addEventListener(MouseEvent.CLICK, selectPattern.bind(1));
        btn2.addEventListener(MouseEvent.CLICK, selectPattern.bind(2));
        btn3.addEventListener(MouseEvent.CLICK, selectPattern.bind(3));
        editBtn.addEventListener(MouseEvent.CLICK, initEditor);
    }
}