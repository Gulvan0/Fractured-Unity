package battle.struct;
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
		if (v < minValue)
			value = minValue;
		else if(v > maxValue)
			value = maxValue;
		else
			value = v;
		return value;
	}
	
	public function new(startValue:Int, maxValue:Int, minValue:Int = 0) 
	{
		Assert.assert(maxValue >= minValue && startValue >= minValue && startValue <= maxValue);
		
		this.maxValue = maxValue;
		this.minValue = minValue;
		this.value = startValue;
	}
	
}