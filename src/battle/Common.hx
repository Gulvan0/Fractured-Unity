package battle;
import graphic.Shapes;
import io.AbilityParser;
import ID.AbilityID;
import bh.enums.AttackType;
import bh.BehaviourData;
import bh.Pattern;
import haxe.ui.components.HorizontalSlider;
import openfl.geom.Point;
import bh.BHGame;
import bh.BHDemo;
import graphic.Utils;
import graphic.components.BattleResults;
import openfl.display.Sprite;
import Assets;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import battle.enums.Source;
import json2object.JsonParser;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import struct.Element;
import struct.Zone;

using engine.MathUtils;
using graphic.SpriteExtension;
using Lambda;

typedef HPupdate = {target:UnitCoords, delta:Int, newV:Int, element:Element, crit:Bool, source:Source}
typedef ManaUpdate = {target:UnitCoords, delta:Int, newV:Int}
typedef AlacUpdate = {target:UnitCoords, delta:Float, newV:Float}
typedef MissDetails = {target:UnitCoords, element:Element}
typedef DeathDetails = {target:UnitCoords}
typedef ThrowDetails = {target:UnitCoords, caster:UnitCoords, id:ID.AbilityID, type:AbilityType, element:Element}
typedef StrikeDetails = {target:UnitCoords, caster:UnitCoords, id:AbilityID, level:Int, type:AbilityType, element:Element, pattern:String}
typedef BuffQueueUpdate = {target:UnitCoords, queue:Array<Buff>}

enum ChooseResult 
{
	Ok;
	Empty;
	Manacost;
	Cooldown;
	Passive;
	BHSkill;
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
class Common extends Sprite
{
	
	public var inputMode(default, null):InputMode;
	/**Server-side coords, may differ from the ones used to display units (due to the client-is-always-to-the-left rule)*/
	public var playerCoords(default, null):UnitCoords;
	public var reversed:Bool;
	
	private var units:UPair<UnitData>;
	private var abilities:Array<Ability>;
	private var bhSkillKeyCodes:Map<Int, Ability>;
	private var chosenAbility:Null<Int>;
	private var delayedPatterns:UPair<Array<BehaviourData>>;
	
	private var bg:DisplayObject;
	/**Coordinate system may be reversed**/
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	/**Coordinate system may be reversed**/
	private var objects:UnitsAndBolts;
	private var bhgame:BHGame;
	private var bhdemo:BHDemo;
	/**Server-side coords of the current evader. May differ from the ones used to display units (due to the client-is-always-to-the-left rule)*/
	private var bhTarget:UnitCoords;
	private var soundPlayer:SoundPlayer;

	private var veil:Sprite;
	private var results:BattleResults;

	private var onFinished:Void->Void;
	
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
				case ChooseResult.BHSkill:
					objects.warn("This ability is a danmaku skill, you can only use it during danmaku mode");
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
		units.get(data.target).hp.value = data.newV;
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.hpUpdate(data.target, data.delta, data.newV, data.element, data.crit);
		objects.hpUpdate(data.target, data.delta, data.newV, data.element, data.crit, data.source);
	}
	
	public function onManaUpdate(d:String):Void 
	{
		var parser = new JsonParser<ManaUpdate>();
		var data:ManaUpdate = parser.fromJson(d);
		units.get(data.target).mana.value = data.newV;
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.manaUpdate(data.target, data.newV, data.delta);
	}
	
	public function onAlacUpdate(d:String):Void 
	{
		var parser = new JsonParser<AlacUpdate>();
		var data:AlacUpdate = parser.fromJson(d);
		units.get(data.target).alacrity.value = data.newV;
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		objects.alacUpdate(data.target, data.delta, data.newV);
	}
	
	public function onBuffQueueUpdate(d:String):Void 
	{
		var parser = new JsonParser<BuffQueueUpdate>();
		var data:BuffQueueUpdate = parser.fromJson(d);
		units.get(data.target).buffs = data.queue;
		if (reversed)
			data.target.team = revertTeam(data.target.team);
		stateBar.buffQueueUpdate(data.target, data.queue);
	}
	
