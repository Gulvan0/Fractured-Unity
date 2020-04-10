package battle.struct;
import battle.enums.Team;
import hxassert.Assert;

using engine.MathUtils;
using Lambda;

/**
 * @author Gulvan
 */
class UPair<T>
{
	public var playerCoords:Null<UnitCoords>;
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
	
	public function getByUnit(u:UnitData):T
	{
		var array:Array<T> = (u.team == Team.Left)? left : right;
		return array[u.pos];
	}
	
	public function reversed():UPair<T>
	{
		return new UPair(right.copy(), left.copy());
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
		return playerCoords == null? left[0] : get(playerCoords);
	}
	
	public static function map<S, T>(left:Array<S>, right:Array<S>, func:S->T):UPair<T>
	{
		return new UPair(Lambda.map(left, func).array(), Lambda.map(right, func).array());
	}
	
	public function kill(coords:UnitCoords)
	{
		if (coords.team == Team.Left)
			left[coords.pos] = null;
		else
			right[coords.pos] = null;
	}
	
	public function new(left:Array<T>, right:Array<T>) 
	{
		this.left = left;
		this.right = right;
	}
	
	public function iterator():Iterator<T>
	{
		return new UPairIterator(this);
	}
}