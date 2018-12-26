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
	public var element(default, null):Element;
	
	public function new(id:ID) 
	{
		this.id = id;
		if (!checkEmpty() && id != ID.NullID)
		{
			this.name = XMLUtils.parseAbility(id, "name", "");
			this.description = XMLUtils.parseAbility(id, "description", "");
			this.type = XMLUtils.parseAbility(id, "type", AbilityType.Active);
			this.element = XMLUtils.parseAbility(id, "element", Element.Physical);
		}
	}
	
	public inline function checkEmpty():Bool
	{
		return id == ID.EmptyAbility || id == ID.LockAbility;
	}
	
}