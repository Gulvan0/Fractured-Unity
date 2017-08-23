package dataobj;
import utils.AbilityTarget;
import utils.AbilityType;

/**
 * ...
 * @author Gulvan
 */
class AbilityInfo
{

	public var name:String;
	public var type:AbilityType;
	public var maxCooldown:Int;
	public var currentCooldown:Int;
	public var manacost:Int;
	public var target:AbilityTarget;
	
	public function new() 
	{
		
	}
	
}