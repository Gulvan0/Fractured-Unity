package battle;
import struct.Element;

/**
 * @author Gulvan
 */
class Buff
{
	public var id:ID.BuffID;
	public var name:String;
	public var description:String;
	public var element:Element;
	public var properties:Map<String, String>;
	public var danmaku:Bool;
	
	public var duration:Int;
	
	public function tick() 
	{
		duration--;
	}

	public function ended():Bool 
	{
		return duration <= 0;
	}

	public function new() 
	{
		
	}
	
}