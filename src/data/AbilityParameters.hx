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
				parameters.cooldown = 1;
				parameters.delay = 1;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Shadow;
			case "ability_empty":
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