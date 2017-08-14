package data;
import returns.BotDecision;
import utils.Team;
import utils.UnitType;
import utils.Utils;

/**
 * [STATIC_SERVICE] Returns .decide() method by id (for unit ids)
 * @author Gulvan
 */
class BotTactics 
{

	public static function decide(id:String, allies:Array<BattleUnit>, enemies:Array<BattleUnit>):BotDecision
	{
		switch (id)
		{
			case "unit_ghost":
				return ghost(enemies);
			default:
				trace("Incorrect unit ID: " + id);
				throw 0;
		}
	}
	
	
	private static function ghost(enemies:Array<BattleUnit>):BotDecision
	{
		var target:BattleUnit = Utils.findWeakestUnit(enemies);
		
		return new BotDecision(target.team, target.position, 0);
	}
}