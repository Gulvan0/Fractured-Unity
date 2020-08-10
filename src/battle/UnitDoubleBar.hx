package battle;

import openfl.display.Sprite;
using engine.MathUtils;

class UnitDoubleBar extends Sprite
{
    private var maxHP:Int;
    private var maxMana:Int;
    public var hp(default, set):Int;
    public var mana(default, set):Int;

    public function set_hp(v:Int):Int
    {
        v = v.fitInt(0, maxHP);
        //TODO: Fill
        /*
		HPs.get(target).text = newV + "/" + bar.capacity;
        Actuate.tween(bar, 0.4, {progress: newV / bar.capacity});
        */
        return v;
    }

    public function set_mana(v:Int):Int
    {
        v = v.fitInt(0, maxMana);
        //TODO: Fill
        /*
        manas.get(target).text = newV + "/" + bar.capacity;
		Actuate.tween(bar, 0.2, {progress: newV / bar.capacity});
        */
        return v;
    }

    public function new(maxHP:Int, maxMana:Int) 
    {
        super();
        this.maxHP = maxHP;
        this.maxMana = maxMana;
        //TODO: Draw
    }
}