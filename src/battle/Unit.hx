package battle;
import battle.data.Units;
import battle.struct.FloatPool;
import battle.struct.UnitCoords;
import battle.struct.Wheel;
import hxassert.Assert;
import battle.struct.BuffQueue;
import battle.struct.Pool;
import battle.enums.Team;
import battle.enums.UnitType;

/**
 * model OF unit IN battle
 * @author Gulvan
 */

typedef ParameterList = {
	var name:String;
	var hp:Int;
	var mana:Int;
	var wheel:Array<ID>;
	
	var strength:Int;
	var flow:Int;
	var intellect:Int;
}
 
class Unit
{
	
	public var id(default, null):ID;
	public var name(default, null):String;
	public var team(default, null):Team;
	public var position(default, null):Int;
	
	public var wheel(default, null):Wheel;
	public var hpPool(default, null):Pool;
	public var manaPool(default, null):Pool;
	public var alacrityPool(default, null):FloatPool;
	public var buffQueue(default, null):BuffQueue;
	
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	
	public var damageIn:Linear;
	public var damageOut:Linear;
	public var healIn:Linear;
	public var healOut:Linear;
	public var critChance:Linear;
	public var critDamage:Linear;
	
	public function tick()
	{
		wheel.tick();
		buffQueue.tick();
	}
	
	public function isStunned():Bool
	{
		return false;
	}
	
	public function new(id:ID, team:Team, position:Int, ?parameters:Null<ParameterList>) 
	{
		Assert.assert(position >= 0 && position <= 2);
		
		if (parameters == null)
			parameters = XMLUtils.parseUnit(id);
			
		this.id = id;
		this.name = parameters.name;
		this.team = team;
		this.position = position;
		
		this.wheel = new Wheel(parameters.wheel, 8);
		this.hpPool = new Pool(parameters.hp, parameters.hp);
		this.manaPool = new Pool(parameters.mana, parameters.mana);
		this.alacrityPool = new FloatPool(0, 100);
		this.buffQueue = new BuffQueue();
		
		this.strength = parameters.strength;
		this.flow = parameters.flow;
		this.intellect = parameters.intellect;
		
		this.damageIn = new Linear(1, 0);
		this.damageOut = new Linear(1, 0);
		this.healIn = new Linear(1, 0);
		this.healOut = new Linear(1, 0);
	}
	
	public function figureRelation(unit:Unit):UnitType
	{
		if (team != unit.team)
			return UnitType.Enemy;
		else if (position == unit.position)
			return UnitType.Self;
		else
			return UnitType.Ally;
	}
	
	public inline function checkManacost(abilityNum:Int):Bool
	{
		return manaPool.value >= wheel.get(abilityNum).manacost;
	}
	
	public inline function isPlayer():Bool
	{
		return team == Team.Left && position == 0;
	}
	
}