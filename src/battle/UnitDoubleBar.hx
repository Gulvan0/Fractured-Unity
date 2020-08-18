package battle;

import motion.Actuate;
import graphic.TextFields;
import openfl.text.TextField;
import graphic.Shapes;
import graphic.components.ProgressBar;
import openfl.display.Sprite;
using engine.MathUtils;
using graphic.SpriteExtension;

class UnitDoubleBar extends Sprite
{
    private var maxHP:Int;
    private var maxMana:Int;
    public var hp(default, set):Int;
    public var mana(default, set):Int;
    private var hpBar:ProgressBar;
    private var manaBar:ProgressBar;
    private var hpText:TextField;
    private var manaText:TextField;

    public static var BAR_W:Int = 170;
    public static var BAR_H:Int = 14;
    public static var BORDER_THICKNESS:Float = 2;

    public function set_hp(v:Int):Int
    {
        v = v.fitInt(0, maxHP);
		hpText.text = '$v/$maxHP';
        Actuate.tween(hpBar, 0.4, {progress: v / maxHP});
        return v;
    }

    public function set_mana(v:Int):Int
    {
        v = v.fitInt(0, maxMana);
		manaText.text = '$v/$maxMana';
		Actuate.tween(manaBar, 0.2, {progress: v / maxMana});
        return v;
    }

    public function new(maxHP:Int, maxMana:Int) 
    {
        super();
        this.maxHP = maxHP;
        this.maxMana = maxMana;
        
        this.hpBar = new ProgressBar(BAR_W, BAR_H, ProgressBar.GREEN_TO_RED, null, 1, null, 0xCCCCCC, maxHP, false);
        this.manaBar = new ProgressBar(BAR_W, BAR_H, 0x00ccff, null, 1, null, 0xCCCCCC, maxMana, false);
        this.hpText = TextFields.upperBarHPManaValue('$maxHP/$maxHP', BAR_W);
        this.manaText = TextFields.upperBarHPManaValue('$maxMana/$maxMana', BAR_W);

        this.add(Shapes.fillOnlyRect(BAR_W + 2 * BORDER_THICKNESS, BAR_H * 2 + 2 * BORDER_THICKNESS, 0x333333), -BORDER_THICKNESS, -BORDER_THICKNESS);
        this.add(hpBar, 0, 0);
        this.add(manaBar, 0, BAR_H);
        this.add(hpText, 0, -2.8);
        this.add(manaText, 0, BAR_H -2.8);
    }
}