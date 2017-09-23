package battle;
import data.*;
import battle.Ability;
import battle.Model;
import battle.data.Stages;
import battle.struct.UnitCoords;
import hxassert.Assert;
import openfl.display.Sprite;
import battle.enums.DamageSource;
import battle.enums.Element;
import battle.enums.InputMode;
import battle.enums.Team;

/**
 * [ROOT] controller OF APP IN battle
 * @author Gulvan
 */
class Controller extends Sprite
{
	
	public static var instance:Controller;
	
	private var model:Model;
	private var vision:battle.Vision;
	
	public var inputMode:battle.enums.InputMode;
	
	private var chosenAbility:Int;
	
	private var targetInProcess:UnitCoords;
	private var casterInProcess:UnitCoords;
	private var abilityInProcess:battle.Ability;
	
	//================================================================================
    // Levers
    //================================================================================
	
	public function changeUnitHP(target:battle.Unit, caster:battle.Unit, delta:Int, element:battle.enums.Element, source:battle.enums.DamageSource)
	{
		var finalValue:Int = model.changeUnitHP(target, caster, delta, source);
		vision.changeUnitHP(target, finalValue, element, source);
		
		if (target.hpPool.value == 0)
			vision.die(new UnitCoords(target.team, target.position));
	}
	
	public function changeUnitMana(target:battle.Unit, caster:battle.Unit, delta:Int, source:battle.enums.DamageSource)
	{
		var finalValue:Int = model.changeUnitMana(target, caster, delta, source);
		vision.changeUnitMana(target, finalValue);
	}
	
	public function castBuff(id:String, target:battle.Unit, caster:battle.Unit, duration:Int)
	{
		model.castBuff(id, target, caster, duration);
		vision.castBuff(id, duration);
	}
	
	public function dispellBuffs(target:battle.Unit, ?elements:Array<battle.enums.Element>, ?count:Int = -1)
	{
		var newBuffArray:Array<battle.Buff> = model.dispellBuffs(target, elements, count);
		vision.redrawBuffs(target, newBuffArray);
	}
	
	//================================================================================
    // Player prelude use methods
    //================================================================================
	
	public function choose(abilityNum:Int)
	{
		switch (model.checkChoose(abilityNum))
		{
			case ChooseResult.Ok:
				inputMode = battle.enums.InputMode.Targeting;
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
				inputMode = battle.enums.InputMode.None;
				vision.target(targetCoords);
				vision.deselectAbility(chosenAbility);
				useAbility(targetCoords, new UnitCoords(battle.enums.Team.Left, 0), model.getPlayerAbility(chosenAbility));
				chosenAbility = -1;
			case TargetResult.Invalid:
				vision.printWarning("Chosen ability cannot be used on this target");
				vision.deselectAbility(chosenAbility);
				chosenAbility = -1;
				inputMode = battle.enums.InputMode.Choosing;
			case TargetResult.Nonexistent, TargetResult.Dead:
				//Ignore silently
		}
	}
	
	//================================================================================
    // Common ability use methods
    //================================================================================	
	
	public function useAbility(target:UnitCoords, caster:UnitCoords, ability:battle.Ability)
	{
		targetInProcess = target;
		casterInProcess = caster;
		abilityInProcess = ability;
		vision.abilityIntro(target, caster, {type:ability.type, element:ability.element}, postIntroUse);
	}
	
	private function postIntroUse()
	{
		if (model.checkUse(targetInProcess, casterInProcess, abilityInProcess) == UseResult.Miss)
			vision.unitMiss(targetInProcess, abilityInProcess.element);
		else
			model.useAbility(targetInProcess, casterInProcess, abilityInProcess);
		
		vision.abilityOutro(targetInProcess, casterInProcess, {id:abilityInProcess.id, type:abilityInProcess.type}, processStep);
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
    // Cycle control
    //================================================================================
	
	private function processStep()
	{
		trace("Controller processing step");
		switch (model.processCurrent())
		{
			case ProcessResult.Throw:
				end(model.defineWinner());
			case ProcessResult.Last:
				inputMode = battle.enums.InputMode.Choosing;
			case ProcessResult.NotLast:
				//No action
		}
	}
	
	public function skipTurnAttempt():Bool
	{
		if (inputMode != battle.enums.InputMode.None)
		{
			inputMode = battle.enums.InputMode.None;
			processStep();
			return true;
		}
		
		return false;
	}
	
	public function end(winner:Null<battle.enums.Team>)
	{
		inputMode = battle.enums.InputMode.None;
		
		if (winner == battle.enums.Team.Left)
			vision.printWarning("You won!!!");
		else if (winner == battle.enums.Team.Right)
			vision.printWarning("You lost(");
		else 
			vision.printWarning("A draw...");
	}
	
	public function init(zone:Int, stage:Int, allies:Array<battle.Unit>)
	{
		var enemyIDs:Array<String> = Stages.getEnemiesByStage(zone, stage);
		var enemies:Array<battle.Unit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(new battle.Unit(enemyIDs[i], battle.enums.Team.Right, i));
			
		model = new Model(allies, enemies);
		vision = new battle.Vision();
		addChild(vision);
		vision.init(zone, allies, enemies);
		
		chosenAbility = -1;
		inputMode = battle.enums.InputMode.Choosing;
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
}