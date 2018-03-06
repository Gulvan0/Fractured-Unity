package battle.struct;
import hxassert.Assert;
import MathUtils;
import battle.enums.Team;

/**
 * Unit coordinates
 * @author Gulvan
 */
class UnitCoords 
{
	public var team:Team;
	public var pos:Int;
	
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
	
	public static function get(unit:Unit):UnitCoords
	{
		return new UnitCoords(unit.team, unit.position);
	}
	
	public function new(team:Team, pos:Int) 
	{
		Assert.assert(MathUtils.inRange(pos, 0, 2));
		
		this.team = team;
		this.pos = pos;
	}
	
}