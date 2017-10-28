package battle;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.struct.Countdown;
import battle.enums.DamageSource;
import Element;
import battle.struct.Pool;
import battle.enums.UnitType;
import battle.data.Abilities;

/**
 * model OF ability IN battle
 * @author Gulvan
 */
class Ability 
{

	public var id(default, null):ID;
	public var name(default, null):String;
	public var description(default, null):String;
	public var type(default, null):AbilityType;
	public var possibleTarget(default, null):AbilityTarget;
	public var element(default, null):Element;
	
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
	
	public function new(id:ID) 
	{
		this.id = id;
		if (!checkEmpty())
		{
			this.name = XMLUtils.parseAbility(id, "name");
			this.description = XMLUtils.parseAbility(id, "description");
			this.type = XMLUtils.parseAbility(id, "type");
			this._cooldown = new Countdown(XMLUtils.parseAbility(id, "delay"), XMLUtils.parseAbility(id, "cooldown"));
			this.manacost = XMLUtils.parseAbility(id, "manacost");
			this.possibleTarget = XMLUtils.parseAbility(id, "target");
			this.element = XMLUtils.parseAbility(id, "element");
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
		return id == ID.EmptyAbility || id == ID.LockAbility;
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