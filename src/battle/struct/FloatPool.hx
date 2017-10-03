package battle.struct;
import hxassert.Assert;

/**
 * ...
 * @author Gulvan
 */
class FloatPool 
{

	public var maxValue(default, null):Float;
	public var minValue(default, null):Float;
	
	public var value(default, set):Float;
	
	public function set_value(v:Float):Float
	{
		if (v < minValue)
			value = minValue;
		else if(v > maxValue)
			value = maxValue;
		else
			value = v;
		return value;
	}
	
	public function new(startValue:Float, maxValue:Float, minValue:Float = 0) 
	{
		Assert.assert(maxValue >= minValue && startValue >= minValue && startValue <= maxValue);
		
		this.maxValue = maxValue;
		this.minValue = minValue;
		this.value = startValue;
	}
	
}