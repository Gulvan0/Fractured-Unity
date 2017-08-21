package;
import data.*;
import hxassert.Assert;
import openfl.display.Sprite;
import returns.BotDecision;
import returns.ChooseResult;
import returns.TargetResult;
import returns.UseResult;
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
	public var exitRequest:Bool;
	
	//================================================================================
    // Levers
    //================================================================================
	
	public function changeUnitHP(target:BattleUnit, caster:BattleUnit, delta:Int, element:Element, source:DamageSource)
	{
		var finalValue:Int = model.changeUnitHP(target, caster, delta, source);
		vision.changeUnitHP(target, finalValue, element);
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
	
	public function chooseAbility(num:Int)
	{
		switch (model.chooseAbility(num))
		{
			case ChooseResult.Ok:
				inputMode = InputMode.Targeting;
				vision.chooseAbility(num);
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
				model.useChosenAbility(team, pos);
				if (!process())
					end(model.defineWinner());
				else
					inputMode = InputMode.Choosing;
			case TargetResult.Invalid:
				vision.printWarning("Chosen ability cannot be used on this target");
			case TargetResult.Nonexistent, TargetResult.Dead:
				//Ignore silently
		}
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility)
	{
		vision.useAbility(target, caster, ability.element, ability.type);
		if (model.useAbility(target, caster, ability) == UseResult.Miss)
			vision.unitMiss(target);
	}
	
	//================================================================================
    // Cycle control
    //================================================================================
	
	private function process():Bool
	{
		if (!model.bothTeamsAlive())
			return false;
			
		model.tickHero();
		if (!model.bothTeamsAlive())
			return false;
			
		if (!model.processBots())
			return false;
		
		return true;
	}
	
	private function end(winner:Null<Team>)
	{
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
		
		inputMode = InputMode.Choosing;
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
}