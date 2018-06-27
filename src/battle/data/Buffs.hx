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
	
	private static var target:Unit;
	private static var mode:BuffMode;
	
	public static function init(m:IMutableModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to re-init";
	}
	
	public static function useBuff(id:ID, targetCoords:UnitCoords, casterCoords:UnitCoords, m:BuffMode)
	{
		target = model.getUnits().get(targetCoords);
		mode = m;
		
		switch (id)
		{
			case ID.BuffLgConductivity:
				conductivity();
			case ID.BuffLgCharged:
				charged();
			case ID.BuffLgStrikeback:
				strikeback();
			case ID.BuffLgClarity:
				clarity();
			case ID.BuffLgSnared:
				snared();
			case ID.BuffLgEnergized:
				energized();
			default:
				throw "Buffs->useBuff() exception: Invalid ID: " + id.getName();
		}
	}
	
	private static function conductivity()
	{
		var modifier:Linear = new Linear(3, 0);
		switch (mode)
		{
			case BuffMode.Cast:
				target.healIn.combine(modifier);
			case BuffMode.End:
				target.healIn.detach(modifier);
			default:
		}
	}
	
	private static function charged()
	{
		switch (mode)
		{
			case BuffMode.Cast:
				target.flow *= 2;
			case BuffMode.End:
				target.flow = Math.round(target.flow / 2);
			default:
		}
	}
	
	private static function clarity()
	{
		var modifier:Linear = new Linear(1, 0.5);
		
		switch (mode)
		{
			case BuffMode.Cast:
				target.critChance.combine(modifier);
			case BuffMode.End:
				target.critChance.detach(modifier);
			default:
		}
	}
	
	private static function strikeback()
	{
		var modifier:Linear = new Linear(2, 0);
		
		switch (mode)
		{
			case BuffMode.Cast:
				target.critDamage.combine(modifier);
			case BuffMode.End:
				target.critDamage.detach(modifier);
			default:
		}
	}
	
	private static function energized()
	{
		var modifier:Linear = new Linear(2, 0);
		
		switch (mode)
		{
			case BuffMode.Cast:
				target.damageOut.combine(modifier);
			case BuffMode.End:
				target.damageOut.detach(modifier);
			default:
		}
	}
	
	private static function snared()
	{
		switch (mode)
		{
			case BuffMode.Cast:
				target.flow = Math.round(target.flow / 2);
			case BuffMode.End:
				target.flow = target.flow * 2;
			case BuffMode.Proc:
				target.buffQueue.dispellByID(ID.BuffLgSnared);
			default:
		}
	}
	
}