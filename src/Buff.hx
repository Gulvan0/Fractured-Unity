package;
import data.BuffBehaviours;
import data.BuffParameters;
import dataobj.ParamsBuff;
import utils.BuffMode;
import utils.Countdown;
import utils.Element;

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
	
	public var owner(default, null):BattleUnit;
	public var caster(default, null):BattleUnit;
	
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
		BuffBehaviours.useBuff(id, owner, caster, element, mode);
	}
	
	public function new(id:String, target:BattleUnit, caster:BattleUnit, duration:Int) 
	{
		var params:ParamsBuff = BuffParameters.getParametersByID(id);
		
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