package battle;
import ID.AbilityID;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.struct.UnitCoords;
import struct.Element;

/**
 * ...
 * @author gulvan
 */
class Ability 
{

	public var id:AbilityID;
	public var name:String;
	public var type:AbilityType;
	public var element:Element;
	
	public var target:Null<AbilityTarget>;
	public var manacost:Null<Int>;
	public var cooldown:Null<Int>;
	public var delay:Null<Int>;
	
	public var curCooldown:Null<Int>;

	public function checkEmpty():Bool
	{
		return id == EmptyAbility || id == LockAbility;
	}
	
	public function checkOnCooldown():Bool
	{
		return curCooldown > 0;
	}
	
	public function checkValid(caster:UnitCoords, target:UnitCoords):Bool
	{
		if (this.target == null)
			return false;

		switch (this.target)
		{
			case AbilityTarget.Enemy:
				return caster.team != target.team;
			case AbilityTarget.Allied:
				return caster.team == target.team;
			case AbilityTarget.Self:
				return caster.equals(target);
			case AbilityTarget.All:
				return true;
		}
	}
	
	public function new()
	{
		
	}
	
}