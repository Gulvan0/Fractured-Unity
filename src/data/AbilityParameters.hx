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
				parameters.name = "Quick Strike";
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Physical;
			case "ability_heal":
				parameters.name = "Heal";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Allied;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Natura;
			case "ability_dark_pact":
				parameters.name = "Dark Pact";
				parameters.cooldown = 2;
				parameters.delay = 1;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Shadow;
			//Lg
			case "ability_shock_therapy":
				parameters.name = "Shock Therapy";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 60;
				parameters.target = AbilityTarget.All;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			case "ability_high_voltage":
				parameters.name = "High Voltage";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 40;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_electrical_storm":
				parameters.name = "Electrical Storm";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 80;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_charge":
				parameters.name = "Charge";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 20;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			//Fi
			case "ability_burn":
				parameters.name = "Burn";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Fire;
			case "ability_affliction":
				parameters.name = "Affliction";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Fire;
			case "ability_replenish":
				parameters.name = "Replenish";
				parameters.cooldown = 10;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Fire;
			case "ability_in_flames":
				parameters.name = "In Flames";
				parameters.cooldown = 6;
				parameters.delay = 0;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Fire;
			//Tr
			case "ability_kick":
				parameters.name = "Kick";
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Terra;
			case "ability_throw_stone":
				parameters.name = "Throw Stone";
				parameters.cooldown = 4;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Terra;
			case "ability_nature_heal":
				parameters.name = "Nature Heal";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Allied;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Terra;
			case "ability_stone_form":
				parameters.name = "Stone Form";
				parameters.cooldown = 6;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Terra;
			//End
			case "ability_empty", "ability_stub":
				parameters.name = "Unnamed";
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