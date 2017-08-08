package;
import data.*;
import hxassert.Assert;
import openfl.display.Sprite;
import returns.BotDecision;
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
	
	public function chooseAbility(num:Int)
	{
		if (model.chooseAbility(num))
			vision.chooseAbility(num);
	}
	
	public function target(team:Team, pos:Int)
	{
		if (model.target(team, pos))
			vision.target(team, pos);
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility)
	{
		//Replace with custom return
		if (model.useAbility(target, caster, ability))
			vision.useAbility(target, caster, AbilityParameters.getElementByID(ability.id), ability.type, false);
	}
	
	private function cycle()
	{
		if (processBots(Team.Left))
			if (processBots(Team.Right))
				awaitingInput = true;
			else
				return;
		else
			return;
	}
	
	private function processBots(team:Team):Bool
	{
		var array:Array<BattleUnit> = ((team == Team.Left)? getLeftTeam() : getRightTeam());
		var startIndex:Int = (team == Team.Left)? 1 : 0;
		
		for (i in startIndex...array.length)
			if ((array[i].hpPool.value > 0)
			{
				var decision:BotDecision = BotTactics.decide(array[i].id);
				var targetedTeam:Array<BattleUnit> = (decision.targetTeam == Team.Left)? getLeftTeam() : getRightTeam();
				
				array[i].useAbility(targetedTeam[decision.targetPos], decision.abilityPos);
				if (!checkAlive(allies) || !checkAlive(enemies))
					return false;
			}
			
		return true;
	}
	
	private function end()
	{
		
	}
	
	public function init(zone:Int, stage:Int, allies:Array<BattleUnit>) 
	{
		var enemyIDs:Array<String> = StageEnemies.getIDsByStage(zone, stage);
		var enemies:Array<BattleUnit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(UnitConstructor.constructBotByID(enemyIDs[i], Team.Right, i));
			
		model = new BattleModel(allies, enemies);
		vision = new BattleVision();
		addChild(vision);
		vision.init(zone, allies, enemies);
		awaitingInput = true;
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
	
	public function getLeftTeam():Array<BattleUnit>
	{
		return model.getLeftTeam();
	}
	
	public function getRightTeam():Array<BattleUnit>
	{
		return model.getRightTeam();
	}
	
	private function checkAlive(array:Array<BattleUnit>):Bool
	{
		for (unit in array)
			if (unit.hpPool.value > 0)
				return true;
		return false;
	}
}