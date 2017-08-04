package data;
import utils.DamageSource;
import utils.Element;

/**
 * [STATIC_SERVICE] Returns .use() method by id (for ability ids)
 * @author Gulvan
 */
class AbilityBehaviours 
{
	
	public static function useAbility(id:String, target:BattleUnit, caster:BattleUnit)
	{
		var element:Element = AbilityParameters.getElementByID(id);
		switch (id)
		{
			case "ability_quick_strike":
				quickStrike(target, caster, element);
			case "ability_heal":
				heal(target, caster, element);
			case "ability_dark_pact":
				darkPact(target, caster, element);
			default:
				trace("No ability with such ID: " + id);
				throw 0;
		}
	}
	
	private static function quickStrike(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var damage:Int = 40;
		
		BattleController.instance.changeUnitHP(target, caster, -damage, element, DamageSource.Ability);
	}
	
	private static function heal(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var heal:Int = 50;
		
		BattleController.instance.changeUnitHP(target, caster, heal, element, DamageSource.Ability);
	}
	
	private static function darkPact(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var selfDamage:Int = caster.intellect * 10 + 20;
		var enemyDamage:Int = selfDamage * 2;
		
		BattleController.instance.changeUnitHP(target, caster, -enemyDamage, element, DamageSource.Ability);
		BattleController.instance.changeUnitHP(caster, caster, -selfDamage, element, DamageSource.Ability);
	}
	
}