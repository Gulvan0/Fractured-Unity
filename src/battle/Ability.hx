package battle;
import battle.data.Abilities;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.struct.Countdown;
import battle.enums.DamageSource;
import battle.enums.Element;
import battle.struct.Pool;
import battle.enums.UnitType;

/**
 * model OF ability IN battle
 * @author Gulvan
 */
class Ability 
{

	public var id(default, null):String;
	public var name(default, null):String;
	public var describition(default, null):String;
	public var type(default, null):battle.enums.AbilityType;
	public var possibleTarget(default, null):battle.enums.AbilityTarget;
	public var element(default, null):battle.enums.Element;
	
	private var _cooldown:Countdown;
	public var cooldown(get, null):Int;
	public var manacost(default, null):Int;
	
	public function use(target:Unit, caster:Unit)
	{
		Abilities.useAbility(id, target, caster, element); 
		Controller.instance.changeUnitMana(caster, caster, -manacost, battle.enums.DamageSource.God);
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
			var params:AbilityParameters = Abilities.getParametersByID(id);
			
			this.name = params.name;
			this.describition = params.describition;
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
	
	public inline function checkValidity(target:Unit, caster:Unit):Bool
	{
		var relation:battle.enums.UnitType = caster.figureRelation(target);
		switch (possibleTarget)
		{
			case battle.enums.AbilityTarget.Enemy:
				return relation == battle.enums.UnitType.Enemy;
			case battle.enums.AbilityTarget.Allied:
				return relation == battle.enums.UnitType.Ally || relation == battle.enums.UnitType.Self;
			case battle.enums.AbilityTarget.Self:
				return relation == battle.enums.UnitType.Self;
			case battle.enums.AbilityTarget.All:
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