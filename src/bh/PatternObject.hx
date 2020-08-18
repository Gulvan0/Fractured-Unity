package bh;

import motion.easing.IEasing;
using bh.EasingUtils;

class PatternObject 
{
    public var x:Float;
    public var y:Float;
    public var params:Map<String, BHParameter>;
    public var easing:Null<IEasing>;

    public function toJson(customEasing:Bool):String
    {
        var s:String = "{";
        s += '"x": $x, ';
        s += '"y": $y';
        if (customEasing)
            s += ', "easing": ${easing.getName()}';
        for (name => p in params)
            s += ', "$name": ${p.value}';
        s += "}";
        return s;
    }

    public function new(x:Float, y:Float, parameters:Map<String, BHParameter>, ?easing:Null<IEasing>)
    {
        this.x = x;
        this.y = y;
        this.params = parameters;
        this.easing = easing;
    }
}