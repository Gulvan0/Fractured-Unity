package battle.struct;
import battle.Unit;
import battle.enums.Team;
import hxassert.Assert;

using MathUtils;
using Lambda;

/**
 * @author Gulvan
 */
class UPair<T>
{
	public var left(default, null):Array<T>;
	public var right(default, null):Array<T>;
	public var both(get, never):Array<T>;
	
	///Return an array consisting of elemnts from both arrays
	public function get_both():Array<T>
	{
		return left.concat(right);
	}
	
	///Return an object bound to unit
	public function get(coords:UnitCoords):T
	{
		var array:Array<T> = (coords.team == Team.Left)? left : right;
		return array[coords.pos];
	}
	
	///Return an object bound to unit
	public function getByUnit(unit:Unit):T
	{
		var coords:UnitCoords = UnitCoords.get(unit);
		return get(coords);
	}
	
	///Return an array of unit's enemies (or objects bound to them)
	public function opposite(coords:UnitCoords):Array<T>
	{
		return (coords.team == Team.Left)? right : left;
	}
	
	///Return an array of unit's allies (or objects bound to them) including himself
	public function allied(coords:UnitCoords):Array<T>
	{
		return (coords.team == Team.Left)? left : right;
	}
	
	///Attempt to find the object and return its coords or null if not found
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
	
	///Return an object bound to player
	public inline function player():T
	{
		return left[0];
	}
	
	public static function map<S, T>(left:Array<S>, right:Array<S>, func:S->T):UPair<T>
	{
		return new UPair(Lambda.map(left, func).array(), Lambda.map(right, func).array());
	}
	
	public function new(left:Array<T>, right:Array<T>) 
	{
		Assert.assert(left.length.inRange(1, 3));
		Assert.assert(right.length.inRange(1, 3));
		
		this.left = left;
		this.right = right;
	}
	
	public function iterator():Iterator<T>
	{
		return new UPairIterator(this);
	}
}