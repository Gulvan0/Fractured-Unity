package bh;

import io.IOUtils;
import io.AbilityParser;
import bh.EasingUtils;
import ID.AbilityID;
import motion.easing.Expo;
import bh.enums.Property;
import hxassert.Assert;
import motion.easing.IEasing;
import bh.enums.DispenserType;
import bh.enums.AttackType;
import bh.trajectories.Linear;
using Lambda;

class PropObj 
{
    public var attack:AttackType;
    public var dispenser:DispenserType;
    public var interval(default, set):Null<Float>;
    public var count(default, set):Null<Int>;
    public var presetEasing:Null<IEasing>;

    public function get(property:Property):Dynamic
    {
        return switch (property)
        {
            case Property.Attack: attack;
            case Property.Dispenser: dispenser;
            case Property.Interval: interval;
            case Property.Count: count;
        }
    }

    public function set_interval(v:Null<Float>):Null<Float>
    {
        Assert.assert(dispenser != DispenserType.Obstacle || v == null);
        return interval = v;
    }

    public function set_count(v:Int):Int
    {
        return count = v;
    }

    public function new(attack:AttackType, dispenser:DispenserType)
    {
        this.attack = attack;
        this.dispenser = dispenser;
    }

    public static function createForAbility(id:AbilityID, ?level:Int = 1):PropObj
    {
        var abInfo = AbilityParser.abilities.get(id);
        var danmakuProps = abInfo.danmakuProps;
        var obj:PropObj = new PropObj(abInfo.danmakuType, abInfo.danmakuDispenser);
        obj.count = IOUtils.retrieveIntVariant(Reflect.field(danmakuProps, "count"), level);
        obj.interval = IOUtils.retrieveFloatVariant(Reflect.field(danmakuProps, "interval"), level);
        if (Reflect.hasField(danmakuProps, "easing"))
        {
            var eName:String = Reflect.field(danmakuProps, "easing");
            if (eName == "Custom")
                obj.presetEasing = null;
            else
                obj.presetEasing = EasingUtils.getEasing(Easing.createByName(eName));
        }
        else
            obj.presetEasing = EasingUtils.getEasing(Easing.None);

        return obj;
    }

    
}