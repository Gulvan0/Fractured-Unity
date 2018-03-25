package battle.data;
import battle.enums.BuffMode;
import Element;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import haxe.Constraints.Function;

/**
 * Use buff by id
 * @author Gulvan
 */
 
class Buffs
{
	private static var model:IMutableModel;
	private static var flag:Bool = true;
	
	public static function setModel(m:IMutableModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to rewrite model";
	}
	
	public static function useBuff(id:ID, target:UnitCoords, caster:UnitCoords, element:Element, mode:BuffMode)
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
		
		Reflect.callMethod(func, func, [model.getUnits().get(target), mode]);
	}
	
	private static function conductivity(target:Unit, mode:BuffMode)
	{
		var modifier:Linear = new Linear(3, 0);
		switch (mode)
		{
			case battle.enums.BuffMode.Cast:
				target.healIn.combine(modifier);
			case battle.enums.BuffMode.OverTime:
				//No action
			case battle.enums.BuffMode.End:
				target.healIn.detach(modifier);
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
	
	private static function clarity(target:Unit, mode:BuffMode)
	{
		var modifier:Linear = new Linear(1, 0.5);
		
		switch (mode)
		{
			case BuffMode.Cast:
				target.critChance.combine(modifier);
			case BuffMode.OverTime:
				//No action
			case BuffMode.End:
				target.critChance.detach(modifier);
		}
	}
	
}