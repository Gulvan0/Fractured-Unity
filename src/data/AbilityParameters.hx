package data;
import dataobj.ParamsAbility;
import utils.AbilityTarget;
import utils.Element;
import utils.AbilityType;

/**
 * [STATIC_SERVICE] Returns parameters by id (for ability ids)
 * @author Gulvan
 */
class AbilityParameters 
{

	public static function getParametersByID(id:String):ParamsAbility
	{
		var parameters:ParamsAbility = new ParamsAbility();
		
		switch (id)
		{
			//Basic
			case "ability_quick_strike":
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Physical;
			case "ability_heal":
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Allied;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Natura;
			case "ability_dark_pact":
				parameters.cooldown = 2;
				parameters.delay = 1;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Shadow;
			//Lg
			case "ability_shock_therapy":
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 60;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			case "ability_high_voltage":
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 40;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_electrical_storm":
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 80;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_charge":
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 20;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			//End
			case "ability_empty", "ability_stub":
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.All;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Physical;
			default:
				trace("Incorrect ability ID: " + id);
				throw 0;
		}
		
		return parameters;
	}
	
}