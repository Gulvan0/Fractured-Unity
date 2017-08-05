package data;
import returns.BotDecision;
import utils.Team;
import utils.UnitType;

/**
 * [STATIC_SERVICE] Returns .decide() method by id (for unit ids)
 * @author Gulvan
 */
class BotTactics 
{

	public static function decide(id:String):BotDecision
	{
		switch (id)
		{
			case "unit_ghost":
				return ghost();
			default:
				trace("Incorrect unit ID: " + id);
				throw 0;
		}
	}
	
	
	private static function ghost():BotDecision
	{
		var enemies:Array<BattleUnit> = BattleController.instance.getLeftTeam();
		var target:BattleUnit = enemies[0];
		for (u in enemies)
			if (u.hpPool.value < target.hpPool.value)
				target = u;
		
		return new BotDecision(target.team, target.position, 0);
	}
}