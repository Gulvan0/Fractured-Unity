package battle.struct;
import battle.Unit;
import battle.enums.Team;
import hxassert.Assert;

/**
 * @author Gulvan
 */
class UPair<T>
{
	public var left(default, null):Array<T>;
	public var right(default, null):Array<T>;
	public var both(get, never):Array<T>;
	
	public function get_both():Array<T>
	{
		return left.concat(right);
	}
	
	public function get(coords:UnitCoords):T
	{
		var array:Array<T> = (coords.team == Team.Left)? left : right;
		return array[coords.pos];
	}
	
	public function getByUnit(unit:Unit):T
	{
		var coords:UnitCoords = UnitCoords.get(unit);
		return get(coords);
	}
	
	public function find(obj:T):Null<UnitCoords>
	{
		for (i in 0...left.length)
			if (left[i] == obj)
				return new UnitCoords(Team.Left, i);
		for (i in 0...right.length)
			if (right[i] == obj)
				return new UnitCoords(Team.Right, i);
		return null;
	}
	
	public inline function player():T
	{
		return left[0];
	}
	
	public function new(left:Array<T>, right:Array<T>) 
	{
		Assert.assert(MathUtils.inRange(left.length, 1, 3));
		Assert.assert(MathUtils.inRange(right.length, 1, 3));
		
		this.left = left;
		this.right = right;
	}
	
	public function iterator():Iterator<T>
	{
		return new UPairIterator(this);
	}
}