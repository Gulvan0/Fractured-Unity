package battle;
import battle.Unit;
import battle.data.Buffs;
import battle.enums.BuffMode;
import battle.struct.Countdown;
import Element;

/**
 * model OF buff IN battle
 * @author Gulvan
 */
class Buff
{

	public var id(default, null):ID;
	public var name(default, null):String;
	public var description(default, null):String;
	public var element(default, null):Element;
	public var isOverTime(default, null):Bool;
	public var isStackable(default, null):Bool;
	
	public var owner(default, null):battle.Unit;
	public var caster(default, null):battle.Unit;
	
	public var duration(default, null):Int;
	
	public function tickAndCheckEnded():Bool
	{
		if (isOverTime)
			act(battle.enums.BuffMode.OverTime);
		duration--;
		
		return (duration == 0)? true : false;
	}
	
	public function onCast()
	{
		act(battle.enums.BuffMode.Cast);
	}
	
	public function onEnd()
	{
		act(battle.enums.BuffMode.End);
	}
	
	private function act(mode:BuffMode)
	{
		Buffs.useBuff(id, owner, caster, element, mode);
	}
	
	public function new(id:ID, target:Unit, caster:Unit, duration:Int) 
	{
		this.id = id;
		
		this.name = XMLUtils.parseBuff(id, "name", new String());
		this.description = XMLUtils.parseBuff(id, "description", new String());
		this.element = XMLUtils.parseBuff(id, "element", Element.Physical);
		this.isOverTime = XMLUtils.parseBuff(id, "isOverTime", true);
		this.isStackable = XMLUtils.parseBuff(id, "isStackable", true);
		
		this.owner = target;
		this.caster = caster;
		
		this.duration = duration;
	}
	
}