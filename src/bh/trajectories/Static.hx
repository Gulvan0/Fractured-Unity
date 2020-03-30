package bh.trajectories;

import engine.Vect;
import motion.easing.IEasing;
import openfl.geom.Point;

class Static implements ITrajectory
{
    public var x0:Float;
    public var y0:Float;

    public function nextPos(localTime:Int):Point
    {
        return new Point(x0, y0);
    }

    public function rotate(angle:Float):Void
    {
        
    }

    public function move(dr:Vect):Void
    {
        x0 += dr.dx;
        y0 += dr.dy;
    }

    public function copy():ITrajectory
    {
        return new Static(x0, y0);
    }

    public function new(x0:Float, y0:Float)
    {
        this.x0 = x0;
        this.y0 = y0;
    }
}