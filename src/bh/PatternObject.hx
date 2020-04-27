package bh;

import motion.easing.IEasing;

class PatternObject 
{
    public var x:Float;
    public var y:Float;
    public var params:Map<String, BHParameter>;
    public var easing:Null<IEasing>;

    public function new(x:Float, y:Float, parameters:Map<String, BHParameter>, ?easing:Null<IEasing>)
    {
        this.x = x;
        this.y = y;
        this.params = parameters;
        this.easing = easing;
    }
}