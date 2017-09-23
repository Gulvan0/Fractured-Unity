package battle.struct;

/**
 * More free version of Pool. No borders, free value changing
 * @author Gulvan
 */
class Countdown 
{

	public var keyValue(default, null):Int;
	
	public var value:Int;
	
	public function new(startValue:Int, keyValue:Int) 
	{
		this.value = startValue;
		this.keyValue = keyValue;
	}
	
}