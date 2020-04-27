package bh;

using engine.MathUtils;

class BHParameter
{
    public var value(default, set):Float;
    public var leftConstraint(default, null):Null<Float>;
    public var rightConstraint(default, null):Null<Float>;
    public var intConstrained(default, null):Bool;

    public function set_value(v:Float):Float 
    {
        var fitv = v.fit(leftConstraint, rightConstraint);
        return value = intConstrained? Math.round(fitv) : fitv;
    }

    public function new(leftConstraint:Null<Float>, rightConstraint:Null<Float>, intConstrained:Bool, ?initialValue:Float) 
    {
        this.leftConstraint = leftConstraint;
        this.rightConstraint = rightConstraint;
        this.intConstrained = intConstrained;
        if (initialValue != null)
            this.value = initialValue;
        else if (leftConstraint != null)
            this.value = leftConstraint;
        else if (rightConstraint != null)
            this.value = rightConstraint;
        else 
            this.value = 0;
    }
}