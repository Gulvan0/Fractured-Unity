package battle;
import battle.Ability;
import battle.data.Abilities;
import battle.data.Buffs;
import battle.data.Passives;
import battle.data.Units;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.struct.BuffQueue;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.IObservableModel;
import cpp.Void;
import haxe.CallStack;
import haxe.Constraints.Function;
import battle.enums.Source;
import Element;
import battle.enums.Team;
using MathUtils;

enum ChooseResult 
{
	Ok;
	Empty;
	Manacost;
	Cooldown;
	Passive;
}

enum TargetResult 
{
	Ok;
	Invalid;
	Nonexistent;
	Dead;
}

/**
 * @author Gulvan
 */
class Model implements IObservableModel implements IMutableModel implements ISimpleModel
{
	
	private var observers:Array<IModelObserver>;

	public var units(default, null):UPair<Unit>;
	
	private var inputMode:InputMode;
	
	private var chosenAbilityPos:Int;
	
	private var UAtarget:UnitCoords;
	private var UAcaster:UnitCoords;
	private var UAability:Active;
	private var UAiterator:Int;
	private var AOECounter:Int;
	
	private var responsesLeft:Int;
	private var continuePoint:Null<Function>;
	private var continueArgs:Array<Dynamic>;
	
	private var readyUnits:Array<Unit>;

	public function getUnits():UPair<Unit>
	{
		return units;
	}
	
	public function getInputMode():InputMode
	{
		return inputMode;
	}
	
    //================================================================================
    // Mutable
    //================================================================================	
	
	public function changeHP(targetCoords:UnitCoords, casterCoords:UnitCoords, dhp:Int, element:Element, source:Source)
	{
		var target:Unit = units.get(targetCoords);
		var caster:Unit = units.get(casterCoords);
		var crit:Bool = false;
		
		if (source != Source.God)
		{	
			dhp = Utils.calcBoost(dhp, caster, target);
			
			if (Utils.flipCrit(caster))
			{
				crit = true;
				dhp = Utils.calcCrit(dhp, caster);
			}
		}
		trace(caster.name + " deals " + -dhp + (crit? "!" : "") + " damage to " + target.name);
		target.hpPool.value += dhp;	
		trace(target.name + " is still alive: " + target.isAlive());
		for (o in observers) 
		{
			o.hpUpdate(target, caster, dhp, element, crit, source);
			if (!target.isAlive())
				o.death(targetCoords);
		}
	}
	
	public function changeMana(targetCoords:UnitCoords, casterCoords:UnitCoords, dmana:Int, source:Source)
	{
		var target:Unit = units.get(targetCoords);
		var caster:Unit = units.get(casterCoords);
		
		target.manaPool.value += dmana;
		
		for (o in observers) o.manaUpdate(target, dmana, source);
	}
	
	public function changeAlacrity(targetCoords:UnitCoords, casterCoords:UnitCoords, dalac:Float, source:Source)
	{
		var target:Unit = units.get(targetCoords);
		var caster:Unit = units.get(casterCoords);
		
		target.alacrityPool.value += dalac;
		
		for (o in observers) o.alacUpdate(target, dalac, source);
	}
	
	public function castBuff(id:ID, targetCoords:UnitCoords, casterCoords:UnitCoords, duration:Int)
	{
		var target:Unit = units.get(targetCoords);
		var caster:Unit = units.get(casterCoords);
		
		if (targetCoords.equals(casterCoords))
			duration++;
		
		target.buffQueue.addBuff(new Buff(id, duration, targetCoords, casterCoords));
		
		for (o in observers) o.buffQueueUpdate(targetCoords, target.buffQueue.queue);
	}
	
	public function dispellBuffs(targetCoords:UnitCoords, ?elements:Array<Element>, ?count:Int = -1)
	{
		var target:Unit = units.get(targetCoords);
		
		target.buffQueue.dispellByElement(elements, count);
		
		for (o in observers) o.buffQueueUpdate(targetCoords, target.buffQueue.queue);
	}
	
	//================================================================================
    // Input
    //================================================================================
	
