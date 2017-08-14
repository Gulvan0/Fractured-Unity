package;
import data.BotTactics;
import returns.BotDecision;
import returns.ChooseResult;
import returns.TargetResult;
import returns.UseResult;
import utils.DamageSource;
import utils.Element;
import utils.Team;

/**
 * [ROOT] model OF APP IN battle
 * @author Gulvan
 */
class BattleModel 
{

	private var allies:Array<BattleUnit>;
	private var enemies:Array<BattleUnit>;
	
	private var chosenAbility:Null<BattleAbility>;
	

    //================================================================================
    // Levers
    //================================================================================	
	
	public function changeUnitHP(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource):Int
	{
		target.hpPool.value += delta;
		return delta;
	}
	
	public function changeUnitMana(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource):Int
	{
		target.manaPool.value += delta;
		return delta;
	}
	
	public function chooseAbility(num:Int):ChooseResult
	{
		var hero:BattleUnit = allies[0];
		
		if (!hero.checkNonEmpty(num))
			return ChooseResult.Empty;
		if (!hero.checkManacost(num))
			return ChooseResult.Manacost;
		if (!hero.checkCooldown(num))
			return ChooseResult.Cooldown;
		
		chosenAbility = hero.wheel.get(num);
		return ChooseResult.Ok;
	}
	
	public function target(team:Team, pos:Int):TargetResult
	{
		var array:Array<BattleUnit> = (team == Team.Left)? allies : enemies;
		
		if (!allies[0].checkValidity(array[pos], chosenAbility))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	public function useChosenAbility(team:Team, pos:Int)
	{
		var array:Array<BattleUnit> = (team == Team.Left)? allies : enemies;
		
		BattleController.instance.useAbility(array[pos], allies[0], chosenAbility);
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility):UseResult
	{
		ability.use(target, caster);
		return UseResult.Ok;
	}
	
    //================================================================================
    // Cycle control
    //================================================================================
	
	public function processBots(team:Team):Bool
	{
		var botArray:Array<BattleUnit> = ((team == Team.Left)? allies.slice(1) : enemies);
		
		for (bot in botArray)
			if (bot.hpPool.value > 0)
			{
				var decision:BotDecision = BotTactics.decide(bot.id, allies, enemies);
				var targetTeam:Array<BattleUnit> = (decision.targetTeam == Team.Left)? allies : enemies;
				bot.useAbility(targetTeam[decision.targetPos], decision.abilityPos);
				
				if (!allAlive())
					return false;
			}
			
		return true;
	}
	
	public function new(allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
	{
		this.allies = allies;
		this.enemies = enemies;
	}
	
	public function checkAlive(array:Array<BattleUnit>):Bool
	{
		for (unit in array)
			if (unit.hpPool.value > 0)
				return true;
		return false;
	}
	
	public function allAlive():Bool
	{
		return checkAlive(allies) && checkAlive(enemies);
	}
	
	public function defineWinner():Null<Team>
	{
		if (checkAlive(allies))
			return Team.Left;
		else if (checkAlive(enemies))
			return Team.Right;
		else
			return null;
	}
	
}