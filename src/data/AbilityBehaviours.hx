package data;
import utils.DamageSource;
import utils.Element;
import utils.UnitType;

/**
 * [STATIC_SERVICE] Uses ability by id (for ability ids)
 * @author Gulvan
 */
class AbilityBehaviours 
{
	
	public static function useAbility(id:String, target:BattleUnit, caster:BattleUnit, element:Element)
	{
		switch (id)
		{
			//Basic
			case "ability_quick_strike":
				quickStrike(target, caster, element);
			case "ability_heal":
				heal(target, caster, element);
			case "ability_dark_pact":
				darkPact(target, caster, element);
			//Lg
			case "ability_shock_therapy":
				shockTherapy(target, caster, element);
			case "ability_high_voltage":
				highVoltage(target, caster, element);
			case "ability_electrical_storm":
				electricalStorm(target, caster, element);
			case "ability_charge":
				charge(target, caster, element);
			//Fi
			case "ability_burn":
				burn(target, caster, element);
			case "ability_affliction":
				affliction(target, caster, element);
			case "ability_replenish":
				replenish(caster, element);
			case "ability_in_flames":
				inFlames(caster, element);
			//Tr
			case "ability_kick":
				kick(target, caster, element);
			case "ability_throw_stone":
				throwStone(target, caster, element);
			case "ability_nature_heal":
				natureHeal(target, caster, element);
			case "ability_stone_form":
				stoneForm(caster, element);
			//End
			case "ability_stub":
				stub();
			default:
				trace("No ability with such ID: " + id);
				throw 0;
		}
	}
	
	//================================================================================
    // Basic
    //================================================================================
	
	private static function quickStrike(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var damage:Int = 30;
		
		BattleController.instance.changeUnitHP(target, caster, -damage, element, DamageSource.Ability);
	}
	
	private static function heal(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var heal:Int = 50;
		
		BattleController.instance.changeUnitHP(target, caster, heal, element, DamageSource.Ability);
	}
	
	private static function darkPact(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var selfDamage:Int = caster.intellect * 10 + 10;
		var enemyDamage:Int = selfDamage * 2;
		
		BattleController.instance.changeUnitHP(target, caster, -enemyDamage, element, DamageSource.Ability);
		BattleController.instance.changeUnitHP(caster, caster, -selfDamage, element, DamageSource.Ability);
	}
	
	//================================================================================
    // Lg
    //================================================================================
	
	private static function shockTherapy(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var delta:Int = 20 + caster.intellect * 20;
		if (caster.figureRelation(target) == UnitType.Enemy)
			delta = -delta;
		
		BattleController.instance.changeUnitHP(target, caster, delta, element, DamageSource.Ability);
		BattleController.instance.dispellBuffs(target, [Element.Lightning]);
	}
	
	private static function highVoltage(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var damage:Int = 40 + caster.intellect * 10;
		
		BattleController.instance.changeUnitHP(target, caster, -damage, element, DamageSource.Ability);
		BattleController.instance.castBuff("buff_conductivity", target, caster, 2);
	} 
	
	private static function electricalStorm(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var delta:Int = switch (target.buffQueue.elementalCount(Element.Lightning))
		{
			case 0: 25 + 10 * caster.intellect;
			case 1: -(20 + 10 * caster.intellect);
			default: -(70 + 20 * caster.intellect);
		}
		
		BattleController.instance.changeUnitHP(target, caster, delta, element, DamageSource.Ability);
	} 
	
	private static function charge(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		var damage:Int = 30 + caster.intellect * 10;
		
		BattleController.instance.changeUnitHP(target, caster, -damage, element, DamageSource.Ability);
		BattleController.instance.castBuff("buff_charged", target, caster, 3);
	} 
	
	//================================================================================
    // Fi
    //================================================================================
	
	private static function burn(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	}
	
	private static function affliction(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	} 
	
	private static function replenish(caster:BattleUnit, element:Element)
	{
		
	} 
	
	private static function inFlames(caster:BattleUnit, element:Element)
	{
		
	}
	
	//================================================================================
    // Tr
    //================================================================================
	
	private static function kick(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	}
	
	private static function throwStone(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	} 
	
	private static function natureHeal(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	} 
	
	private static function stoneForm(caster:BattleUnit, element:Element)
	{
		
	}
	
	//================================================================================
    // End
    //================================================================================
	
	private static function stub()
	{
		//No action
	}
	
}