package battle.data;
import battle.Unit;
import battle.struct.UnitCoords;
import hxassert.Assert;
import battle.enums.Team;

/**
 * ...
 * @author Gulvan
 */
typedef BotDecision = {target:UnitCoords, abilityNum:Int}
 
class Units 
{
	
	public static function decide(id:String, allies:Array<battle.Unit>, enemies:Array<Unit>):BotDecision
	{
		switch (id)
		{
			case ID.UnitGhost, :
				return ghost(allies);
			default:
				trace("Incorrect unit ID: " + id);
				neko.Lib.rethrow(0);
				return {target:new UnitCoords(battle.enums.Team.Left, -1), abilityNum:-1};
		}
	}
	
	private static function ghost(leftTeam:Array<Unit>, rightTeam:Array<Unit>):BotDecision
	{
		var target:UnitCoords = findWeakestUnit(allies);
		
		return {target: target, abilityNum: 0};
	}
	
	//================================================================================
    // Supply
    //================================================================================
	
	private static function findWeakestUnit(array:Array<battle.Unit>):UnitCoords 
	{
		Assert.assert(array.length > 0);
		
		var result:battle.Unit = array[0];
		
		for (unit in array)
			if (unit.hpPool.value < result.hpPool.value)
				result = unit;
		
		return new UnitCoords(result.team, result.position);
	}
	
}