package utils;
import hxassert.Assert;

/**
 * Represents an interval with variable value inside it
 * @author Gulvan
 */
class Pool 
{
	public var maxValue(default, null):Int;
	public var minValue(default, null):Int;
	
	public var value(default, set):Int;
	
	public function set_value(v:Int):Int
	{
		Assert.require(v >= minValue && v <= maxValue);
		
		value = v;
		return value;
	}
	
	public function new(startValue:Int, maxValue:Int, minValue:Int = 0) 
	{
		Assert.require(maxValue >= minValue && startValue >= minValue && startValue <= maxValue);
		
		this.maxValue = maxValue;
		this.minValue = minValue;
		this.value = startValue;
	}
	
}