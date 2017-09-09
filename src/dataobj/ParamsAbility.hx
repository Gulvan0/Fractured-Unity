package dataobj;
import utils.AbilityTarget;
import utils.AbilityType;
import utils.Element;

/**
 * 
 * @author Gulvan
 */
class ParamsAbility 
{
	
	public var name:String;
	public var decribition:String;
	public var type:AbilityType;
	public var cooldown:Int;
	public var delay:Int;
	public var manacost:Int;
	public var target:AbilityTarget;
	public var element:Element;
	
	public function new() 
	{
		
	}
	
}