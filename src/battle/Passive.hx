package battle;
import battle.data.Passives.BattleEvent;
import battle.enums.PassiveType;

/**
 * Passive ability
 * @author Gulvan
 */
class Passive extends Ability 
{

	public var passiveType(default, null):PassiveType;
	public var triggers(default, null):Array<BattleEvent>;
	
	public function reactsTo(event:BattleEvent):Bool
	{
		for (e in triggers)
			if (e == event)
				return true;
		return false;
	}
	
	public function new(id:ID) 
	{
		super(id);
		this.passiveType = XMLUtils.parseAbility(id, "ptype", PassiveType.Both);
		if (passiveType != PassiveType.Attributes)
			this.triggers = XMLUtils.parsePassiveTriggers(id);
		else
			this.triggers = [];
	}
	
}