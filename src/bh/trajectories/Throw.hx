package bh.trajectories;

import openfl.geom.Point;
import engine.Vect;

class Throw implements ITrajectory
{
    public var r0:Vect;
    public var vel0:Vect;
    public var acceleration:Vect;

    public function nextPos(localTime:Int):Point
    {
        var dr:Vect = r0.plus(vel0.product(localTime)).plus(acceleration.product(localTime*localTime/2));
        return new Point(r0.dx + dr.dx, r0.dy + dr.dy);
    }

    public function rotate(angle:Float):Void
    {
        vel0.angle += angle;
        acceleration.angle += angle;
    }

    public function move(dr:Vect):Void
    {
        r0.add(dr);
    }

    public function copy():ITrajectory
    {
        return new Throw(r0.dx, r0.dy, vel0, acceleration);
    }

    public function new(x0:Float, y0:Float, vel0:Vect, acceleration:Vect) 
    {
        this.r0 = new Vect(x0, y0);
        this.vel0 = vel0;
        this.acceleration = acceleration;
    }
}