	public function onTick(coords:UnitCoords):Void 
	{
		if (coords.equals(playerCoords))
			abilityBar.tick();
		stateBar.tick(coords);
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

		if (data.target.equals(playerCoords) && bhgame != null && bhgame.stage != null) //Because someone else may die during BH (blademail etc.)
			bhgame.terminate(removeChild.bind(bhgame));
		else if (bhTarget != null && data.target.equals(bhTarget) && bhdemo != null && bhdemo.stage != null) //See above
			removeChild.bind(bhdemo);//? may be changed to terminate later

		if (reversed)
			data.target.team = revertTeam(data.target.team);
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
		var parser = new JsonParser<StrikeDetails>();
		var localData:StrikeDetails = parser.fromJson(d);
		var serverData:StrikeDetails = parser.fromJson(d);
		if (reversed)
		{
			localData.target.team = revertTeam(localData.target.team);
			localData.caster.team = revertTeam(localData.caster.team);
		}
		objects.abStriked(localData.target, localData.caster, localData.id, localData.type, localData.element);

		var attackType:AttackType = AbilityParser.abilities.get(serverData.id).danmakuType;
		if (attackType == AttackType.Delayed)
		{
			var delayed = delayedPatterns.get(localData.target);
			delayed.push(new BehaviourData(serverData.id, serverData.level, Pattern.fromJson(serverData.id, serverData.pattern)));
			stateBar.addDelayedPattern(localData.target, localData.id);
		}
		else if (attackType == AttackType.Instant)
		{
			var delayed = delayedPatterns.get(localData.target);
			stateBar.flushDelayedPatterns(localData.target);
			bhTarget = serverData.target;
			var evaderElement = units.get(bhTarget).element;
			var pattern:Pattern = Pattern.fromJson(serverData.id, serverData.pattern);
			var behaviour:BehaviourData = new BehaviourData(serverData.id, serverData.level, pattern);
			
			if (serverData.target.equals(playerCoords))
			{
				bhgame = new BHGame([behaviour].concat(delayed), evaderElement, bhSkillKeyCodes);
				Utils.centre(bhgame);
				addChild(bhgame);
				delayed = [];
			}
			else
			{
				bhdemo = new BHDemo([behaviour].concat(delayed), evaderElement); 
				Utils.centre(bhdemo);
				addChild(bhdemo);
			}
		}
	}

	public function onForeignBHTick(d:String):Void
	{
		var data:Array<String> = d.split("|");
		if (bhdemo != null && bhdemo.stage != null)
			bhdemo.tick(Std.parseFloat(data[1]), Std.parseFloat(data[2]));
	}

	public function onCloseBHGameRequest(e:Dynamic):Void
	{
		bhgame.terminate(removeChild.bind(bhgame));
		bhTarget = null;
	}

	public function onCloseBHDemoRequest(e:Dynamic):Void
	{
		bhTarget = null;
		removeChild(bhdemo);
		ConnectionManager.notifyDemoClosed(); //May be chained to terminate as well
	}
	
	public function onTurn(e:Dynamic):Void
	{
		if (bhdemo != null && bhdemo.stage != null)
			removeChild.bind(bhdemo); //May be chained to terminate as well
		inputMode = InputMode.Choosing;
		abilityBar.turn();
	}
	
	public function onEnded(win:Null<Bool>, xpReward:Int, ratingReward:Null<Int>):Void
	{
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		if (bhdemo != null && bhdemo.stage != null)
			removeChild.bind(bhdemo); //May be chained to terminate as well
		else if (bhgame != null && bhgame.stage != null)
			bhgame.terminate(removeChild.bind(bhgame));
		abilityBar.terminate();
		objects.deInit();
		soundPlayer.deInit();
		veil = Shapes.fillOnlyRect(Main.screenW + 2, Main.screenH + 2, 0x000000, -1, -1, 0.8);
		addChild(veil);
		var getName = (u:UnitData)->u.name;
		results = new BattleResults(win, units.allied(playerCoords).map(getName), units.opposite(playerCoords).map(getName), xpReward, ratingReward, onBattleResultsClose);
		Utils.centre(results);
		addChild(results);
	}

	public function onBattleResultsClose()
	{
		removeChild(veil);
		removeChild(results);
		onFinished();
	}

	public function findAbility(id:AbilityID):Int
	{
		for (i in 0...abilities.length)
			if (abilities[i].id == id)
				return i;
		return -1;
	}
	
	public function checkChoose(ability:Ability):ChooseResult
	{
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (!ability.isActive())
			return ChooseResult.Passive;
		if (ability.type == AbilityType.BHSkill)
			return ChooseResult.BHSkill;
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
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		objects.init();
		abilityBar.init();
		soundPlayer.init();
	}
	
	public function new(units:Array<UnitData>, wheel:Array<Ability>, login:String, onFinished:Void->Void, ?zone:Zone = BattleArena)
	{
		super();
		this.onFinished = onFinished;
		inputMode = InputMode.None;
		reversed = false;
		
		var upair:UPair<UnitData> = new UPair([], []);
		for (u in units)
			if (u.team == Team.Left)
				upair.left.push(u);
			else
				upair.right.push(u);
		
		for (u in units)
			switch (u.id)
			{
				case ID.UnitID.Player(l): 
					if (l == login)
					{
						playerCoords = UnitCoords.get(u);
						if (u.team == Team.Right)
							reversed = true;
						break;
					}
				default:
			}
		delayedPatterns = upair.map(u->[]);

		bg = Assets.getBattleBG(zone);
		objects = new UnitsAndBolts(reversed? upair.reversed() : upair, this);
		abilityBar = new AbilityBar(wheel);
		stateBar = new UnitStateBar(reversed? upair.reversed() : upair);
		soundPlayer = new SoundPlayer();
		
		this.units = upair;
		this.abilities = wheel;
		this.bhSkillKeyCodes = [for (i in 0...abilities.length) if (abilities[i].type == BHSkill) i + 49 => abilities[i]];

		this.add(bg, 0, 0);
		this.add(objects, 0, 0);
		this.add(abilityBar, 0, 0);
		this.add(stateBar, 0, 0);
	}
}