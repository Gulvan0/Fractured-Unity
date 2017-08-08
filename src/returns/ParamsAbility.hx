package returns;
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
	
	public function new(cooldown:Int, delay:Int, manacost:Int, type:AbilityType) 
	{
		this.cooldown = cooldown;
		this.delay = delay;
		this.manacost = manacost;
		this.type = type;
	}
	
}