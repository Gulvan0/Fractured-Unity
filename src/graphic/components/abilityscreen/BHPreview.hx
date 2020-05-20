package graphic.components.abilityscreen;

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
    private var previewBox:Sprite;
    private var preview:Sprite;
    private var selectedArrow:SelectedPatternArrow;
    private var abIcon:DisplayObject;

    private var ability:AbilityID;
    private var selectedPattern:Int;

    private function selectPattern(num:Int, e)
    {
        selectedPattern = num;
        selectedArrow.x = 458 + num * 45; 
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
        function cb(xml:Null<Xml>)
        {
            if (xml == null)
                return;

            var pts:Array<Point> = [for (particle in xml.elementsNamed("particle")) new Point(Std.parseFloat(particle.get("x")), Std.parseFloat(particle.get("y")))];
            
            if (Lambda.empty(pts))
                return;
                
            var min:Point = new Point(pts[0].x, pts[0].y);
            var max:Point = new Point(min.x, min.y);
            var sampleParticle:MovieClip = Assets.getParticle(ability);
            for (p in pts)
            {
                if (p.x < min.x)
                    min.x = p.x;
                else if (p.x > max.x)
                    max.x = p.x;
                if (p.y < min.y)
                    min.y = p.y;
                else if (p.y > max.y)
                    max.y = p.y;
            }
            for (p in pts)
                preview.add(Assets.getParticle(ability), p.x-min.x+(5+sampleParticle.width)/2, p.y-min.y+(5+sampleParticle.height)/2);

            var visibleWidth:Float = 745 - sampleParticle.width;
            var visibleHeight:Float = 345 - sampleParticle.height;
            var prefScaleX = (max.x - min.x) > visibleWidth? visibleWidth/(max.x - min.x) : 1;
            var prefScaleY = (max.y - min.y) > visibleHeight? visibleHeight/(max.y - min.y) : 1;
            preview.scaleX = Math.min(prefScaleX, prefScaleY);
            preview.scaleY = preview.scaleX;
            preview.centre(previewBox);
        }

        removeChild(preview);
        preview = new Sprite();
        this.add(preview, 595, 370);
        ConnectionManager.getBHPatternByID(ability, selectedPattern, cb);
    }

    public function changeAbility(newAb:AbilityID)
    {
        ability = newAb;
        removeChild(abIcon);
        abIcon = Assets.getBattleAbility(ability);
        this.add(abIcon, 485, 390);
        selectPattern(0, null);
    }

    private function deInit()
    {
        btn1.removeEventListener(MouseEvent.CLICK, selectPattern.bind(0));
        btn2.removeEventListener(MouseEvent.CLICK, selectPattern.bind(1));
        btn3.removeEventListener(MouseEvent.CLICK, selectPattern.bind(2));
        editBtn.removeEventListener(MouseEvent.CLICK, initEditor);
    }

    public function new(parentScreen:SAbility)
    {
        super();
        this.parentScreen = parentScreen;

        selectedPattern = 0;
        btn1 = new PatternChooseBtn1();
        btn2 = new PatternChooseBtn2();
        btn3 = new PatternChooseBtn3();
        editBtn = new EditPatternBtn();
        previewBox = new Sprite();
        preview = new Sprite();
        selectedArrow = new SelectedPatternArrow();
        ability = AbilityID.EmptyAbility;
        abIcon = new NoAbility();
        previewBox.graphics.lineStyle(5, 0x001519, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
        previewBox.graphics.beginFill(0x1e1e1e);
        previewBox.graphics.drawRect(0, 0, 750, 350);
        previewBox.graphics.endFill();
        this.add(btn1, 449, 464);
        this.add(btn2, 494, 464);
        this.add(btn3, 538, 464);
        this.add(editBtn, 450, 560);
        this.add(abIcon, 485, 390);
        this.add(selectedArrow, 458, 522);
        this.add(previewBox, 595, 370);
        this.add(preview, 595, 370);
        btn1.addEventListener(MouseEvent.CLICK, selectPattern.bind(0));
        btn2.addEventListener(MouseEvent.CLICK, selectPattern.bind(1));
        btn3.addEventListener(MouseEvent.CLICK, selectPattern.bind(2));
        editBtn.addEventListener(MouseEvent.CLICK, initEditor);
    }
}