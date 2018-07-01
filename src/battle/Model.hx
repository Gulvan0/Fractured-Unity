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
import haxe.CallStack;
import haxe.Constraints.Function;
import neko.Lib;
import battle.enums.Source;
import Element;
import battle.enums.Team;

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
	
	private var responsesLeft:Int;
	private var continuePoint:Function;
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
			o.hpUpdate(target, dhp, element, crit, source);
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
		
		target.buffQueue.addBuff(new Buff(id, targetCoords, casterCoords, duration+1));
		
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
				chosenAbilityPos = abilityPos;
				for (o in observers) o.abSelected(abilityPos);
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
				for (o in observers) o.abThrown(UAtarget, UAcaster, UAability.strikeType, UAability.element);
			case 1:
				if (Utils.flipMiss(units.get(UAtarget), units.get(UAcaster), UAability))
				{
					trace(units.get(UAcaster).name + " -> " + units.get(UAtarget).name + ": Miss!");
					for (o in observers) o.miss(UAtarget, UAability.element);
				}
				else
					Abilities.useAbility(UAability.id, UAtarget, UAcaster, UAability.element);
					
				continuePoint = useAbility;
				for (o in observers) o.abStriked(UAtarget, UAcaster, UAability.id, UAability.strikeType, UAability.element);
			case 2:
				trace("TBR: Crit damage: " + units.get(UAcaster).critDamage);
				postTurnProcess(UAcaster);
			default:
				UAiterator = 0;
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
	}
	
    //================================================================================
    // Game cycle
    //================================================================================
	
	private function alacrityIncrement()
	{
		for (unit in units.both)
			if (checkAlive([unit]))
			{
				changeAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), getAlacrityGain(unit), Source.God);
				
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
			changeAlacrity(UnitCoords.get(unit), UnitCoords.get(unit), -100, Source.God);
			
			if (!unit.isStunned()) 
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
			postTurnProcess(UnitCoords.player());
	}
	
	public function quit()
	{
		end(Team.Right);
	}
	
	public function printAbilityInfo(num:Int)
	{
		var ab:Ability = units.player().wheel.get(num);
		var result:String = '$ab.name \n$ab.type \n$ab.describition';
		if (ab.type == AbilityType.Active)
		{
			var a:Active = units.player().wheel.getActive(num);
			var maxCD:Int = XMLUtils.parseAbility(a.id, "cooldown", 1);
			var targets:String = switch (a.possibleTarget)
			{
				case AbilityTarget.Self: "self";
				case AbilityTarget.Allied: "allies & self";
				case AbilityTarget.Enemy: "enemies";
				case AbilityTarget.All: "all targets";
			}
			
			result += '\n\nCooldown: $a.cooldown/${maxCD - 1}, Manacost: $a.manacost \nPossible targets: $targets';
		}
		
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
	}
	
	public function printUnitInfo(coords:UnitCoords)
	{
		var unit:Unit = units.get(coords);
		
		var buffString:String = "";
		for (buff in unit.buffQueue.queue)
		{
			if (buffString != "")
				buffString += ";\n";
			buffString += '$buff.name ($buff.duration), Element: $buff.element \n$buff.description';
		}
		
		var result:String = '$unit.name\n\nBuffs:\n' + buffString;
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
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
			continueArgs = [];
			responsesLeft = observers.length;
			
			Reflect.callMethod(continuePoint, continuePoint, args);
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