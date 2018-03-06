package battle.struct;
import battle.Unit;
import battle.enums.Team;
import hxassert.Assert;

/**
 * Contains units in battle
 * @author Gulvan
 */
class UnitArrays 
{
	public var left(default, null):Array<Unit>;
	public var right(default, null):Array<Unit>;
	public var both(get, never):Array<Unit>;
	
	public function get_both():Array<Unit>
	{
		return left.concat(right);
	}
	
	public inline function getUnit(coords:UnitCoords):Null<Unit>
	{
		var array:Array<Unit> = (coords.team == Team.Left)? left : right;
		return array[coords.pos];
	}
	
	public inline function player():Unit
	{
		return left[0];
	}
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>) 
	{
		Assert.assert(MathUtils.inRange(allies.length, 1, 3));
		Assert.assert(MathUtils.inRange(enemies.length, 1, 3));
		
		left = allies;
		right = enemies;
	}
	
}