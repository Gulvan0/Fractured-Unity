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
import haxe.CallStack;
import neko.Lib;
import battle.enums.DamageSource;
import Element;
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
	
	public function changeUnitHP(target:Unit, caster:Unit, delta:Int, source:DamageSource):{amount:Int, crit:Bool}
	{
		var processedDelta:Int = delta;
		var crit:Bool = false;
		
		if (source != DamageSource.God)
		{	
			if (delta > 0)
				processedDelta = Math.round(Linear.combination([target.healIn, caster.healOut]).apply(processedDelta));
			else
				processedDelta = Math.round(Linear.combination([target.damageIn, caster.damageOut]).apply(processedDelta));
				
			if (Math.random() < caster.critChance.apply(1))
			{
				processedDelta = caster.critDamage.apply(processedDelta);
				crit = true;
			}
		}
		
		target.hpPool.value += processedDelta;	
		return {processedDelta, crit};
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
	
	public function castBuff(id:ID, target:Unit, caster:Unit, duration:Int)
	{
		target.buffQueue.addBuff(new battle.Buff(id, target, caster, duration)); 
	}
	
	public function dispellBuffs(target:Unit, ?elements:Array<Element>, ?count:Int = -1):Array<battle.Buff>
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
			
		if (Lambda.empty(readyUnits))
			alacrityIncrement();
		else
		{
			try 
			{
				sortByFlow(readyUnits);
				processReady();
			} 
			catch (e:Dynamic)
			{
				trace(e);
				trace(CallStack.toString(CallStack.exceptionStack()));
				Sys.exit(1);
			}
		}
	}
	
	private function processReady()
	{
		if (!Lambda.empty(readyUnits))
		{
			var unit:Unit = readyUnits[0];
			readyUnits.splice(0, 1);
			Controller.instance.changeUnitAlacrity(unit, -100);
			
			if (!unit.isStunned()) 
			{
				if (unit.team == Team.Left && unit.position == 0)
					Controller.instance.inputMode = InputMode.Choosing;
				else
					botMakeTurn(unit);
			}
			else
				postTurnProcess(new UnitCoords(unit.team, unit.position));
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
		trace(bot.wheel.get(decision.abilityNum));
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
    // Info retrievers
    //================================================================================	
	
	public function getAbilityInfo(num:Int):AbilityInfo
	{
		var ability:Ability = allies[0].wheel.get(num);
		
		return {name: ability.name, 
		describition: ability.description, 
		type: ability.type, 
		target: ability.possibleTarget,
		manacost: ability.manacost,
		currentCooldown: ability.cooldown,
		maxCooldown: XMLUtils.parseAbility(ability.id, "cooldown", 1)
		};
	}
	
	public function getUnitInfo(coords:UnitCoords):UnitInfo
	{
		var unit:Unit = getUnit(coords);
		
		return {name: unit.name,
		buffQueue: unit.buffQueue};
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