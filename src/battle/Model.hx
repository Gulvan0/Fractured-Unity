package battle;
import battle.Ability;
import battle.Controller;
import battle.data.Abilities;
import battle.data.Units;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.struct.BuffQueue;
import battle.struct.UnitArrays;
import battle.struct.UnitCoords;
import haxe.CallStack;
import neko.Lib;
import battle.enums.Source;
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

typedef HPChangerOutput = {
	var dhp:Int;
	var crit:Bool;
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

	private var units:UnitArrays;
	
	private var readyUnits:Array<Unit>;

    //================================================================================
    // Levers
    //================================================================================	
	
	public function changeUnitHP(target:UnitCoords, caster:UnitCoords, dhp:Int, source:Source):HPChangerOutput
	{
		var modifier:Linear;
		var crit:Bool = false;
		var processedDelta:Int = dhp;
		
		var utarget:Unit = units.getUnit(target);
		var ucaster:Unit = units.getUnit(caster);
		
		if (source != Source.God)
		{	
			if (dhp > 0)
				modifier = Linear.combination([utarget.healIn, ucaster.healOut]);
			else
				modifier = Linear.combination([utarget.damageIn, ucaster.damageOut]);
				
			processedDelta = Math.round(modifier.apply(processedDelta));
				
			if (Math.random() < ucaster.critChance.apply(1))
			{
				processedDelta = Math.round(ucaster.critDamage.apply(processedDelta));
				crit = true;
			}
		}
		
		utarget.hpPool.value += processedDelta;	
		return {dhp:processedDelta, crit:crit};
	}
	
	public function changeUnitMana(target:UnitCoords, caster:UnitCoords, dmana:Int, source:Source):Int
	{
		var utarget:Unit = units.getUnit(target);
		var ucaster:Unit = units.getUnit(caster);
		
		utarget.manaPool.value += dmana;
		return dmana;
	}
	
	public function changeUnitAlacrity(target:UnitCoords, caster:UnitCoords, dalac:Float, source:Source):Float
	{
		var utarget:Unit = units.getUnit(target);
		var ucaster:Unit = units.getUnit(caster);
		
		utarget.alacrityPool.value += dalac;
		return dalac;
	}
	
	public function castBuff(id:ID, target:UnitCoords, caster:UnitCoords, duration:Int)
	{
		var utarget:Unit = units.getUnit(target);
		var ucaster:Unit = units.getUnit(caster);
		
		utarget.buffQueue.addBuff(new Buff(id, target, caster, duration)); 
	}
	
	public function dispellBuffs(target:UnitCoords, ?elements:Array<Element>, ?count:Int = -1):Array<Buff>
	{
		var utarget:Unit = units.getUnit(target);
		
		utarget.buffQueue.dispell(elements, count);
		return utarget.buffQueue.queue;
	}
	
	//================================================================================
    // Input
    //================================================================================
	
	public function checkChoose(abilityPos:Int):ChooseResult
	{
		var player:Unit = units.player();
		var ability:Ability = player.wheel.get(abilityPos);
		
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!player.checkManacost(abilityPos))
			return ChooseResult.Manacost;
		
		return ChooseResult.Ok;
	}
	
	public function checkTarget(targetCoords:UnitCoords, abilityPos:Int):TargetResult
	{
		var player:Unit = units.player();
		var target:Unit = units.getUnit(targetCoords);
		var ability:Ability = player.wheel.get(abilityPos);
		
		if (target == null)
			return TargetResult.Nonexistent;
		if (target.hpPool.value == 0)
			return TargetResult.Dead;
		if (!ability.checkValidity(player.figureRelation(target)))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	public function checkUse(targetCoords:UnitCoords, casterCoords:UnitCoords, ability:Ability):UseResult
	{
		return UseResult.Ok;
	}
	
	public function getPlayerAbility(pos:Int):Ability
	{
		return units.player().wheel.get(pos);
	}
	
    //================================================================================
    // Game cycle
    //================================================================================
	
	public function alacrityIncrement()
	{
		for (unit in units.both)
			if (checkAlive([unit]))
			{
				Controller.instance.changeUnitAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), getAlacrityGain(unit), Source.God);
				
				if (unit.alacrityPool.value == 100)
					readyUnits.push(unit);
			}
			
		if (Lambda.empty(readyUnits))
			alacrityIncrement();
		else
		{
			sortByFlow(readyUnits);
			processReady();
		}
	}
	
	private function processReady()
	{
		if (!Lambda.empty(readyUnits))
		{
			var unit:Unit = readyUnits[0];
			readyUnits.splice(0, 1);
			Controller.instance.changeUnitAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), -100, Source.God);
			
			if (!unit.isStunned()) 
			{
				if (unit.isPlayer())
					Controller.instance.inputMode = InputMode.Choosing;
				else
					botMakeTurn(unit);
			}
			else
				postTurnProcess(UnitCoords.get(unit));
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
		var decision:BotDecision = Units.decide(bot.id);
		
		Controller.instance.setUA(decision.target, UnitCoords.get(bot), bot.wheel.get(decision.abilityNum));
		Controller.instance.useAbility();
	}
	
	private function getAlacrityGain(coords:UnitCoords):Float
	{
		var sum:Float = 0;
		for (unit in units.both)
			if (checkAlive([unit]))
				sum += unit.flow;
				
		return units.getUnit(coords).flow / sum;
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
	
	public function defineWinner():Null<Team>
	{
		if (checkAlive(units.left))
			return Team.Left;
		else if (checkAlive(units.right))
			return Team.Right;
		else
			return null;
	}
	
	public function checkAlive(array:Array<Unit>):Bool
	{
		for (unit in array)
			if (unit.hpPool.value > 0)
				return true;
		return false;
	}
	
	public function bothTeamsAlive():Bool
	{
		return checkAlive(units.left) && checkAlive(units.right);
	}
	
	//================================================================================
    // Info retrievers
    //================================================================================	
	
	public function getAbilityInfo(num:Int):AbilityInfo
	{
		var ability:Ability = units.player().wheel.get(num);
		
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
		var unit:Unit = units.getUnit(coords);
		
		return {name: unit.name,
		buffQueue: unit.buffQueue};
	}
	
    //================================================================================
	
	public function new(units:UnitArrays) 
	{
		this.units = units;
		this.readyUnits = [];
	}
	
}