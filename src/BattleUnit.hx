package;
import hxassert.Assert;
import utils.Pool;
import utils.Team;
import utils.UnitType;

/**
 * model OF unit IN battle
 * @author Gulvan
 */
class BattleUnit
{
	
	public var id(default, null):String;
	public var name(default, null):String;
	public var team(default, null):Team;
	public var position(default, null):Int; //by now, used only to figure out relations with units
	
	public var wheel(default, null):BattleWheel;
	
	public var strength(default, null) :Int;
	public var flow(default, null):Int;
	public var intellect(default, null):Int;
	
	public var hpPool(default, null):Pool;
	public var manaPool(default, null):Pool;
	
	public function figureRelation(unit:BattleUnit):UnitType
	{
		if (team != unit.team)
			return UnitType.Enemy;
		else if (position == unit.position)
			return UnitType.Self;
		else
			return UnitType.Ally;
	}
	
	public function new(id:String, name:String, team:Team, position:Int, strength:Int, flow:Int, intellect:Int, maxHP:Int, maxMana:Int, wheel:Array<String>) 
	{
		Assert.require(position >= 0 && position <= 2);
		
		this.id = id;
		this.name = name;
		this.position = position;
		this.team = team;
		
		this.strength = strength;
		this.flow = flow;
		this.intellect = intellect;
		
		this.hpPool = new Pool(maxHP, maxHP);
		this.manaPool = new Pool(maxMana, maxMana);
		
		this.wheel = new BattleWheel(wheel, 8);
	}
}