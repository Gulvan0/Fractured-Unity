package battle;
import battle.Unit;
import battle.data.Buffs;
import battle.enums.BuffMode;
import battle.struct.Countdown;
import Element;
import battle.struct.UnitCoords;

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
	
	public var owner(default, null):UnitCoords;
	public var caster(default, null):UnitCoords;
	
	public var duration(default, null):Int;
	
	public function tickAndCheckEnded():Bool
	{
		if (isOverTime)
			act(BuffMode.OverTime);
		duration--;
		
		return (duration == 0)? true : false;
	}
	
	public function onCast()
	{
		act(BuffMode.Cast);
	}
	
	public function onEnd()
	{
		act(BuffMode.End);
	}
	
	private function act(mode:BuffMode)
	{
		Buffs.useBuff(id, owner, caster, element, mode);
	}
	
	public function new(id:ID, target:UnitCoords, caster:UnitCoords, duration:Int) 
	{
		this.id = id;
		
		this.name = XMLUtils.parseBuff(id, "name", "");
		this.description = XMLUtils.parseBuff(id, "description", "");
		this.element = XMLUtils.parseBuff(id, "element", Element.Physical);
		this.isOverTime = XMLUtils.parseBuff(id, "isOverTime", true);
		this.isStackable = XMLUtils.parseBuff(id, "isStackable", true);
		
		this.owner = target;
		this.caster = caster;
		
		this.duration = duration;
	}
	
}