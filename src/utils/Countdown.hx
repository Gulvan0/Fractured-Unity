package utils;

/**
 * More free version of Pool. No borders, free value changing
 * @author Gulvan
 */
class Countdown 
{

	public var keyValue(default, null):Int;
	
	public var value(default, set):Int;
	
	public function set_value(v:Int):Int
	{
		return value = v;
	}
	
	public function new(startValue:Int, keyValue:Int) 
	{
		this.value = startValue;
		this.keyValue = keyValue;
	}
	
}