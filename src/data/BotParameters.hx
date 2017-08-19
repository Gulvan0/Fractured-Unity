package data;
import dataobj.ParamsUnit;

/**
 * [STATIC_SERVICE] Returns parameters by id (for unit ids)
 * @author Gulvan
 */
class BotParameters 
{

	public static function getParametersByID(id:String):ParamsUnit
	{
		var parameters:ParamsUnit = new ParamsUnit();
		
		switch (id)
		{
			case "unit_ghost":
				parameters.name = "Ghost";
				parameters.hp = 100;
				parameters.mana = 50;
				parameters.wheel = ["ability_quick_strike"];
				parameters.strength = 1;
				parameters.flow = 1;
				parameters.intellect = 1;
			default:
				trace("Incorrect unit ID: " + id);
				throw 0;
		}
		
		return parameters;
	}
	
}