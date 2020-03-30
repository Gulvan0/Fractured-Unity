package bh;

import motion.easing.Expo;
import bh.enums.Property;
import hxassert.Assert;
import motion.easing.IEasing;
import bh.enums.DispenserType;
import bh.enums.AttackType;
import bh.trajectories.Linear;

class PropObj 
{
    public var attack:AttackType;
    public var dispenser:DispenserType;
    public var variableFields:Array<Property>;
    public var trajectory(default, set):Null<ITrajectory>;
    public var interval(default, set):Null<Float>;
    public var count(default, set):Null<Int>;
    public var easing(default, set):Null<IEasing>;

    public function get(property:Property):Dynamic
    {
        return switch (property)
        {
            case Property.Attack: attack;
            case Property.Dispenser: dispenser;
            case Property.Interval: interval;
            case Property.Trajectory: trajectory;
            case Property.Easing: easing;
            case Property.Count: count;
        }
    }

    public function set_trajectory(v:ITrajectory):ITrajectory
    {
        Assert.assert(dispenser == DispenserType.Emitter || dispenser == DispenserType.Sequential);
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

    public function set_easing(v:IEasing):IEasing
    {
        Assert.assert(Std.is(trajectory, Linear));
        return easing = v;
    }

    public function new(attack:AttackType, dispenser:DispenserType, variableFields:Array<Property>)
    {
        this.attack = attack;
        this.dispenser = dispenser;
        this.variableFields = variableFields;
    }
}