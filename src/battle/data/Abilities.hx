package battle.data;
import battle.Unit;
import battle.data.Abilities.AbilityParameters;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.DamageSource;
import Element;
import battle.enums.UnitType;

/**
 * [STATIC_SERVICE] Uses ability by id (for ability ids)
 * @author Gulvan
 */

typedef AbilityParameters = {
	var name:String;
	var describition:String;
	var type:battle.enums.AbilityType;
	var cooldown:Int;
	var delay:Int;
	var manacost:Int;
	var target:battle.enums.AbilityTarget;
	var element:Element;
}

class Abilities 
{
	
	//================================================================================
    // Properties
    //================================================================================
	
	public static function getParametersByID(id:String):AbilityParameters
	{
		var parameters:AbilityParameters = {name:"", describition:"", type:AbilityType.Kick, cooldown:-1, delay:-1, manacost:-1, target:AbilityTarget.All, element:Element.Physical}
		
		switch (id)
		{
			//Basic
			case "ability_quick_strike":
				parameters.name = "Quick Strike";
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Physical;
			case "ability_heal":
				parameters.name = "Heal";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Allied;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Natura;
			case "ability_dark_pact":
				parameters.name = "Dark Pact";
				parameters.cooldown = 2;
				parameters.delay = 1;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Shadow;
			//Lg
			case "ability_shock_therapy":
				parameters.name = "Shock Therapy";
				parameters.describition = "Deal damage equal to 20 + 20% of your intellect or heal for the same amount if used on an ally";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 60;
				parameters.target = AbilityTarget.All;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			case "ability_high_voltage":
				parameters.name = "High Voltage";
				parameters.describition = "Deal damage equal to 40 + 10% of your intellect and cause target to recieve 300% healing for several turns";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 40;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_electrical_storm":
				parameters.name = "Electrical Storm";
				parameters.describition = "Deal damage depending on how many Lightning buffs the target has";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 80;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Lightning;
			case "ability_charge":
				parameters.name = "Charge";
				parameters.describition = "Deal damage equal to 30 + 10% of your intellect and increase target's flow by 100% for 2 turns";
				parameters.cooldown = 3;
				parameters.delay = 0;
				parameters.manacost = 20;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Lightning;
			//Fi
			case "ability_burn":
				parameters.name = "Burn";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Fire;
			case "ability_affliction":
				parameters.name = "Affliction";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 50;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Fire;
			case "ability_replenish":
				parameters.name = "Replenish";
				parameters.cooldown = 10;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Fire;
			case "ability_in_flames":
				parameters.name = "In Flames";
				parameters.cooldown = 6;
				parameters.delay = 0;
				parameters.manacost = 10;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Fire;
			//Tr
			case "ability_kick":
				parameters.name = "Kick";
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Terra;
			case "ability_throw_stone":
				parameters.name = "Throw Stone";
				parameters.cooldown = 4;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Enemy;
				parameters.type = AbilityType.Bolt;
				parameters.element = Element.Terra;
			case "ability_nature_heal":
				parameters.name = "Nature Heal";
				parameters.cooldown = 2;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Allied;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Terra;
			case "ability_stone_form":
				parameters.name = "Stone Form";
				parameters.cooldown = 6;
				parameters.delay = 0;
				parameters.manacost = 70;
				parameters.target = AbilityTarget.Self;
				parameters.type = AbilityType.Spell;
				parameters.element = Element.Terra;
			//End
			case "ability_empty", "ability_stub":
				parameters.name = "Unnamed";
				parameters.cooldown = 0;
				parameters.delay = 0;
				parameters.manacost = 0;
				parameters.target = AbilityTarget.All;
				parameters.type = AbilityType.Kick;
				parameters.element = Element.Physical;
			default:
				trace("Incorrect ability ID: " + id);
				neko.Lib.rethrow(0);
		}
		
		return parameters;
	}
	
	//================================================================================
    // Functional
    //================================================================================
	
	public static function useAbility(id:String, target:battle.Unit, caster:battle.Unit, element:Element)
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
				neko.Lib.rethrow(0);
		}
	}
	
	//================================================================================
    // Basic
    //================================================================================
	
	private static function quickStrike(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var damage:Int = 30;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, battle.enums.DamageSource.Ability);
	}
	
	private static function heal(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var heal:Int = 50;
		
		Controller.instance.changeUnitHP(target, caster, heal, element, battle.enums.DamageSource.Ability);
	}
	
	private static function darkPact(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var selfDamage:Int = caster.intellect * 10 + 10;
		var enemyDamage:Int = selfDamage * 2;
		
		Controller.instance.changeUnitHP(target, caster, -enemyDamage, element, battle.enums.DamageSource.Ability);
		Controller.instance.changeUnitHP(caster, caster, -selfDamage, element, battle.enums.DamageSource.Ability);
	}
	
	//================================================================================
    // Lg
    //================================================================================
	
	private static function shockTherapy(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var delta:Int = 20 + caster.intellect * 20;
		if (caster.figureRelation(target) == battle.enums.UnitType.Enemy)
			delta = -delta;
		
		Controller.instance.changeUnitHP(target, caster, delta, element, battle.enums.DamageSource.Ability);
		Controller.instance.dispellBuffs(target, [Element.Lightning]);
	}
	
	private static function highVoltage(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var damage:Int = 40 + caster.intellect * 10;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, battle.enums.DamageSource.Ability);
		Controller.instance.castBuff("buff_conductivity", target, caster, 2);
	} 
	
	private static function electricalStorm(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var delta:Int = switch (target.buffQueue.elementalCount(Element.Lightning))
		{
			case 0: 25 + 10 * caster.intellect;
			case 1: -(20 + 10 * caster.intellect);
			default: -(70 + 20 * caster.intellect);
		}
		
		Controller.instance.changeUnitHP(target, caster, delta, element, battle.enums.DamageSource.Ability);
	} 
	
	private static function charge(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		var damage:Int = 30 + caster.intellect * 10;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, battle.enums.DamageSource.Ability);
		Controller.instance.castBuff("buff_charged", target, caster, 3);
	} 
	
	//================================================================================
    // Fi
    //================================================================================
	
	private static function burn(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		
	}
	
	private static function affliction(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		
	} 
	
	private static function replenish(caster:battle.Unit, element:Element)
	{
		
	} 
	
	private static function inFlames(caster:battle.Unit, element:Element)
	{
		
	}
	
	//================================================================================
    // Tr
    //================================================================================
	
	private static function kick(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		
	}
	
	private static function throwStone(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		
	} 
	
	private static function natureHeal(target:battle.Unit, caster:battle.Unit, element:Element)
	{
		
	} 
	
	private static function stoneForm(caster:battle.Unit, element:Element)
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