package;
import data.*;
import dataobj.AbilityInfo;
import hxassert.Assert;
import openfl.display.Sprite;
import returns.BotDecision;
import returns.ChooseResult;
import returns.ProcessResult;
import returns.TargetResult;
import returns.UseResult;
import utils.BattleControllerUseMode;
import utils.DamageSource;
import utils.Element;
import utils.InputMode;
import utils.Team;

/**
 * [ROOT] controller OF APP IN battle
 * @author Gulvan
 */
class BattleController extends Sprite
{
	
	public static var instance:BattleController;
	
	private var model:BattleModel;
	private var vision:BattleVision;
	
	public var inputMode:InputMode;
	
	private var chosenAbility:Int;
	
	//================================================================================
    // Levers
    //================================================================================
	
	public function changeUnitHP(target:BattleUnit, caster:BattleUnit, delta:Int, element:Element, source:DamageSource)
	{
		var finalValue:Int = model.changeUnitHP(target, caster, delta, source);
		vision.changeUnitHP(target, finalValue, element, source);
		
		if (target.hpPool.value == 0)
			vision.die(target.team, target.position);
	}
	
	public function changeUnitMana(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource)
	{
		var finalValue:Int = model.changeUnitMana(target, caster, delta, source);
		vision.changeUnitMana(target, finalValue);
	}
	
	public function castBuff(id:String, target:BattleUnit, caster:BattleUnit, duration:Int)
	{
		model.castBuff(id, target, caster, duration);
		vision.castBuff(id, duration);
	}
	
	public function dispellBuffs(target:BattleUnit, ?elements:Array<Element>, ?count:Int = -1)
	{
		var newBuffArray:Array<Buff> = model.dispellBuffs(target, elements, count);
		vision.redrawBuffs(target, newBuffArray);
	}
	
	public function chooseAbility(num:Int)
	{
		switch (model.chooseAbility(num))
		{
			case ChooseResult.Ok:
				inputMode = InputMode.Targeting;
				chosenAbility = num;
				vision.selectAbility(num);
			case ChooseResult.Empty:
				vision.printWarning("There is no ability in this slot");
			case ChooseResult.Manacost:
				vision.printWarning("Not enough mana");
			case ChooseResult.Cooldown:
				vision.printWarning("This ability is currently on cooldown");
		}
	}
	
	public function target(team:Team, pos:Int)
	{
		switch (model.target(team, pos))
		{
			case TargetResult.Ok:
				inputMode = InputMode.None;
				vision.target(team, pos);
				vision.deselectAbility(chosenAbility);
				chosenAbility = -1;
				model.useChosenAbility(team, pos);
			case TargetResult.Invalid:
				vision.printWarning("Chosen ability cannot be used on this target");
				vision.deselectAbility(chosenAbility);
				chosenAbility = -1;
				inputMode = InputMode.Choosing;
			case TargetResult.Nonexistent, TargetResult.Dead:
				//Ignore silently
		}
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility, mode:BattleControllerUseMode)
	{
		if (mode == BattleControllerUseMode.Begin)
			vision.useAbility(target, caster, ability);
		else if (mode == BattleControllerUseMode.Continue)
		{
			if (model.useAbility(target, caster, ability) == UseResult.Miss)
				vision.unitMiss(target);
				
			processStep();
		}
	}
	
	public function printAbilityInfo(num:Int)
	{
		vision.printAbilityInfo(model.getAbilityInfo(num));
	}
	
	public function printUnitInfo(team:Team, pos:Int)
	{
		vision.printUnitInfo(model.getUnitInfo(team, pos));
	}
	
	//================================================================================
    // Cycle control
    //================================================================================
	
	private function processStep()
	{
		switch (model.processCurrent())
		{
			case ProcessResult.Thrown:
				end(model.defineWinner());
			case ProcessResult.Last:
				inputMode = InputMode.Choosing;
			case ProcessResult.NotLast:
				//No action
		}
	}
	
	public function skipTurnAttempt():Bool
	{
		if (inputMode != InputMode.None)
		{
			inputMode = InputMode.None;
			processStep();
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
	}
	
	public function init(zone:Int, stage:Int, allies:Array<BattleUnit>)
	{
		var enemyIDs:Array<String> = StageEnemies.getIDsByStage(zone, stage);
		var enemies:Array<BattleUnit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(new BattleUnit(enemyIDs[i], Team.Right, i));
			
		model = new BattleModel(allies, enemies);
		vision = new BattleVision();
		addChild(vision);
		vision.init(zone, allies, enemies);
		
		chosenAbility = -1;
		inputMode = InputMode.Choosing;
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
}