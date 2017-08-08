package;
import data.AbilityBehaviours;
import data.AbilityParameters;
import returns.ParamsAbility;
import utils.AbilityType;
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
	public var type(default, null):AbilityType;
	
	private var _cooldown:Countdown;
	public var cooldown(get, null):Int;
	public var manacost(default, null):Int;
	
	public function use(target:BattleUnit, caster:BattleUnit)
	{
		AbilityBehaviours.useAbility(id, target, caster); 
		BattleController.instance.changeUnitMana(caster, caster, -manacost, DamageSource.God);
		_cooldown.value = _cooldown.keyValue;
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
			
			this.type = params.type;
			this._cooldown = new Countdown(params.delay, params.cooldown);
			this.manacost = params.manacost;
		}
	}
	
	function get_cooldown():Int
	{
		return _cooldown.value;
	}
	
}