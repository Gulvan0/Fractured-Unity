package returns;
import hxassert.Assert;
import utils.Team;
import utils.UnitType;

/**
 * 
 * @author Gulvan
 */
class BotDecision 
{

	public var targetTeam:Team;
	public var targetPos:Int;
	public var abilityPos:Int;
	
	public function new(targetTeam:Team, targetPos:Int, abilityPos:Int) 
	{
		Assert.require(targetPos >= 0 && targetPos <= 2 && abilityPos >= 0 && abilityPos <= 8);
		
		this.targetTeam = targetTeam;
		this.targetPos = targetPos;
		this.abilityPos = abilityPos;
	}
	
}