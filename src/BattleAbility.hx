package;
import data.AbilityBehaviours;
import data.AbilityParameters;
import returns.ParamsAbility;
import utils.Countdown;
import utils.DamageSource;
import utils.Pool;

/**
 * model OF ability IN battle
 * @author Gulvan
 */
class BattleAbility 
{

	public var id(default, null):String;
	
	private var _cooldown:Countdown;
	public var cooldown(get, null):Int;
	
	public var manacost(default, null):Int;
	
	public function use(target:BattleUnit, caster:BattleUnit):Bool
	{
		if (_cooldown.value == 0 && id != "ability_empty")
		{
			AbilityBehaviours.useAbility(id, target, caster); 
			BattleController.instance.changeUnitMana(caster, caster, -manacost, DamageSource.God);
			_cooldown.value = _cooldown.keyValue;
			return true;
		}
		return false;
	}
	
	public function tick()
	{
		if (_cooldown.value > 0)
			_cooldown.value--;
	}
	
	public function new(id:String) 
	{
		this.id = id;
		if (id != "ability_empty" && id != "ability_locked")
		{
			var params:ParamsAbility = AbilityParameters.getParametersByID(id);
			_cooldown = new Countdown(params.delay, params.cooldown);
			manacost = params.manacost;
		}
	}
	
	function get_cooldown():Int
	{
		return _cooldown.value;
	}
	
}