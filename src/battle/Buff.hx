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
	
	public var duration:Int;
	
	public function new() 
	{
		
	}
	
}