package engine;

import hxassert.Assert;

class Vect
{

    private var _length:Float;
    private var _angle:Float;

    private var _dx:Float;
    private var _dy:Float;

    public var length(get, set):Float;
    public var angle(get, set):Float;

    public var dx(get, set):Float;
    public var dy(get, set):Float;

    public function set_length(v:Float):Float 
    {
        Assert.assert(v >= 0);
        this._length = v;
        recalcLinear();
        return _length;
    }

    public function set_angle(v:Float):Float   
    {
        if (v >= -Math.PI && v < Math.PI)
            this._angle = v;
        else
            this._angle = v % (2 * Math.PI) - Math.PI;
        recalcLinear();
        return _angle;
    }

    public function set_dx(v:Float):Float   
    {
        this._dx = v;
        recalcRadial();
        return _dx;
    }

    public function set_dy(v:Float):Float   
    {
        this._dy = v;
        recalcRadial();
        return _dy;    
    }

    public function get_length():Float 
    {
        return _length;
    }

    public function get_angle():Float   
    {
        return _angle;
    }

    public function get_dx():Float   
    {
        return _dx;
    }

    public function get_dy():Float   
    {
        return _dy;    
    }

    public function add(v2:Vect)
    {
        this._dx += v2.dx;
        this._dy += v2.dy;
        recalcRadial();
    }

    public function multiplyBy(a:Float)
    {
        this._dx *= a;
        this._dy *= a;
        this._length *= a; //easier than recalc
    }

    public function plus(v2:Vect):Vect
    {
        return new Vect(this._dx + v2.dx, this._dy + v2.dy);
    }
    
    public function product(a:Float):Vect
    {
        return new Vect(this._dx * a, this._dy * a);
    }

    private function recalcRadial()
    {
        _length = Math.sqrt(_dx*_dx + _dy*_dy);
        _angle = Math.atan2(-_dy, _dx);
    }

    private function recalcLinear()
    {
        _dx = _length * Math.cos(_angle);
        _dy = -_length * Math.sin(_angle);
    }

    public function copy():Vect
    {
        return new Vect(_dx, _dy);
    }
    
    private function setRadial(length:Float, angle:Float) 
    {
        Assert.assert(length >= 0);
        this._length = length;
        this._angle = (angle >= -Math.PI && angle < Math.PI)? angle : (angle + Math.PI) % (2 * Math.PI) - Math.PI;
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
        this._dx = dx;
        this._dy = dy;
        recalcRadial();
    }
}