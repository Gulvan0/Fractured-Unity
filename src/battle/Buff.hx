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

	public var id(default, null):String;
	public var name(default, null):String;
	public var describition(default, null):String;
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
	
	private function act(mode:battle.enums.BuffMode)
	{
		Buffs.useBuff(id, owner, caster, element, mode);
	}
	
	public function new(id:String, target:battle.Unit, caster:battle.Unit, duration:Int) 
	{
		var params:BuffParameters = Buffs.getParametersByID(id);
		
		this.id = id;
		this.name = params.name;
		this.describition = params.describition;
		this.element = params.element;
		this.isOverTime = params.isOverTime;
		this.isStackable = params.isStackable;
		
		this.owner = target;
		this.caster = caster;
		
		this.duration = duration;
	}
	
}