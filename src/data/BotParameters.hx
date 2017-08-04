package data;
import returns.ParamsUnit;

/**
 * [STATIC_SERVICE] Returns parameters by id (for unit ids)
 * @author Gulvan
 */
class BotParameters 
{

	public static function getParametersByID(id:String):ParamsUnit
	{
		switch (id)
		{
			case "unit_ghost":
				return new ParamsUnit("Ghost", 100, 50, 1, 1, 1, ["ability_quick_strike"]);
			default:
				trace("Incorrect unit ID: " + id);
				throw 0;
		}
	}
	
}