	public function choose(abilityPos:Int)
	{
		var ability:Ability = units.player().wheel.get(abilityPos);
		
		switch (checkChoose(abilityPos))
		{
			case ChooseResult.Ok:
				inputMode = InputMode.Targeting;
				if (chosenAbilityPos != -1) for (o in observers) o.abDeselected(chosenAbilityPos);
				for (o in observers) o.abSelected(abilityPos);
				chosenAbilityPos = abilityPos;
			case ChooseResult.Empty:
				for (o in observers) o.warn("There is no ability in this slot");
			case ChooseResult.Manacost:
				for (o in observers) o.warn("Not enough mana");
			case ChooseResult.Cooldown:
				for (o in observers) o.warn("This ability is currently on cooldown");
			case ChooseResult.Passive:
				for (o in observers) o.warn("This ability is passive, you can't use it");
		}
	}
	
	public function targetAndUse(targetCoords:UnitCoords)
	{
		switch (checkTarget(targetCoords, chosenAbilityPos))
		{
			case TargetResult.Ok:
				inputMode = InputMode.None;
				
				for (o in observers) o.abDeselected(chosenAbilityPos);
				
				setUA(targetCoords, UnitCoords.player(), units.player().wheel.getActive(chosenAbilityPos));
				useAbility();
			case TargetResult.Invalid:
				inputMode = InputMode.Choosing;
				
				for (o in observers)
				{
					o.warn("Chosen ability cannot be used on this target");
					o.abDeselected(chosenAbilityPos);
				}
			case TargetResult.Nonexistent, TargetResult.Dead:
				//Ignore silently
		}
	}
	
	//================================================================================
    // useAbility
    //================================================================================
	
	private function useAbility()
	{
		switch (UAiterator++)
		{
			case 0:
				changeMana(UAcaster, UAcaster, -UAability.manacost, Source.God);
				trace(getUnits().get(UAcaster).name + " now has " + getUnits().get(UAcaster).manaPool.value + " mana");
				UAability.putOnCooldown();
				
				continuePoint = useAbility;
				for (o in observers) o.abThrown(UAtarget, UAcaster, UAability.id, UAability.strikeType, UAability.element);
			case 1:
				var target:Unit;
				if (UAability.aoe)
				{
					target = units.allied(UAtarget)[AOECounter];
					AOECounter++;
					if (AOECounter < units.allied(UAtarget).length)
						UAiterator--;
				}
				else
					target = units.get(UAtarget);
					
				if (Utils.flipMiss(target, units.get(UAcaster), UAability))
				{
					trace(units.get(UAcaster).name + " -> " + target.name + ": Miss!");
					for (o in observers) o.miss(UnitCoords.get(target), UAability.element);
				}
				else
					Abilities.useAbility(UAability.id, UnitCoords.get(target), UAcaster, UAability.element);
					
				continuePoint = useAbility;
				for (o in observers) o.abStriked(UnitCoords.get(target), UAcaster, UAability.id, UAability.strikeType, UAability.element);
			case 2:
				postTurnProcess(UAcaster);
			default:
				UAiterator = 0;
				if (UAability.aoe)
					AOECounter = 0;
				useAbility();
		}
	}
	
	private function setUA(target:UnitCoords, caster:UnitCoords, ability:Active)
	{
		UAtarget = target;
		UAcaster = caster;
		UAability = ability;
	}
	
	private function clearUA()
	{
		UAtarget = UnitCoords.nullC();
		UAcaster = UnitCoords.nullC();
		UAability = new Active(ID.NullID);
		UAiterator = 0;
		AOECounter = 0;
	}
	
    //================================================================================
    // Game cycle
    //================================================================================
	
