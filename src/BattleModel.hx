package;
import data.AbilityParameters;
import data.BotTactics;
import dataobj.AbilityInfo;
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
		var processedDelta:Int = delta;
		
		if (source != DamageSource.God)
		{	
			if (delta > 0)
				processedDelta = Math.round(processedDelta * target.inputHealMultiplier * caster.outputHealMultiplier);
			else
				processedDelta = Math.round(processedDelta * target.inputDamageMultiplier * caster.outputDamageMultiplier);
		}
		
		target.hpPool.value += processedDelta;	
		return processedDelta;
	}
	
	public function changeUnitMana(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource):Int
	{
		target.manaPool.value += delta;
		return delta;
	}
	
	public function castBuff(id:String, target:BattleUnit, caster:BattleUnit, duration:Int)
	{
		target.buffQueue.addBuff(new Buff(id, target, caster, duration)); 
	}
	
	public function dispellBuffs(target:BattleUnit, ?elements:Array<Element>, ?count:Int = -1):Array<Buff>
	{
		target.buffQueue.dispell(elements, count);
		return target.buffQueue.queue;
	}
	
	public function chooseAbility(num:Int):ChooseResult
	{
		var hero:BattleUnit = allies[0];
		var ability:BattleAbility = hero.wheel.get(num);
		trace("Checking validity of chosen ability");
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!hero.checkManacost(num))
			return ChooseResult.Manacost;
		trace("Checkers complete");
		chosenAbility = hero.wheel.get(num);
		trace(chosenAbility);
		return ChooseResult.Ok;
	}
	
	public function target(team:Team, pos:Int):TargetResult
	{
		var array:Array<BattleUnit> = (team == Team.Left)? allies : enemies;
		
		if (pos >= array.length)
			return TargetResult.Nonexistent;
		if (array[pos].hpPool.value == 0)
			return TargetResult.Dead;
		if (!chosenAbility.checkValidity(array[pos], allies[0]))
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
		trace("Used ability: " + ability.name);
		ability.use(target, caster);
		return UseResult.Ok;
	}
	
	public function getAbilityInfo(num:Int):AbilityInfo
	{
		var info:AbilityInfo = new AbilityInfo();
		var ability:BattleAbility = allies[0].wheel.get(num);
		
		info.name = ability.name;
		info.type = ability.type;
		info.target = ability.possibleTarget;
		info.manacost = ability.manacost;
		info.currentCooldown = ability.cooldown;
		info.maxCooldown = AbilityParameters.getParametersByID(ability.id).cooldown;
		
		return info;
	}
	
    //================================================================================
    // Cycle control
    //================================================================================
	
	public function processBots():Bool
	{
		var bots:Array<BattleUnit> = allies.slice(1).concat(enemies);
		
		for (bot in bots)
		{
			if (bot.hpPool.value > 0)
			{
				var decision:BotDecision = BotTactics.decide(bot.id, allies, enemies);
				var targetTeam:Array<BattleUnit> = (decision.targetTeam == Team.Left)? allies : enemies;
				bot.useAbility(targetTeam[decision.targetPos], decision.abilityPos);
				
				if (!bothTeamsAlive())
					return false;
			}
			if (bot.hpPool.value > 0)
			{
				bot.tick();
				
				if (!bothTeamsAlive())
					return false;
			}
		}
			
		return true;
	}
	
	public function tickHero()
	{
		if (allies[0].hpPool.value > 0)
			allies[0].tick();
	}
	
	private function tick(team:Team, pos:Int)
	{
		var array:Array<BattleUnit> = (team == Team.Left)? allies : enemies;
		array[pos].tick();
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
	
	public function bothTeamsAlive():Bool
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