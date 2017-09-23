package battle.struct;
import hxassert.Assert;
import MathUtils;
import battle.enums.Team;

/**
 * ...
 * @author Gulvan
 */
class UnitCoords 
{
	public var team:battle.enums.Team;
	public var pos:Int;
	
	public function new(team:battle.enums.Team, pos:Int) 
	{
		this.team = team;
		this.pos = pos;
	}
	
}