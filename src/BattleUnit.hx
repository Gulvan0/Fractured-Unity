package;
import data.UnitParameters;
import hxassert.Assert;
import dataobj.ParamsUnit;
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
	public var position(default, null):Int;
	
	public var wheel(default, null):BattleWheel;
	public var hpPool(default, null):Pool;
	public var manaPool(default, null):Pool;
	public var buffQueue(default, null):BuffQueue;
	
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	
	public var inputDamageMultiplier:Float;
	public var outputDamageMultiplier:Float;
	public var inputHealMultiplier:Float;
	public var outputHealMultiplier:Float;
	
	public function useAbility(target:BattleUnit, abilityNum:Int)
	{
		Assert.require(abilityNum >= 0 && abilityNum <= 10);
		wheel.get(abilityNum).use(target, this);
	}
	
	public function tick()
	{
		wheel.tick();
		buffQueue.tick();
	}
	
	public function new(id:String, team:Team, position:Int, ?parameters:Null<ParamsUnit>) 
	{
		Assert.require(position >= 0 && position <= 2);
		
		if (parameters == null)
			parameters = UnitParameters.getParametersByID(id);
			
		this.id = id;
		this.name = parameters.name;
		this.team = team;
		this.position = position;
		
		this.wheel = new BattleWheel(parameters.wheel, 8);
		this.hpPool = new Pool(parameters.hp, parameters.hp);
		this.manaPool = new Pool(parameters.mana, parameters.mana);
		this.buffQueue = new BuffQueue();
		
		this.strength = parameters.strength;
		this.flow = parameters.flow;
		this.intellect = parameters.intellect;
		
		this.inputDamageMultiplier = 1;
		this.outputDamageMultiplier = 1;
		this.inputHealMultiplier = 1;
		this.outputHealMultiplier = 1;
	}
	
	public function figureRelation(unit:BattleUnit):UnitType
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
	

}