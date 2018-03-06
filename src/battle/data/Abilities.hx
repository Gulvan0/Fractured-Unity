package battle.data;
import battle.Unit;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.Source;
import Element;
import battle.enums.UnitType;
import battle.struct.UnitArrays;
import battle.struct.UnitCoords;
import haxe.Constraints.Function;

/**
 * [STATIC_SERVICE] Uses ability by id (for ability ids)
 * @author Gulvan
 */

class Abilities 
{
	private static var units:UnitArrays;
	private static var flag:Bool = true;
	
	public static function setUnits(unitarr:UnitArrays)
	{
		if (flag)
		{
			units = unitarr;
			flag = false;
		}
		else
			throw "Attempt to rewrite unit arrays";
	}
	
	public static function useAbility(id:ID, target:UnitCoords, caster:UnitCoords, element:Element)
	{
		var func:Null<Function> = switch (id)
		{
			case ID.LgShockTherapy:
				shockTherapy;
			case ID.LgHighVoltage:
				highVoltage;
			case ID.LgElectricalStorm:
				electricalStorm;
			case ID.LgCharge:
				charge;
			case ID.BoGhostStrike:
				ghostStrike;
			case ID.StubAbility:
				stub;
			default:
				null;
		}
		
		if (func == null)
			throw "Abilities->useAbility() exception: Invalid ID: " + id.getName();
		
		Reflect.callMethod(func, func, [units.getUnit(target), units.getUnit(caster), element]);
	}
	
	//================================================================================
    // Lg
    //================================================================================
	
	private static function shockTherapy(target:Unit, caster:Unit, element:Element)
	{
		var delta:Int = 20 + caster.intellect * 20;
		if (caster.figureRelation(target) == UnitType.Enemy)
			delta = -delta;
		
		Controller.instance.changeUnitHP(target, caster, delta, element, Source.Ability);
		Controller.instance.dispellBuffs(target, [Element.Lightning]);
	}
	
	private static function highVoltage(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 40 + caster.intellect * 10;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, Source.Ability);
		Controller.instance.castBuff(ID.BuffLgConductivity, target, caster, 2);
	} 
	
	private static function electricalStorm(target:Unit, caster:Unit, element:Element)
	{
		var delta:Int = switch (target.buffQueue.elementalCount(Element.Lightning))
		{
			case 0: 25 + 10 * caster.intellect;
			case 1: -(20 + 10 * caster.intellect);
			default: -(70 + 20 * caster.intellect);
		}
		
		Controller.instance.changeUnitHP(target, caster, delta, element, Source.Ability);
	} 
	
	private static function charge(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 30 + caster.intellect * 10;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, Source.Ability);
		Controller.instance.castBuff(ID.BuffLgCharged, target, caster, 3);
	}
	
	private static function disrupt(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 50 + caster.intellect * 5;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, Source.Ability);
		Controller.instance.dispellBuffs(target);
		Controller.instance.castBuff(ID.BuffLgClarity, caster, caster, 2);
	}
	
	//================================================================================
    // Bots
    //================================================================================
	
	private static function ghostStrike(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 30 + caster.strength * 10;
		
		Controller.instance.changeUnitHP(target, caster, -damage, element, Source.Ability);
	}
	
	//================================================================================
    // End
    //================================================================================
	
	private static function stub(target:Unit, caster:Unit, element:Element)
	{
		//No action
	}
	
}