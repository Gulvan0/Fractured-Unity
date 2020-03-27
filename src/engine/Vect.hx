package engine;

import hxassert.Assert;

class Vect
{

    public var length(default, set):Float;
    public var angle(default, set):Float;

    public var dx(default, set):Float;
    public var dy(default, set):Float;

    public function set_length(v:Float):Float 
    {
        Assert.assert(v >= 0);
        this.length = v;
        recalcLinear();
        return length;
    }

    public function set_angle(v:Float):Float   
    {
        if (v >= -Math.PI && v < Math.PI)
            this.angle = v;
        else
            this.angle = v % (2 * Math.PI) - Math.PI;
        recalcLinear();
        return angle;
    }

    public function set_dx(v:Float):Float   
    {
        this.dx = v;
        recalcRadial();
        return dx;
    }

    public function set_dy(v:Float):Float   
    {
        this.dy = v;
        recalcRadial();
        return dy;    
    }

    public function add(v2:Vect)
    {
        this.dx += v2.dx;
        this.dy += v2.dy;
        recalcRadial();
    }

    public function multiplyBy(a:Float)
    {
        this.dx *= a;
        this.dy *= a;
        this.length *= a; //easier than recalc
    }

    public function plus(v2:Vect):Vect
    {
        return new Vect(this.dx + v2.dx, this.dy + v2.dy);
    }
    
    public function product(a:Float):Vect
    {
        return new Vect(this.dx * a, this.dy * a);
    }

    private function recalcRadial()
    {
        length = Math.sqrt(dx*dx + dy*dy);
        angle = Math.atan2(dy, dx);
    }

    private function recalcLinear()
    {
        dx = length * Math.cos(angle);
        dy = length * Math.sin(angle);
    }

    public function copy():Vect
    {
        return new Vect(length, angle);
    }
    
    public function setRadial(length:Float, angle:Float) 
    {
        Assert.assert(length >= 0);
        this.length = length;
        this.angle = (angle >= -Math.PI && angle < Math.PI)? angle : angle % (2 * Math.PI) - Math.PI;
        recalcLinear();
    }

    public static function radial(length:Float, angle:Float):Vect
    {
        var v:Vect = new Vect(1, 0);
        v.setRadial(length, angle);
        return v;
    }

    public function new(dx:Float, dy:Float) 
    {
        this.dx = dx;
        this.dy = dy;
        recalcRadial();
    }
}