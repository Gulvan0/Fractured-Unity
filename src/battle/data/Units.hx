package battle.data;
import battle.Unit;
import battle.struct.UnitArrays;
import battle.struct.UnitCoords;
import haxe.Constraints.Function;
import hxassert.Assert;
import battle.enums.Team;

/**
 * ...
 * @author Gulvan
 */
typedef BotDecision = {target:UnitCoords, abilityNum:Int}
 
class Units 
{
	private static var units:UnitArrays;
	private static var flag:Bool = true;
	
	public static function setUnits(unitarr:UnitArrays)
	{
		if (flag)
		{
			units = unitarr;
			flag = false;
		}
		else
			throw "Attempt to rewrite unit arrays";
	}	
	
	public static function decide(id:ID):BotDecision
	{
		switch (id)
		{
			case ID.UnitGhost, ID.UnitArchghost:
				return ghost();
			default:
				null;
		}
		
		throw "battle.data.Units->decide() exception: Invalid unit ID: " + id.getName();	
	}
	
	private static function ghost():BotDecision
	{
		var target:UnitCoords = findWeakestUnit(units.left);
		
		return {target: target, abilityNum: 0};
	}
	
	//================================================================================
    // Supply
    //================================================================================
	
	private static function findWeakestUnit(array:Array<Unit>):UnitCoords 
	{
		Assert.assert(array.length > 0);
		
		var result:Unit = array[0];
		
		for (unit in array)
			if (unit.hpPool.value < result.hpPool.value)
				result = unit;
		
		return new UnitCoords(result.team, result.position);
	}
	
}