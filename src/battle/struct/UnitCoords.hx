package battle.struct;
import hxassert.Assert;
import engine.MathUtils;
import battle.enums.Team;

using engine.MathUtils;

/**
 * Unit coordinates
 * @author Gulvan
 */
class UnitCoords 
{
	public var team:Team;
	public var pos:Int;

	public static function oppositeTeam(team:Team):Team
	{
		return (team == Left)? Right : Left;
	}
	
	public static function player():UnitCoords
	{
		return new UnitCoords(Team.Left, 0);
	}
	
	public static function nullC():UnitCoords
	{
		var a:UnitCoords = new UnitCoords(Team.Left, 0);
		a.pos = -1;
		return a;
	}
	
	public static function get(unit:UnitData):UnitCoords
	{
		return new UnitCoords(unit.team, unit.pos);
	}
	
	public function equals(coords:UnitCoords):Bool
	{
		return pos == coords.pos && team == coords.team;
	}

	//Changes the unit's team
	public function betray()
	{
		team = oppositeTeam(team);
	}
	
	public function new(team:Team, pos:Int) 
	{
		Assert.assert(pos.inRange(0, 2));
		
		this.team = team;
		this.pos = pos;
	}
	
}