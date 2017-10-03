package battle;
import battle.Ability;
import battle.Controller;
import battle.data.Abilities;
import battle.data.Units;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.struct.BuffQueue;
import battle.struct.UnitCoords;
import neko.Lib;
import battle.enums.DamageSource;
import battle.enums.Element;
import battle.enums.Team;

/**
 * [ROOT] model OF APP IN battle
 * @author Gulvan
 */
typedef AbilityInfo = {
	var name:String;
	var describition:String;
	var type:AbilityType;
	var maxCooldown:Int;
	var currentCooldown:Int;
	var manacost:Int;
	var target:AbilityTarget;
}

typedef UnitInfo = {
	var name:String;
	var buffQueue:BuffQueue;
}
 
enum ChooseResult 
{
	Ok;
	Empty;
	Manacost;
	Cooldown;
}

enum TargetResult 
{
	Ok;
	Invalid;
	Nonexistent;
	Dead;
}

enum UseResult 
{
	Ok;
	Miss;
}
 
class Model 
{

	private var allies:Array<Unit>;
	private var enemies:Array<Unit>;
	
	private var unitToProcess:Null<Unit>;
	private var readyUnits:Array<Unit>;

    //================================================================================
    // Levers
    //================================================================================	
	
	public function changeUnitHP(target:Unit, caster:Unit, delta:Int, source:DamageSource):Int
	{
		var processedDelta:Int = delta;
		
		if (source != battle.enums.DamageSource.God)
		{	
			if (delta > 0)
				processedDelta = Math.round(processedDelta * target.inputHealMultiplier * caster.outputHealMultiplier);
			else
				processedDelta = Math.round(processedDelta * target.inputDamageMultiplier * caster.outputDamageMultiplier);
		}
		
		target.hpPool.value += processedDelta;	
		return processedDelta;
	}
	
	public function changeUnitMana(target:Unit, caster:Unit, delta:Int, source:DamageSource):Int
	{
		target.manaPool.value += delta;
		return delta;
	}
	
	public function changeUnitAlacrity(unit:Unit, delta:Float):Float
	{
		unit.alacrityPool.value += delta;
		return delta;
	}
	
	public function castBuff(id:String, target:Unit, caster:Unit, duration:Int)
	{
		target.buffQueue.addBuff(new battle.Buff(id, target, caster, duration)); 
	}
	
	public function dispellBuffs(target:Unit, ?elements:Array<battle.enums.Element>, ?count:Int = -1):Array<battle.Buff>
	{
		target.buffQueue.dispell(elements, count);
		return target.buffQueue.queue;
	}
	
	//================================================================================
    // Input
    //================================================================================
	
	public function checkChoose(abilityPos:Int):ChooseResult
	{
		var hero:Unit = allies[0];
		var ability:battle.Ability = hero.wheel.get(abilityPos);
		
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!hero.checkManacost(abilityPos))
			return ChooseResult.Manacost;
		
		return ChooseResult.Ok;
	}
	
	public function checkTarget(targetCoords:UnitCoords, abilityPos:Int):TargetResult
	{
		var target:Unit = getUnit(targetCoords);
		var ability:battle.Ability = allies[0].wheel.get(abilityPos);
		
		if (target == null)
			return TargetResult.Nonexistent;
		if (target.hpPool.value == 0)
			return TargetResult.Dead;
		if (!ability.checkValidity(target, allies[0]))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	public function checkUse(targetCoords:UnitCoords, casterCoords:UnitCoords, ability:Ability):UseResult
	{
		return UseResult.Ok;
	}
	
	public function getPlayerAbility(pos:Int):battle.Ability
	{
		return allies[0].wheel.get(pos);
	}
	
	public function useAbility(target:UnitCoords, caster:UnitCoords, ability:battle.Ability)
	{
		ability.use(getUnit(target), getUnit(caster));
	}
	
	//================================================================================
    // Info retrievers
    //================================================================================	
	
	public function getAbilityInfo(num:Int):AbilityInfo
	{
		var ability:Ability = allies[0].wheel.get(num);
		
		return {name: ability.name, 
		describition: ability.describition, 
		type: ability.type, 
		target: ability.possibleTarget,
		manacost: ability.manacost,
		currentCooldown: ability.cooldown,
		maxCooldown: Abilities.getParametersByID(ability.id).cooldown
		};
	}
	
	public function getUnitInfo(coords:UnitCoords):UnitInfo
	{
		var unit:Unit = getUnit(coords);
		
		return {name: unit.name,
		buffQueue: unit.buffQueue};
	}
	
    //================================================================================
    // Cycle control
    //================================================================================
	
	public function alacrityIncrement()
	{
		for (unit in allies.concat(enemies))
			if (checkAlive([unit]))
			{
				Controller.instance.changeUnitAlacrity(unit, getAlacrityGain(unit));
				
				if (unit.alacrityPool.value == 100)
					readyUnits.push(unit);
			}
			
		if (readyUnits.length == 0)
			alacrityIncrement();
		else
		{
			sortByFlow(readyUnits);
			processReady();
		}
	}
	
	private function processReady()
	{
		if (readyUnits.length != 0)
		{
			var unit:Unit = readyUnits[0];
			readyUnits.splice(0, 1);
			Controller.instance.changeUnitAlacrity(unit, -100);
			
			if (unit.team == Team.Left && unit.position == 0)
				Controller.instance.inputMode = InputMode.Choosing;
			else
				botMakeTurn(unit);
		}
		else
			alacrityIncrement();
	}
	
	public function postTurnProcess(coords:UnitCoords)
	{
		var unit:Unit = getUnit(coords);
		
		if (!bothTeamsAlive()) 
		{
			Controller.instance.end(defineWinner());
			return;
		}
			
		if (unit.hpPool.value > 0)
			unit.tick();
			
		if (!bothTeamsAlive()) 
		{
			Controller.instance.end(defineWinner());
			return;
		}
		
		processReady();
	}
	
	private function botMakeTurn(bot:Unit)
	{
		var decision:BotDecision = Units.decide(bot.id, allies, enemies);
		Controller.instance.useAbility(decision.target, getCoords(bot), bot.wheel.get(decision.abilityNum));
	}
	
	private function getAlacrityGain(unit:Unit):Float
	{
		var sum:Float = 0;
		for (unitI in allies.concat(enemies))
			if (checkAlive([unitI]))
				sum += unitI.flow;
		return unit.flow / sum;
	}
	
	private function sortByFlow(array:Array<Unit>)
	{
		function swap(j1:Int, j2:Int)
		{
			var t:Unit = array[j1];
			array[j1] = array[j2];
			array[j2] = t;
		}
		
		for (i in 1...array.length)
			for (j in i...array.length)
				if (array[j - 1].flow < array[j].flow)
					swap(j - 1, j);
				else if (array[j - 1].flow == array[j].flow)
					if (MathUtils.flip())
						swap(j - 1, j);
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
	
	private function checkAlive(array:Array<Unit>):Bool
	{
		for (unit in array)
			if (unit.hpPool.value > 0)
				return true;
		return false;
	}
	
	//================================================================================
    // Other
    //================================================================================
	
	private inline function getUnit(coords:UnitCoords):Null<Unit>
	{
		var array:Array<Unit> = (coords.team == battle.enums.Team.Left)? allies : enemies;
		return array[coords.pos];
	}
	
	private inline function getCoords(unit:Unit):UnitCoords
	{
		return new UnitCoords(unit.team, unit.position);
	}
	
	//================================================================================
    // Constructor
    //================================================================================
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>) 
	{
		this.allies = allies;
		this.enemies = enemies;
		this.readyUnits = [];
	}
	
}