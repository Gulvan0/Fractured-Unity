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
	
	private static var target:Unit;
	private static var caster:Unit;
	private static var element:Element;
	
	public static function init(m:IMutableModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to re-init";
	}
	
	public static function useAbility(id:ID, targetCoords:UnitCoords, casterCoords:UnitCoords, e:Element)
	{
		target = model.getUnits().get(targetCoords);
		caster = model.getUnits().get(casterCoords);
		element = e;
		
		switch (id)
		{
			case ID.LgShockTherapy:
				shockTherapy();
			case ID.LgHighVoltage:
				highVoltage();
			case ID.LgElectricalStorm:
				electricalStorm();
			case ID.LgCharge:
				charge();
			case ID.BoGhostStrike:
				ghostStrike();
			case ID.StubAbility:
				stub();
			default:
				throw "Abilities->useAbility() exception: Invalid ID: " + id.getName();
		}
	}
	
	//================================================================================
    // Lg
    //================================================================================
	
	private static function shockTherapy()
	{
		var delta:Int = 20 + caster.intellect * 20;
		if (caster.figureRelation(target) == UnitType.Enemy)
			delta = -delta;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), delta, element, Source.Ability);
		model.dispellBuffs(UnitCoords.get(target), [Element.Lightning]);
	}
	
	private static function highVoltage()
	{
		var damage:Int = 40 + caster.intellect * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.castBuff(ID.BuffLgConductivity, UnitCoords.get(target), UnitCoords.get(caster), 2);
	} 
	
	private static function electricalStorm()
	{
		var delta:Int = switch (target.buffQueue.elementalCount(Element.Lightning))
		{
			case 0: 25 + 10 * caster.intellect;
			case 1: -(20 + 10 * caster.intellect);
			default: -(70 + 20 * caster.intellect);
		}
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), delta, element, Source.Ability);
	} 
	
	private static function charge()
	{
		var damage:Int = 30 + caster.intellect * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.castBuff(ID.BuffLgCharged, UnitCoords.get(target), UnitCoords.get(caster), 3);
	}
	
	private static function disrupt()
	{
		var damage:Int = 50 + caster.intellect * 5;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
		model.dispellBuffs(UnitCoords.get(target));
		model.castBuff(ID.BuffLgClarity, UnitCoords.get(caster), UnitCoords.get(caster), 2);
	}
	
	//================================================================================
    // Bots
    //================================================================================
	
	private static function ghostStrike()
	{
		var damage:Int = 30 + caster.strength * 10;
		
		model.changeHP(UnitCoords.get(target), UnitCoords.get(caster), -damage, element, Source.Ability);
	}
	
	//================================================================================
    // End
    //================================================================================
	
	private static function stub()
	{
		//No action
	}
	
}