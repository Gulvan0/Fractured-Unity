package battle;
import battle.enums.AbilityTarget;
import battle.enums.StrikeType;
import battle.enums.UnitType;
import battle.struct.Countdown;

/**
 * Active ability
 * @author Gulvan
 */
class Active extends Ability 
{
	
	public var strikeType(default, null):StrikeType;
	public var possibleTarget(default, null):AbilityTarget;
	public var aoe(default, null):Bool;
	
	private var _cooldown:Countdown;
	public var cooldown(get, null):Int;
	public var maxCooldown(get, null):Int;
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
		super(id);
		
		if (!checkEmpty() && id != ID.NullID)
		{
			this._cooldown = new Countdown(XMLUtils.parseAbility(id, "delay", 0), XMLUtils.parseAbility(id, "cooldown", 0));
			this.manacost = XMLUtils.parseAbility(id, "manacost", 0);
			this.possibleTarget = XMLUtils.parseAbility(id, "target", AbilityTarget.All);
			this.strikeType = XMLUtils.parseAbility(id, "strike", StrikeType.Bolt);
			this.aoe = XMLUtils.parseAbility(id, "aoe", true);
		}
	}
	
	//================================================================================
    // Checkers
    //================================================================================
	
	public inline function checkOnCooldown():Bool
	{
		return _cooldown.value > 0;
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
	
	function get_maxCooldown():Int
	{
		return _cooldown.keyValue;
	}
	
}