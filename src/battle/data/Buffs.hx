package battle.data;
import battle.enums.BuffMode;
import battle.enums.Element;

/**
 * [STATIC_SERVICE] Uses buff by id (for buff ids)
 * @author Gulvan
 */
typedef BuffParameters = {
	var name:String;
	var describition:String;
	var element:Element;
	var isOverTime:Bool;
	var isStackable:Bool;
}
 
class Buffs
{

	//================================================================================
    // Properties
    //================================================================================
	
	public static function getParametersByID(id:String):BuffParameters
	{
		var parameters:BuffParameters = {name:"", describition:"", element:Element.Physical, isOverTime:false, isStackable:false};
		
		switch (id)
		{
			case "buff_conductivity":
				parameters.name = "Conductivity";
				parameters.describition = "Healing income increased by 200%";
				parameters.element = battle.enums.Element.Lightning;
				parameters.isOverTime = false;
				parameters.isStackable = false;
			case "buff_charged":
				parameters.name = "Charged";
				parameters.describition = "Flow increased by 100%";
				parameters.element = battle.enums.Element.Lightning;
				parameters.isOverTime = false;
				parameters.isStackable = false;
			default:
				trace("Incorrect ability ID: " + id);
				neko.Lib.rethrow(0);
		}
		
		return parameters;
	}
	
	//================================================================================
    // Functional
    //================================================================================
	
	public static function useBuff(id:String, target:Unit, caster:Unit, element:battle.enums.Element, mode:battle.enums.BuffMode)
	{
		switch (id)
		{
			case "buff_conductivity":
				conductivity(target, mode);
			case "buff_charged":
				charged(target, mode);
			default:
				trace("No ability with such ID: " + id);
				neko.Lib.rethrow(0);
		}
	}
	
	private static function conductivity(target:Unit, mode:battle.enums.BuffMode)
	{
		switch (mode)
		{
			case battle.enums.BuffMode.Cast:
				target.inputHealMultiplier *= 3;
			case battle.enums.BuffMode.OverTime:
				//No action
			case battle.enums.BuffMode.End:
				target.inputHealMultiplier /= 3;
		}
	}
	
	private static function charged(target:Unit, mode:battle.enums.BuffMode)
	{
		switch (mode)
		{
			case battle.enums.BuffMode.Cast:
				target.flow *= 2;
			case battle.enums.BuffMode.OverTime:
				//No action
			case battle.enums.BuffMode.End:
				target.flow = Math.round(target.flow / 2);
		}
	}
	
}