package bh.trajectories;

import engine.Vect;
import motion.easing.IEasing;
import openfl.geom.Point;

class Linear implements ITrajectory
{
    public var x0:Float;
    public var y0:Float;
    public var easing:IEasing;
    public var velocity:Vect;

    public function nextPos(localTime:Int):Point
    {
        var eased:Float = easing.calculate(localTime / GameRules.bhTicksDuration);
        return new Point(x0 + velocity.dx * GameRules.bhTicksDuration * eased, y0 + velocity.dy * GameRules.bhTicksDuration * eased);
    }

    public function rotate(angle:Float):Void
    {
        velocity.angle += angle;
    }

    public function move(dr:Vect):Void
    {
        x0 += dr.dx;
        y0 += dr.dy;
    }

    public function copy():ITrajectory
    {
        return new Linear(x0, y0, velocity, easing);
    }

    public function new(x0:Float, y0:Float, velocity:Vect, easing:IEasing)
    {
        this.x0 = x0;
        this.y0 = y0;
        this.velocity = velocity;
        this.easing = easing;
    }
}