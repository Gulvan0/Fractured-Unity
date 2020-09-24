package graphic.components.abilityscreen;

import bh.enums.DispenserType;
import io.AbilityParser;
import haxe.Json;
import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.events.MouseEvent;
import openfl.display.DisplayObject;
import ID.AbilityID;
using graphic.Utils;
using graphic.SpriteExtension;

class BHPreview extends Sprite
{

    private var parentScreen:SAbility;

    private var btn1:PatternChooseBtn1;
    private var btn2:PatternChooseBtn2;
    private var btn3:PatternChooseBtn3;
    private var editBtn:EditPatternBtn;
    private var previewBox:BHPreviewBox;
    private var selectedArrow:SelectedPatternArrow;
    private var abIcon:DisplayObject;

    private var ability:AbilityID;
    private var selectedPattern:Int;
    private var selectPtnCallbacks:Array<MouseEvent->Void>;

    private function selectPattern(num:Int, e)
    {
        selectedPattern = num;
        selectedArrow.x = 507 + num * 45.5; 
        if (ability != AbilityID.EmptyAbility)
            redrawPreview();
    }

    private function initEditor(e)
    {
        if (ability != AbilityID.EmptyAbility)
        {
            deInit();
            parentScreen.initEditor(ability, selectedPattern);
        }
    }

    private function redrawPreview()
    {
        ConnectionManager.getPattern(ability, selectedPattern, previewBox.redraw.bind(_, ability));
    }

    public function changeAbility(newAb:AbilityID)
    {
        ability = newAb;
        removeChild(abIcon);
        abIcon = Assets.getBattleAbility(ability);
        this.add(abIcon, 535, 430);
        selectPattern(0, null);
    }

    private function deInit()
    {
        btn1.removeEventListener(MouseEvent.CLICK, selectPtnCallbacks[0]); 
        btn2.removeEventListener(MouseEvent.CLICK, selectPtnCallbacks[1]);
        btn3.removeEventListener(MouseEvent.CLICK, selectPtnCallbacks[2]);
        editBtn.removeEventListener(MouseEvent.CLICK, initEditor);
    }

    public function new(parentScreen:SAbility)
    {
        super();
        this.parentScreen = parentScreen;
        this.selectPtnCallbacks = [for (i in 0...3) selectPattern.bind(i)];

        selectedPattern = 0;
        btn1 = new PatternChooseBtn1();
        btn2 = new PatternChooseBtn2();
        btn3 = new PatternChooseBtn3();
        editBtn = new EditPatternBtn();
        previewBox = new BHPreviewBox(350, 350);
        selectedArrow = new SelectedPatternArrow();
        ability = AbilityID.EmptyAbility;
        abIcon = new NoAbility();

        this.add(btn1, 499, 502);
        this.add(btn2, 544.5, 502);
        this.add(btn3, 590, 502);
        this.add(editBtn, 499, 607);
        this.add(abIcon, 535, 430);
        this.add(selectedArrow, 507, 565);
        this.add(previewBox, 684, 380);
        btn1.addEventListener(MouseEvent.CLICK, selectPtnCallbacks[0]);
        btn2.addEventListener(MouseEvent.CLICK, selectPtnCallbacks[1]);
        btn3.addEventListener(MouseEvent.CLICK, selectPtnCallbacks[2]);
        editBtn.addEventListener(MouseEvent.CLICK, initEditor);
    }
}