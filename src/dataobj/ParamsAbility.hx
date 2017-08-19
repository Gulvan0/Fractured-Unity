package dataobj;
import utils.AbilityTarget;
import utils.AbilityType;

/**
 * 
 * @author Gulvan
 */
class ParamsAbility 
{
	
	public var type:AbilityType;
	public var cooldown:Int;
	public var delay:Int;
	public var manacost:Int;
	public var target:AbilityTarget;
	
	public function new(cooldown:Int, delay:Int, manacost:Int, type:AbilityType, target:AbilityTarget) 
	{
		this.cooldown = cooldown;
		this.delay = delay;
		this.manacost = manacost;
		this.type = type;
		this.target = target;
	}
	
}