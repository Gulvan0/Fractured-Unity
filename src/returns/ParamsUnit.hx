package returns;

/**
 * 
 * @author Gulvan
 */
class ParamsUnit 
{

	public var name:String;
	public var hp:Int;
	public var mana:Int;
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	public var wheel:Array<String>;
	
	public function new(name:String, hp:Int, mana:Int, strength:Int, flow:Int, intellect:Int, wheel:Array<String>) 
	{
		this.name = name;
		this.hp = hp;
		this.mana = mana;
		this.strength = strength;
		this.flow = flow;
		this.intellect = intellect;
		this.wheel = wheel;
	}
	
}