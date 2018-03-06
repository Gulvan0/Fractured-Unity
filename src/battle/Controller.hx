package battle;
import data.*;
import battle.Ability;
import battle.Model;
import battle.data.Abilities;
import battle.data.Buffs;
import battle.data.Units;
import battle.struct.UnitArrays;
import battle.struct.UnitCoords;
import hxassert.Assert;
import openfl.display.Sprite;
import battle.enums.Source;
import Element;
import battle.enums.InputMode;
import battle.enums.Team;

/**
 * [ROOT] controller OF APP IN battle
 * @author Gulvan
 */
class Controller extends Sprite
{
	
	public static var instance:Null<Controller>;
	private var model:Model;
	private var vision:Vision;
	
	public var inputMode:InputMode;
	
	private var chosenAbility:Int;
	private var uatarget:UnitCoords;
	private var uacaster:UnitCoords;
	private var uaability:Ability;
	private var uaiterator:Int;
	
	//================================================================================
    // Levers
    //================================================================================
	
	public function changeUnitHP(target:UnitCoords, caster:UnitCoords, dhp:Int, element:Element, source:Source)
	{
		var modelOutput:HPChangerOutput = model.changeUnitHP(target, caster, dhp, source);
		
		vision.changeUnitHP(target, modelOutput.dhp, element, modelOutput.crit, source);
		
		if (target.hpPool.value == 0)
			vision.die(UnitCoords.get(target));
	}
	
	public function changeUnitMana(target:UnitCoords, caster:UnitCoords, dmana:Int, source:Source)
	{
		var finalValue:Int = model.changeUnitMana(target, caster, dmana, source);
		
		vision.changeUnitMana(target, finalValue, source);
	}
	
	public function changeUnitAlacrity(target:UnitCoords, caster:UnitCoords, dalac:Float, source:Source)
	{
		var finalValue:Float = model.changeUnitAlacrity(target, caster, dalac, source);
		
		vision.changeUnitAlacrity(target, finalValue, source);
	}
	
	public function castBuff(id:ID, target:UnitCoords, caster:UnitCoords, duration:Int)
	{
		model.castBuff(id, target, caster, duration);
		vision.castBuff(id, duration);
	}
	
	public function dispellBuffs(target:UnitCoords, ?elements:Array<Element>, ?count:Int = -1)
	{
		var newBuffArray:Array<Buff> = model.dispellBuffs(target, elements, count);
		vision.redrawBuffs(target, newBuffArray);
	}
	
	//================================================================================
    // Triggering blocks
    //================================================================================
	
	public function choose(abilityNum:Int)
	{
		switch (model.checkChoose(abilityNum))
		{
			case ChooseResult.Ok:
				inputMode = InputMode.Targeting;
				chosenAbility = abilityNum;
				vision.selectAbility(abilityNum);
			case ChooseResult.Empty:
				vision.printWarning("There is no ability in this slot");
			case ChooseResult.Manacost:
				vision.printWarning("Not enough mana");
			case ChooseResult.Cooldown:
				vision.printWarning("This ability is currently on cooldown");
		}
	}
	
	public function use(targetCoords:UnitCoords)
	{
		switch (model.checkTarget(targetCoords, chosenAbility))
		{
			case TargetResult.Ok:
				inputMode = InputMode.None;
				
				vision.target(targetCoords);
				vision.deselectAbility(chosenAbility);
				
				setUA(targetCoords, UnitCoords.player(), model.getPlayerAbility(chosenAbility));
				
				chosenAbility = -1;
				
				useAbility();
			case TargetResult.Invalid:
				vision.printWarning("Chosen ability cannot be used on this target");
				vision.deselectAbility(chosenAbility);
				
				chosenAbility = -1;
				
				inputMode = InputMode.Choosing;
			case TargetResult.Nonexistent, TargetResult.Dead:
				//Ignore silently
		}
	}
	
	public function skipTurnAttempt():Bool
	{
		if (inputMode != InputMode.None)
		{
			inputMode = InputMode.None;
			model.postTurnProcess(UnitCoords.player());
			return true;
		}
		
		return false;
	}
	
	public function end(winner:Null<Team>)
	{
		inputMode = InputMode.None;
		
		if (winner == Team.Left)
			vision.printWarning("You won!!!");
		else if (winner == Team.Right)
			vision.printWarning("You lost(");
		else 
			vision.printWarning("A draw...");
			
		removeChild(vision);
		
		Main.onBattleOver();
	}
	
	//================================================================================
    // useAbility
    //================================================================================	
	
	public function useAbility()
	{
		switch (uaiterator++)
		{
			case 0:
				vision.abilityIntro(uatarget, uacaster, {type:uaability.type, element:uaability.element});
			case 1:
				if (model.checkUse(uatarget, uacaster, uaability) == UseResult.Miss)
					vision.unitMiss(uatarget, uaability.element);
				else
					uaability.use(uatarget, uacaster);
					
				vision.abilityOutro(uatarget, uacaster, {id:uaability.id, type:uaability.type});
			case 2:
				model.postTurnProcess(uacaster);
			default:
				clearUA();
				useAbility();
		}
	}
	
	public function setUA(target:UnitCoords, caster:UnitCoords, ability:Ability)
	{
		uatarget = target;
		uacaster = caster;
		uaability = ability;
	}
	
	private function clearUA()
	{
		uatarget = UnitCoords.nullC();
		uacaster = UnitCoords.nullC();
		uaability = new Ability(ID.NullID);
		uaiterator = 0;
	}
	
	//================================================================================
    // Info printers
    //================================================================================	
	
	public function printAbilityInfo(num:Int)
	{
		vision.printAbilityInfo(model.getAbilityInfo(num));
	}
	
	public function printUnitInfo(coords:UnitCoords)
	{
		vision.printUnitInfo(model.getUnitInfo(coords));
	}
	
	//================================================================================
    // INIT + Constructor
    //================================================================================	
	
	public function destroy()
	{
		instance = null;
	}
	
	public function init(zone:Int, stage:Int, allies:Array<Unit>)
	{
		var enemyIDs:Array<ID> = XMLUtils.parseStage(zone, stage);
		var enemies:Array<Unit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(new Unit(enemyIDs[i], Team.Right, i));
			
		var units:UnitArrays = new UnitArrays(allies, enemies);
		Abilities.setUnits(units);
		Buffs.setUnits(units);
		Units.setUnits(units);
			
		model = new Model(units);
		vision = new Vision();
		addChild(vision);
		vision.init(zone, allies, enemies);
		
		uatarget = UnitCoords.nullC();
		uacaster = UnitCoords.nullC();
		uaability = new Ability(ID.NullID);
		uaiterator = 0;
		
		model.alacrityIncrement();
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
}