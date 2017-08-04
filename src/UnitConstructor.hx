package;
import data.BotParameters;
import returns.ParamsUnit;
import utils.Team;

/**
 * [STATIC_SERVICE] constructor OF battle units
 * @author Gulvan
 */
class UnitConstructor 
{

	public static function constructFromRoaming(unit:RoamingUnit):BattleUnit
	{
		return new BattleUnit("", "", Team.Left, 0, 0, 0, 0, 0, 0, []);
	}
	
	public static function constructBotByID(id:String, team:Team, position:Int):BattleUnit
	{
		var params:ParamsUnit = BotParameters.getParametersByID(id);
		
		return new BattleUnit(id, params.name, team, position, params.strength, params.flow, params.intellect, params.hp, params.mana, params.wheel);
	}
	
}