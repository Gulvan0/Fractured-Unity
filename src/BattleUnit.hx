package;
import data.BotParameters;
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
	
	public var strength(default, null):Int;
	public var flow(default, null):Int;
	public var intellect(default, null):Int;
	
	public function useAbility(target:BattleUnit, abilityNum:Int)
	{
		Assert.require(abilityNum >= 0 && abilityNum <= 10);
		wheel.get(abilityNum).use(target, this);
	}
	
	public function tick()
	{
		wheel.tick();
	}
	
	public function new(id:String, team:Team, position:Int, ?parameters:Null<ParamsUnit>) 
	{
		Assert.require(position >= 0 && position <= 2);
		
		if (parameters == null)
			parameters = BotParameters.getParametersByID(id);
			
		this.id = id;
		this.team = team;
		this.position = position;
		
		this.name = parameters.name;
		this.wheel = new BattleWheel(parameters.wheel, 8);
		this.hpPool = new Pool(parameters.hp, parameters.hp);
		this.manaPool = new Pool(parameters.mana, parameters.mana);
		
		this.strength = parameters.strength;
		this.flow = parameters.flow;
		this.intellect = parameters.intellect;
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