package data;
import utils.BuffMode;
import utils.Element;

/**
 * [STATIC_SERVICE] Uses buff by id (for buff ids)
 * @author Gulvan
 */
class BuffBehaviours
{

	public static function useBuff(id:String, target:BattleUnit, caster:BattleUnit, element:Element, mode:BuffMode)
	{
		switch (id)
		{
			case "buff_conductivity":
				conductivity(target, mode);
			default:
				trace("No ability with such ID: " + id);
				throw 0;
		}
	}
	
	private static function conductivity(target:BattleUnit, mode:BuffMode)
	{
		switch (mode)
		{
			case BuffMode.Cast:
				target.inputHealMultiplier *= 3;
			case BuffMode.OverTime:
				//No action
			case BuffMode.End:
				target.inputHealMultiplier /= 3;
		}
	}
	
}