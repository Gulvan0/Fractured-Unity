package battle;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.struct.Countdown;
import battle.enums.Source;
import Element;
import battle.struct.Pool;
import battle.enums.UnitType;
import battle.data.Abilities;
import battle.struct.UnitCoords;

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
	
	public function putOnCooldown()
	{
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
		if (!checkEmpty() && id != ID.NullID)
		{
			this.name = XMLUtils.parseAbility(id, "name", "");
			this.description = XMLUtils.parseAbility(id, "description", "");
			this.type = XMLUtils.parseAbility(id, "type", AbilityType.Bolt);
			this._cooldown = new Countdown(XMLUtils.parseAbility(id, "delay", 0), XMLUtils.parseAbility(id, "cooldown", 0));
			this.manacost = XMLUtils.parseAbility(id, "manacost", 0);
			this.possibleTarget = XMLUtils.parseAbility(id, "target", AbilityTarget.All);
			this.element = XMLUtils.parseAbility(id, "element", Element.Physical);
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
	
	public inline function checkValidity(relation:UnitType):Bool
	{
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