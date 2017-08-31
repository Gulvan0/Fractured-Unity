package data;
import dataobj.ParamsUnit;

/**
 * [STATIC_SERVICE] Returns parameters by id (for unit ids)
 * @author Gulvan
 */
class UnitParameters 
{

	public static function getParametersByID(id:String, godMode:Bool = false):ParamsUnit
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
			case "unit_archghost":
				parameters.name = "Archghost";
				parameters.hp = 10000;
				parameters.mana = 5000;
				parameters.wheel = ["ability_quick_strike"];
				parameters.strength = 1;
				parameters.flow = 1;
				parameters.intellect = 1;
			case "unit_zealon":
				parameters.name = "Zealon";
				parameters.hp = 140;
				parameters.mana = 400;
				parameters.wheel = ["ability_shock_therapy", "ability_high_voltage", "ability_electrical_storm", "ability_charge"];
				parameters.strength = 2;
				parameters.flow = 2;
				parameters.intellect = 4;
			case "unit_icarus":
				parameters.name = "Icarus";
				parameters.hp = 200;
				parameters.mana = 200;
				parameters.wheel = ["ability_burn", "ability_affliction", "ability_replenish", "ability_in_flames"];
				parameters.strength = 2;
				parameters.flow = 4;
				parameters.intellect = 2;
			case "unit_hugo":
				parameters.name = "Hugo";
				parameters.hp = 400;
				parameters.mana = 140;
				parameters.wheel = ["ability_kick", "ability_throw_stone", "ability_nature_heal", "ability_stone_form"];
				parameters.strength = 4;
				parameters.flow = 2;
				parameters.intellect = 2;
			default:
				trace("Incorrect unit ID: " + id);
				throw 0;
		}
		
		if (godMode)
		{
			parameters.hp *= 100;
			parameters.mana *= 100;
		}
		
		return parameters;
	}
	
}