package;
import data.AbilityParameters;
import data.BotTactics;
import dataobj.AbilityInfo;
import dataobj.UnitInfo;
import returns.BotDecision;
import returns.ChooseResult;
import returns.ProcessResult;
import returns.TargetResult;
import returns.UseResult;
import utils.BattleControllerUseMode;
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
	private var unitToProcess:Null<BattleUnit>;

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
		if (getUnit(team, pos) == null)
			return TargetResult.Nonexistent;
		if (getUnit(team, pos).hpPool.value == 0)
			return TargetResult.Dead;
		if (!chosenAbility.checkValidity(getUnit(team, pos), allies[0]))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	public function useChosenAbility(team:Team, pos:Int)
	{
		BattleController.instance.useAbility(getUnit(team, pos), allies[0], chosenAbility, BattleControllerUseMode.Begin);
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
	
	public function getUnitInfo(team:Team, pos:Int):UnitInfo
	{
		var info:UnitInfo = new UnitInfo();
		
		info.name = getUnit(team, pos).name;
		info.buffQueue = getUnit(team, pos).buffQueue;
		
		return info;
	}
	
    //================================================================================
    // Cycle control
    //================================================================================
	
	public function processCurrent():ProcessResult
	{
		if (unitToProcess == null)
			unitToProcess = allies[0];
			
		if (!bothTeamsAlive())
			return ProcessResult.Thrown;
		if (unitToProcess.hpPool.value > 0)
			unitToProcess.tick();
		if (!bothTeamsAlive())
			return ProcessResult.Thrown;
			
		if (getUnit(unitToProcess.team, unitToProcess.position + 1) != null)
		{
			unitToProcess = getUnit(unitToProcess.team, unitToProcess.position + 1);
		}
		else if (unitToProcess.team == Team.Left)
		{
			unitToProcess = getUnit(Team.Right, 0);
		}
		else
		{
			unitToProcess = allies[0];
			return ProcessResult.Last;
		}
		
		if (unitToProcess.hpPool.value > 0)
			botMakeTurn(unitToProcess);
		return ProcessResult.NotLast;
	}
	
	private function botMakeTurn(bot:BattleUnit)
	{
		var decision:BotDecision = BotTactics.decide(bot.id, allies, enemies);
		BattleController.instance.useAbility(getUnit(decision.targetTeam, decision.targetPos), bot, bot.wheel.get(decision.abilityPos), BattleControllerUseMode.Begin);
	}
	
	public function new(allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
	{
		this.allies = allies;
		this.enemies = enemies;
	}
	
	//================================================================================
    // Battle end utilities
    //================================================================================
	
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
	
	private function checkAlive(array:Array<BattleUnit>):Bool
	{
		for (unit in array)
			if (unit.hpPool.value > 0)
				return true;
		return false;
	}
	
	//================================================================================
    // Other
    //================================================================================
	
	public function isHero(unit:BattleUnit):Bool
	{
		return allies[0].id == unit.id;
	}
	
	private function getUnit(team:Team, pos:Int):Null<BattleUnit>
	{
		var array:Array<BattleUnit> = (team == Team.Left)? allies : enemies;
		return array[pos];
	}
	
}