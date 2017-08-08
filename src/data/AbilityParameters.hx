package data;
import returns.ParamsAbility;
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
		switch (id)
		{
			case "ability_quick_strike":
				return new ParamsAbility(0, 0, 0, AbilityType.Kick);
			case "ability_heal":
				return new ParamsAbility(3, 0, 50, AbilityType.Spell);
			case "ability_dark_pact":
				return new ParamsAbility(1, 1, 10, AbilityType.Spell);
			case "ability_empty":
				return new ParamsAbility(0, 0, 0, AbilityType.Kick);
			default:
				trace("Incorrect ability ID: " + id);
				throw 0;
		}
	}
	
	public static function getElementByID(id:String):Element
	{
		switch (id)
		{
			case "ability_quick_strike":
				return Element.Physical;
			case "ability_heal":
				return Element.Natura;
			case "ability_dark_pact":
				return Element.Shadow;
			default:
				trace("Incorrect ability ID: " + id);
				throw 0;
		}
	}
	
}