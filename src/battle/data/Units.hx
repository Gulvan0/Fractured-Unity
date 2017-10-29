package battle.data;
import battle.Unit;
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
	
	public static function decide(id:ID, allies:Array<Unit>, enemies:Array<Unit>):BotDecision
	{
		switch (id)
		{
			case ID.UnitGhost, ID.UnitArchghost:
				return ghost(allies, enemies);
			default:
				null;
		}
		
		throw "battle.data.Units->decide() exception: Invalid unit ID: " + id.getName();	
	}
	
	private static function ghost(leftTeam:Array<Unit>, rightTeam:Array<Unit>):BotDecision
	{
		var target:UnitCoords = findWeakestUnit(leftTeam);
		
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