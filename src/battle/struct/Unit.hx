package battle;
import battle.enums.Team;
import battle.enums.UnitType;
import battle.struct.BuffQueue;
import battle.struct.FloatPool;
import battle.struct.Pool;
import battle.struct.Wheel;
import hxassert.Assert;

typedef ParameterList = {
	var name:String;
	var element:Null<Element>;
	var hp:Int;
	var mana:Int;
	var wheel:Array<ID>;
	
	var strength:Int;
	var flow:Int;
	var intellect:Int;
}

typedef SubordinaryParameterList = {
	var buffQueue:BuffQueue;
	
	var critChance:Linear;
	var critDamage:Linear;
	var damageIn:Linear;
	var damageOut:Linear;
	var healIn:Linear;
	var healOut:Linear;
}

/**
 * Represents unit in battle
 * @author Gulvan
 */
 
class Unit
{
	
	public var id(default, null):ID;
	public var name(default, null):String;
	public var element(default, null):Element;
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
	
	public function isAlive():Bool
	{
		return hpPool.value > 0;
	}
	
	public function new(id:ID, team:Team, position:Int, ?params:Null<ParameterList>, ?subparams:Null<SubordinaryParameterList>) 
	{
		Assert.assert(position >= 0 && position <= 2);
		
		if (params == null)
			params = XMLUtils.parseUnit(id);
			
		this.id = id;
		this.name = params.name;
		this.element = params.element;
		this.team = team;
		this.position = position;
		
		this.wheel = new Wheel(params.wheel, 8);
		this.hpPool = new Pool(params.hp, params.hp);
		this.manaPool = new Pool(params.mana, params.mana);
		this.alacrityPool = new FloatPool(0, 100);
		
		this.strength = params.strength;
		this.flow = params.flow;
		this.intellect = params.intellect;
		
		this.buffQueue = subparams != null? subparams.buffQueue : new BuffQueue();
		
		this.damageIn = subparams != null? subparams.damageIn : new Linear(1, 0);
		this.damageOut = subparams != null? subparams.damageOut : new Linear(1, 0);
		this.healIn = subparams != null? subparams.healIn : new Linear(1, 0);
		this.healOut = subparams != null? subparams.healOut : new Linear(1, 0);
		
		this.critChance = subparams != null? subparams.critChance : new Linear(0, 0);
		this.critDamage = subparams != null? subparams.critDamage : new Linear(1, 0);
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
		return manaPool.value >= wheel.getActive(abilityNum).manacost;
	}
	
	public inline function isPlayer():Bool
	{
		return switch (id)
		{
			case ID.Player(v): true;
			default: false;
		};
	}
	
	public inline function same(unit:Unit):Bool
	{
		return team == unit.team && position == unit.position;
	}
	
}