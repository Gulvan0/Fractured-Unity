package;
import data.AbilityBehaviours;
import data.AbilityParameters;
import dataobj.ParamsAbility;
import utils.AbilityTarget;
import utils.AbilityType;
import utils.Countdown;
import utils.DamageSource;
import utils.Element;
import utils.Pool;
import utils.UnitType;

/**
 * model OF ability IN battle
 * @author Gulvan
 */
class BattleAbility 
{

	public var id(default, null):String;
	public var name(default, null):String;
	public var describition(default, null):String;
	public var type(default, null):AbilityType;
	public var possibleTarget(default, null):AbilityTarget;
	public var element(default, null):Element;
	
	private var _cooldown:Countdown;
	public var cooldown(get, null):Int;
	public var manacost(default, null):Int;
	
	public function use(target:BattleUnit, caster:BattleUnit)
	{
		AbilityBehaviours.useAbility(id, target, caster, element); 
		BattleController.instance.changeUnitMana(caster, caster, -manacost, DamageSource.God);
		_cooldown.value = _cooldown.keyValue;
	}
	
	public function tick()
	{
		if (checkOnCooldown())
			_cooldown.value--;
	}
	
	public function new(id:String) 
	{
		this.id = id;
		if (!checkEmpty())
		{
			var params:ParamsAbility = AbilityParameters.getParametersByID(id);
			
			this.name = params.name;
			this.describition = params.decribition;
			this.type = params.type;
			this._cooldown = new Countdown(params.delay, params.cooldown);
			this.manacost = params.manacost;
			this.possibleTarget = params.target;
			this.element = params.element;
		}
	}
	
	//================================================================================
    // Checkers
    //================================================================================
	
	public inline function checkOnCooldown():Bool
	{
		return _cooldown.value > 0;
	}
	
	public inline function checkEmpty():Bool
	{
		return id == "ability_empty" || id == "ability_locked";
	}
	
	public inline function checkValidity(target:BattleUnit, caster:BattleUnit):Bool
	{
		var relation:UnitType = caster.figureRelation(target);
		switch (possibleTarget)
		{
			case AbilityTarget.Enemy:
				return relation == UnitType.Enemy;
			case AbilityTarget.Allied:
				return relation == UnitType.Ally || relation == UnitType.Self;
			case AbilityTarget.Self:
				return relation == UnitType.Self;
			case AbilityTarget.All:
				return true;
			default:
				return false;
		}
	}
	
	//================================================================================
    // Getters
    //================================================================================
	
	function get_cooldown():Int
	{
		return _cooldown.value;
	}
	
}