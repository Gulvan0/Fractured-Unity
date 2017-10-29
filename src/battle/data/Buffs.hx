package battle.data;
import battle.enums.BuffMode;
import Element;
import haxe.Constraints.Function;

/**
 * [STATIC_SERVICE] Uses buff by id (for buff ids)
 * @author Gulvan
 */
 
class Buffs
{
	
	public static function useBuff(id:ID, target:Unit, caster:Unit, element:Element, mode:BuffMode)
	{
		var func:Null<Function> = switch (id)
		{
			case ID.BuffLgConductivity:
				conductivity;
			case ID.BuffLgCharged:
				charged;
			default:
				null;
		}
		
		if (func == null)
			throw "Buffs->useBuff() exception: Invalid ID: " + id.getName();
		
		Reflect.callMethod(func, func, [target, mode]);
	}
	
	private static function conductivity(target:Unit, mode:BuffMode)
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
	
	private static function charged(target:Unit, mode:BuffMode)
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