	private function alacrityIncrement()
	{
		var alive:Unit->Bool = function(u:Unit){return u.isAlive();};
		var fastest:Array<Unit> = [];
		var fastestTurnCount:Int = 1000;
		for (unit in units.both.filter(alive))
		{
			var turns:Int = Math.ceil((unit.alacrityPool.maxValue - unit.alacrityPool.value) / getAlacrityGain(unit));
			if (turns < fastestTurnCount)
			{
				fastest = [unit];
				fastestTurnCount = turns;
			}
			else if (turns == fastestTurnCount)
				fastest.push(unit);
		}
		for (unit in units.both.filter(alive))
			changeAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), getAlacrityGain(unit) * fastestTurnCount, Source.God);
				
		readyUnits = fastest;
		processReady();
	}
	
	private function processReady()
	{
		if (!Lambda.empty(readyUnits))
		{
			var index:Int = Math.floor(Math.random() * readyUnits.length);
			var unit:Unit = readyUnits[index];
			readyUnits.splice(index, 1);
			changeAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), -unit.alacrityPool.value, Source.God);
			
			if (!unit.isStunned() && checkAlive([unit])) 
			{
				if (unit.isPlayer())
					inputMode = InputMode.Choosing;
				else
					botMakeTurn(unit);
			}
			else
				postTurnProcess(UnitCoords.get(unit));
		}
		else
			alacrityIncrement();
	}
	
	private function postTurnProcess(coords:UnitCoords)
	{
		var unit:Unit = units.get(coords);
		
		if (!bothTeamsAlive()) 
		{
			end(defineWinner());
			return;
		}
			
		if (unit.isAlive())
		{
			for (o in observers) o.preTick(unit);
			unit.tick();
			for (o in observers) o.tick(unit);
		}
			
		if (!bothTeamsAlive()) 
		{
			end(defineWinner());
			return;
		}
		
		processReady();
	}
	
	private function botMakeTurn(bot:Unit)
	{
		var decision:BotDecision = Units.decide(bot.id);
		
		setUA(decision.target, UnitCoords.get(bot), bot.wheel.getActive(decision.abilityNum));
		useAbility();
	}
	
	private function getAlacrityGain(unit:Unit):Float
	{
		var sum:Float = 0;
		for (u in units.both)
			if (checkAlive([u]))
				sum += u.flow;
				
		return unit.flow / sum;
	}
	
	//================================================================================
    // Battle ending
    //================================================================================
	
	public function end(winner:Null<Team>)
	{
		
	}
	
	private function defineWinner():Null<Team>
	{
		if (checkAlive(units.left))
			return Team.Left;
		else if (checkAlive(units.right))
			return Team.Right;
		else
			return null;
	}
	
	private function checkAlive(array:Array<Unit>):Bool
	{
		for (unit in array)
			if (unit.isAlive())
				return true;
		return false;
	}
	
	private function bothTeamsAlive():Bool
	{
		return checkAlive(units.left) && checkAlive(units.right);
	}
	
	//================================================================================
    // Observable
    //================================================================================	
	
	public function skipTurn()
	{
		if (inputMode != InputMode.None)
		{
			inputMode = InputMode.None;
			changeAlacrity(UnitCoords.player(), UnitCoords.player(), -100, Source.God);
			postTurnProcess(UnitCoords.player());
		}
	}
	
	public function quit()
	{
		end(Team.Right);
	}
	
	//================================================================================
    // Observers
    //================================================================================	
	
	public function addObserver(obs:IModelObserver)
	{
		observers.push(obs);
		responsesLeft++;
	}
	
	public function respond()
	{
		if (responsesLeft == 0)
			trace("WARN//Unexpected response");
		else if (--responsesLeft == 0)
		{
			var args:Array<Dynamic> = continueArgs;
			var point:Function = continuePoint;
			continuePoint = null;
			continueArgs = [];
			responsesLeft = observers.length;
			
			Reflect.callMethod(point, point, args);
		}
	}
	
	//================================================================================
    // Checkers
    //================================================================================
	
	public function checkChoose(abilityPos:Int):ChooseResult
	{
		var ability:Ability = units.player().wheel.get(abilityPos);
		
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.type == AbilityType.Passive)
			return ChooseResult.Passive;
		
		var activeAbility:Active = units.player().wheel.getActive(abilityPos);
		
		if (activeAbility.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!units.player().checkManacost(abilityPos))
			return ChooseResult.Manacost;
		
		return ChooseResult.Ok;
	}
	
	public function checkTarget(targetCoords:UnitCoords, abilityPos:Int):TargetResult
	{
		var target:Unit = units.get(targetCoords);
		var ability:Active = units.player().wheel.getActive(abilityPos);
		
		if (target == null)
			return TargetResult.Nonexistent;
		if (target.hpPool.value == 0)
			return TargetResult.Dead;
		if (!ability.checkValidity(units.player().figureRelation(target)))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	public function targetAvaibility(unit:UnitCoords):Bool
	{
		if (chosenAbilityPos.inRange(0, 7))
			return checkTarget(unit, chosenAbilityPos) == TargetResult.Ok;
		else
			return false;
	}
	
    //================================================================================
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>) 
	{
		this.units = new UPair(allies, enemies);
		this.readyUnits = [];
		this.chosenAbilityPos = -1;
		this.inputMode = InputMode.None;
		this.observers = [];
		this.responsesLeft = 0;
		this.continueArgs = [];
		clearUA();
	}
	
	public function init()
	{
		Abilities.init(this);
		Units.init(this);
		Buffs.init(this);
		Passives.init(this);
		alacrityIncrement();
	}
	
}