package battle.data;
import battle.IMutableModel;
import battle.Model;
import battle.Unit;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.Source;
import Element;
import battle.enums.UnitType;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import haxe.Constraints.Function;

/**
 * Use ability by id
 * @author Gulvan
 */

class Abilities 
{
	private static var model:IMutableModel;
	private static var flag:Bool = true;
	
	public static function setModel(m:IMutableModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to rewrite model";
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
		
		Reflect.callMethod(func, func, [model.getUnits().get(target), model.getUnits().get(caster), element]);
	}
	
	//================================================================================
    // Lg
    //================================================================================
	
	private static function shockTherapy(target:Unit, caster:Unit, element:Element)
	{
		var delta:Int = 20 + caster.intellect * 20;
		if (caster.figureRelation(target) == UnitType.Enemy)
			delta = -delta;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), delta, element, Source.Ability);
		model.dispellBuffs(UnitCoords.get(target), [Element.Lightning]);
	}
	
	private static function highVoltage(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 40 + caster.intellect * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.castBuff(ID.BuffLgConductivity, UnitCoords.get(target), UnitCoords.get(caster), 2);
	} 
	
	private static function electricalStorm(target:Unit, caster:Unit, element:Element)
	{
		var delta:Int = switch (target.buffQueue.elementalCount(Element.Lightning))
		{
			case 0: 25 + 10 * caster.intellect;
			case 1: -(20 + 10 * caster.intellect);
			default: -(70 + 20 * caster.intellect);
		}
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), delta, element, Source.Ability);
	} 
	
	private static function charge(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 30 + caster.intellect * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.castBuff(ID.BuffLgCharged, UnitCoords.get(target), UnitCoords.get(caster), 3);
	}
	
	private static function disrupt(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 50 + caster.intellect * 5;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.dispellBuffs(UnitCoords.get(target));
		model.castBuff(ID.BuffLgClarity, UnitCoords.get(caster), UnitCoords.get(caster), 2);
	}
	
	//================================================================================
    // Bots
    //================================================================================
	
	private static function ghostStrike(target:Unit, caster:Unit, element:Element)
	{
		var damage:Int = 30 + caster.strength * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
	}
	
	//================================================================================
    // End
    //================================================================================
	
	private static function stub(target:Unit, caster:Unit, element:Element)
	{
		//No action
	}
	
}