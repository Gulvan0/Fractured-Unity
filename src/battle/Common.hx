package battle;
import Assets;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import json2object.JsonParser;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

using MathUtils;

typedef HPupdate = {target:UnitCoords, delta:Int, newV:Int, element:Element, crit:Bool, fromAbility:Bool}
typedef ManaUpdate = {target:UnitCoords, delta:Int, newV:Int}
typedef AlacUpdate = {target:UnitCoords, delta:Float, newV:Float}
typedef MissDetails = {target:UnitCoords, element:Element}
typedef DeathDetails = {target:UnitCoords}
typedef ThrowDetails = {target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element}
typedef BuffQueueUpdate = {target:UnitCoords, queue:Array<Buff>}

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
	NoAbility;
} 

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	public var inputMode(default, null):InputMode;
	private var playerCoords:UnitCoords;
	private var reversed:Bool;
	
	private var units:UPair<UnitData>;
	private var abilities:Array<Ability>;
	private var chosenAbility:Null<Int>;
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	
	private function keyHandler(e:KeyboardEvent)
	{
		if (e.keyCode.inRange(49, 57))
			choose(e.keyCode - 49);
	}
	
	public function choose(abNum:Int)
	{
		if (inputMode != InputMode.None)
			switch (checkChoose(abilities[abNum]))
			{
				case ChooseResult.Ok:
					if (chosenAbility != null)
						abilityBar.abDeselected(chosenAbility);
					chosenAbility = abNum;
					abilityBar.abSelected(chosenAbility);
					objects.abSelected(chosenAbility);
					inputMode = InputMode.Targeting;
				case ChooseResult.Passive:
					objects.warn("This ability is passive, you can't use it");
				case ChooseResult.Manacost:
					objects.warn("Not enough mana");
				case ChooseResult.Cooldown:
					objects.warn("This ability is currently on cooldown");
				case ChooseResult.Empty:
					objects.warn("There is no ability in this slot");
			}
		else
			objects.warn("It's not your turn yet");
	}
	
	public function target(coords:UnitCoords)
	{
		if (reversed)
			coords.team = revertTeam(coords.team);
		trace(91);
		if (inputMode == InputMode.Targeting)
			switch (checkTarget(coords))
			{
				case TargetResult.Ok:
					inputMode = InputMode.None;
					abilityBar.abDeselected(chosenAbility);
					objects.abDeselected(chosenAbility);
					ConnectionManager.useAbility({abilityNum: chosenAbility, target: coords});
					chosenAbility = null;
				case TargetResult.Invalid:
					objects.warn("Chosen ability can't be used on this target");
					abilityBar.abDeselected(chosenAbility);
					objects.abDeselected(chosenAbility);
					chosenAbility = null;
					inputMode = InputMode.Choosing;
				default:
			}
	}
	
	private function revertTeam(t:Team):Team
	{
		return t == Team.Right? Team.Left : Team.Right;
	}
	
	public function onhpUpdate(d:String):Void 
	{
		var parser = new JsonParser<HPupdate>();
		var data:HPupdate = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.hpUpdate(data.target, data.delta, data.newV, data.element, data.crit);
		objects.hpUpdate(data.target, data.delta, data.newV, data.element, data.crit, data.fromAbility);
	}
	
	public function onManaUpdate(d:String):Void 
	{
		var parser = new JsonParser<ManaUpdate>();
		var data:ManaUpdate = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.manaUpdate(data.target, data.newV, data.delta);
	}
	
	public function onAlacUpdate(d:String):Void 
	{
		var parser = new JsonParser<AlacUpdate>();
		var data:AlacUpdate = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		trace("Alacrity update recieved: " + data.newV);
		objects.alacUpdate(data.target, data.delta, data.newV);
		trace("Alacrity update registered: " + data.newV);
	}
	
	public function onBuffQueueUpdate(d:String):Void 
	{
		var parser = new JsonParser<BuffQueueUpdate>();
		var data:BuffQueueUpdate = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.buffQueueUpdate(data.target, data.queue);
	}
	
	public function onTick(e:Dynamic):Void 
	{
		abilityBar.tick();
	}
	
	public function onMiss(d:String):Void 
	{
		var parser = new JsonParser<MissDetails>();
		var data:MissDetails = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		objects.miss(data.target, data.element);
	}
	
	public function onDeath(d:String):Void 
	{
		var parser = new JsonParser<DeathDetails>();
		var data:DeathDetails = parser.fromJson(d);
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		units.kill(data.target);
		stateBar.death(data.target);
		objects.death(data.target);
	}
	
	public function onThrown(d:String):Void 
	{
		var parser = new JsonParser<ThrowDetails>();
		var data:ThrowDetails = parser.fromJson(d);
		var oldData:ThrowDetails = parser.fromJson(d);
		if (reversed)
		{
			data.target.team = revertTeam(data.target.team);
			data.caster.team = revertTeam(data.caster.team);
		}
		objects.abThrown(data.target, data.caster, data.id, data.type, data.element);
		if (oldData.caster.equals(playerCoords))
			abilityBar.ownAbThrown(data.id);
	}
	
	public function onStrike(d:String):Void 
	{
		var parser = new JsonParser<ThrowDetails>();
		var data:ThrowDetails = parser.fromJson(d);
		if (reversed)
		{
			data.target.team = revertTeam(data.target.team);
			data.caster.team = revertTeam(data.caster.team);
		}
		objects.abStriked(data.target, data.caster, data.id, data.type, data.element);
	}
	
	public function onTurn(e:Dynamic):Void
	{
		inputMode = InputMode.Choosing;
		abilityBar.turn();
	}
	
	public function onEnded(win:Null<Bool>):Void
	{
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		abilityBar.deInit();
		objects.deInit();
	}
	
	public function checkChoose(ability:Ability):ChooseResult
	{
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.type == AbilityType.Passive)
			return ChooseResult.Passive;
		
		if (ability.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!units.get(playerCoords).checkAffordable(ability.manacost))
			return ChooseResult.Manacost;
		
		return ChooseResult.Ok;
	}
	
	public function checkTarget(coords:UnitCoords):TargetResult
	{
		var target:UnitData = units.get(coords);
		
		if (chosenAbility == null)
			return TargetResult.NoAbility;
		if (target == null)
			return TargetResult.Nonexistent;
		if (target.hp.value == 0)
			return TargetResult.Dead;
		if (!abilities[chosenAbility].checkValid(playerCoords, coords))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
	}
	
	//================================================================================
	
	private static var ABILITYBARH:Float = 128;
	private static var ABILITYBARX:Float = 0;
	private static var ABILITYBARY:Float = Main.screenH - ABILITYBARH;
	private static var STATEBARX:Float = 0;
	private static var STATEBARY:Float = 0;
	
	public function init() 
	{	
		add(bg, 0, 0);
		trace(5);
		add(objects, 0, 0);
		trace(5);
		add(abilityBar, ABILITYBARX, ABILITYBARY);
		trace(5);
		add(stateBar, STATEBARX, STATEBARY);
		trace(5);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		trace(5);
		objects.init();
		trace(5);
		abilityBar.init();
		trace(5);
		stateBar.init();
		trace(5);
	}
	
	public function new(zone:Zone, units:Array<UnitData>, wheel:Array<Ability>, login:String)
	{
		super();
		inputMode = InputMode.None;
		reversed = false;
		trace(3);
		
		var upair:UPair<UnitData> = new UPair([], []);
		trace(units);
		for (u in units)
			if (u.team == Team.Left)
				upair.left.push(u);
			else
				upair.right.push(u);
		trace(3);
		for (u in units)
			switch (u.id)
			{
				case ID.Player(l): 
					if (l == login)
					{
						playerCoords = UnitCoords.get(u);
						if (u.team == Team.Right)
							reversed = true;
						break;
					}
				default:
			}
		trace(3);
		
		bg = Assets.getBattleBG(zone);
		trace(3);
		objects = new UnitsAndBolts(reversed? upair.reversed() : upair, this);
		trace(3);
		abilityBar = new AbilityBar(wheel);
		trace(3);
		stateBar = new UnitStateBar(reversed? upair.reversed() : upair);
		trace(3);
		
		this.units = upair;
		this.abilities = wheel;
	}
}