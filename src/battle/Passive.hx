package battle;
import battle.data.Passives.BattleEvent;

/**
 * Passive ability
 * @author Gulvan
 */
class Passive extends Ability 
{
	
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
		this.triggers = XMLUtils.parseTriggers(id);
	}
	
}