package bh;

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
    public var trajectory(default, set):Null<String>;
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
            case Property.Trajectory: trajectory;
            case Property.Count: count;
        }
    }

    public function set_trajectory(v:String):String
    {
        Assert.assert(dispenser == DispenserType.Emitter || dispenser == DispenserType.Sequential);
        Assert.assert(["Linear", "Throw", "Static"].has(v));
        return trajectory = v;
    }

    public function set_interval(v:Float):Float
    {
        Assert.assert(dispenser != DispenserType.Obstacle);
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

    public static function createForAbility(id:AbilityID):PropObj
    {
        //TODO: implementation
        return null;
    }
}