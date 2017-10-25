package battle;
import battle.Controller;
import battle.Model;
import battle.Unit;
import battle.struct.UnitCoords;
import format.swf.data.filters.FilterBevel;
import graphics.ProgressBar;
import hxassert.Assert;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Cubic;
import motion.easing.Quad;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.ConvolutionFilter;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.text.TextField;
import openfl.text.TextFormat;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.DamageSource;
import Element;
import Assets;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.MovieClip;
import battle.enums.InputMode;
import MathUtils;
import battle.enums.Team;

using StringTools;

/**
 * [ROOT] vision OF APP IN battle
 * @author Gulvan
 */
class Vision extends Sprite
{

	private var bg:DisplayObject;
	private var upperBar:DisplayObject;
	private var bottomBar:DisplayObject;
	private var skipTurn:DisplayObject;
	private var leaveBattle:DisplayObject;
	
	private var alliesVision:Array<MovieClip>;
	private var enemiesVision:Array<MovieClip>;
	private var abilitiesVision:Array<MovieClip>;
	
	private var allyNames:Array<TextField>;
	private var allyHPs:Array<TextField>;
	private var allyManas:Array<TextField>;
	private var enemyNames:Array<TextField>;
	private var enemyHPs:Array<TextField>;
	private var enemyManas:Array<TextField>;
	
	private var shiftKey:Bool;
	
	//================================================================================
    // Levers
    //================================================================================	
	
	public function changeUnitHP(target:Unit, delta:Int, element:Element, source:DamageSource)
	{
		if (target.team == battle.enums.Team.Left)
			allyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
		else if (target.team == battle.enums.Team.Right)
			enemyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
	}
	
	public function changeUnitMana(target:Unit, delta:Int)
	{
		if (target.team == battle.enums.Team.Left)
			allyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
		else if (target.team == battle.enums.Team.Right)
			enemyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
	}
	
	public function changeUnitAlacrity(unit:Unit, delta:Float)
	{
		if(Math.random() > 0.9)
			trace(unit.name + "(" + unit.position + " pos) alacrity changed: " + (unit.alacrityPool.value - delta) + "->" + unit.alacrityPool.value);
		//Redrawing alacrity bar
	}
	
	public function castBuff(id:ID, duration:Int)
	{
		//Displaying new buff in a wheel
	}
	
	public function redrawBuffs(target:Unit, buffs:Array<Buff>)
	{
		//Redrawing buffs
	}
	
	public function unitMiss(target:UnitCoords, element:Element)
	{
		//miss display
	}
	
	public function die(unit:UnitCoords)
	{
		remove(getUnit(unit));
	}
	
	//================================================================================
    // Input responses
    //================================================================================		
	
	public function selectAbility(num:Int)
	{
		
	}
	
	public function deselectAbility(num:Int)
	{
		
	}
	
	public function target(coords:UnitCoords)
	{
		
	}
	
	public function printWarning(text:String)
	{
		//replace with visual error printing
		#if js
		js.Browser.alert(text);
		#elseif neko
		trace("WARN//" + text);
		#end
	}
	
	//================================================================================
    // Basic animations
    //================================================================================
	
	public function abilityIntro(target:UnitCoords, caster:UnitCoords, ability:{type:battle.enums.AbilityType, element:Element}, callback:Dynamic)
	{
		switch (ability.type)
		{
			case battle.enums.AbilityType.Bolt:
				animateBolt(target, caster, ability.element, callback);
			case battle.enums.AbilityType.Kick:
				animateKickIn(target, caster, callback);
			default:
				cleanAndCallback(callback);
		}
	}
	
	public function abilityOutro(target:UnitCoords, caster:UnitCoords, ability:{id:ID, type:AbilityType}, callback:Dynamic)
	{
		switch (ability.type)
		{
			case battle.enums.AbilityType.Kick:
				animateKickOut(caster, callback);
			case battle.enums.AbilityType.Spell:
				animateSpell(ability.id, target, callback);
			default:
				cleanAndCallback(callback);
		}
	}
	
	//================================================================================
    // Animation supply
    //================================================================================	
	
	private function animateBolt(target:UnitCoords, caster:UnitCoords, element:Element, callback:Dynamic)
	{
		var animation:MovieClip = Assets.getBoltByElement(element);
		add(animation, unitX(caster.pos, caster.team), unitY(caster.pos) + 50);
		animation.play();
		
		var actuator:GenericActuator<MovieClip> = Actuate.tween(animation, 0.7, {x: unitX(target.pos, target.team), y: unitY(target.pos) + 50});
		actuator.ease(Quad.easeIn);
		actuator.onComplete(cleanAndCallback, [callback, animation]);
	}
	
	private function animateKickIn(target:UnitCoords, caster:UnitCoords, callback:Dynamic)
	{
		function t2() {
			Actuate.timer(0.6).onComplete(callback);
		}
		
		function t1() {
			var actuator:GenericActuator<MovieClip>;
			var kicker:MovieClip = getUnit(caster);
			var closeDeltaX:Int = caster.team == battle.enums.Team.Left? -20 : 20;
			
			actuator = Actuate.tween(kicker, 0.5, {x: unitX(target.pos, target.team) + closeDeltaX, y: unitY(target.pos)});
			actuator.onComplete(t2);
			actuator.ease(Cubic.easeOut);
		}
			
		t1();
	}
	
	private function animateKickOut(caster:UnitCoords, callback:Dynamic)
	{
		var kicker:MovieClip = getUnit(caster);
			
		var actuator:GenericActuator<MovieClip> = Actuate.tween(kicker, 0.5, {x: unitX(caster.pos, caster.team), y: unitY(caster.pos)});
		actuator.onComplete(callback);
		actuator.ease(Cubic.easeOut);
	}
	
	private function animateSpell(abilityID:String, target:UnitCoords, callback:Dynamic)
	{
		var animation:MovieClip = Assets.getSpellAnimByAbilityID(abilityID);
		var targetVision:MovieClip = getUnit(target);
		
		playOnce(animation, targetVision.x, targetVision.y, callback);
	}
	
	private function cleanAndCallback(callback:Dynamic, ?animation:Null<MovieClip>)
	{
		if (animation != null)
			remove(animation);
		Reflect.callMethod(callback, callback, []);
	}
	
	//================================================================================
    // Info visualizers
    //================================================================================	
	
	public function printAbilityInfo(info:AbilityInfo)
	{
		var targetString:String = switch (info.target)
		{
			case battle.enums.AbilityTarget.Self: "self";
			case battle.enums.AbilityTarget.Allied: "allies & self";
			case battle.enums.AbilityTarget.Enemy: "enemies";
			case battle.enums.AbilityTarget.All: "all targets";
		}
		
		var result:String = info.name + "\n" + info.describition + "\n\nCooldown: " + info.currentCooldown + "/" + (info.maxCooldown - 1) + ", Manacost: " + info.manacost + "\nType: " + info.type + "\nPossible targets: " + targetString;
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
	}
	
	public function printUnitInfo(info:UnitInfo)
	{
		var buffString:String = "";
		for (buff in info.buffQueue.queue)
		{
			if (buffString != "")
				buffString += ";\n";
			buffString += buff.name + "(" + buff.duration + ")" + ", Element: " + buff.element + "\n" + buff.describition;
		}
		
		var result:String = info.name + "\n\nBuffs: \n" + buffString;
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
	}
	
	//================================================================================
    // Handlers
    //================================================================================	
	
	private function keyUpHandler(e:KeyboardEvent)
	{
		trace("keyUp handled: " + e.keyCode);
		
		if (e.keyCode == 16)
            shiftKey = false;
	}
	
	private function keyHandler(e:KeyboardEvent)
	{
		trace("key handled: " + e.keyCode);
		
		if (e.keyCode == 16)
		{
			shiftKey = true;
		}
		else if (MathUtils.inRange(e.keyCode, 49, 57))
		{
			if (shiftKey)
				Controller.instance.printAbilityInfo(e.keyCode - 49);
			else if (Controller.instance.inputMode != InputMode.None)
				Controller.instance.choose(e.keyCode - 49);
		}
	}
	
	private function clickHandler(e:MouseEvent)
	{
		var clickPoint:Point = new Point(e.stageX, e.stageY);
		
		trace("click handled: " + clickPoint.x + ", " + clickPoint.y);
		
		for (team in Type.allEnums(Team))
			for (i in 0...3)
			{
				if (MathUtils.contains(clickPoint, getUnitBounds(i, team)))
				{
					if (shiftKey)
						Controller.instance.printUnitInfo(new UnitCoords(team, i));
					else if (Controller.instance.inputMode == InputMode.Targeting)
						Controller.instance.use(new UnitCoords(team, i));
					return;
				}
			}
		if (MathUtils.getDistance(clickPoint, new Point(787, 558)) <= 22)
		{
			Controller.instance.skipTurnAttempt();
			return;
		}
		else if (MathUtils.getDistance(clickPoint, new Point(851, 559)) <= 22)
		{
			Controller.instance.end(Team.Right);
			return;
		}
	}
	
	//================================================================================
    // INIT + CONSTRUCTOR
    //================================================================================
	
	public function init(zone:Int, allies:Array<battle.Unit>, enemies:Array<battle.Unit>) 
	{
		bg = Assets.getBattleBGByZone(zone);
		upperBar = new UpperBattleBar();
		bottomBar = new BottomBattleBar();
		skipTurn = new SkipTurn();
		leaveBattle = new LeaveBattle();
		
		alliesVision = [];
		enemiesVision = [];
		abilitiesVision = [];
		
		allyNames = [];
		allyHPs = [];
		allyManas = [];
		enemyNames = [];
		enemyHPs = [];
		enemyManas = [];
		
		for (ally in allies)
			alliesVision.push(Assets.getAssetByID(ally.id));
		for (enemy in enemies)
			enemiesVision.push(Assets.getAssetByID(enemy.id));
		for (i in 0...10)
			abilitiesVision.push(Assets.getAssetByID(allies[0].wheel.get(i).id));
			
		for (ally in allies)
		{
			addTextfield(allyNames, ally.name, "Trebuchet MS", 12);
			addTextfield(allyHPs, ally.hpPool.value + "/" + ally.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true);
			addTextfield(allyManas, ally.manaPool.value + "/" + ally.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true);
		}
		for (enemy in enemies)
		{
			addTextfield(enemyNames, enemy.name, "Trebuchet MS", 12);
			addTextfield(enemyHPs, enemy.hpPool.value + "/" + enemy.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true);
			addTextfield(enemyManas, enemy.manaPool.value + "/" + enemy.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true);
		}
			
		add(bg, -37.5, -17.5);
		add(upperBar, 4, 0);
		add(bottomBar, 4.85, 515.7);
		add(skipTurn, 766, 537);
		add(leaveBattle, 830, 537);
		
		for (i in 0...alliesVision.length)
			add(alliesVision[i], unitX(i, battle.enums.Team.Left), unitY(i));
		for (i in 0...enemiesVision.length)
			add(enemiesVision[i], unitX(i, battle.enums.Team.Right), unitY(i));
		for (i in 0...10)
			add(abilitiesVision[i], abilityX(i), 533);
			
		for (i in 0...allies.length)
		{
			add(allyNames[i], unitInfoX(battle.enums.Team.Left, "name"), unitInfoY(i));
			add(allyHPs[i], unitInfoX(battle.enums.Team.Left, "hp"), unitInfoY(i));
			add(allyManas[i], unitInfoX(battle.enums.Team.Left, "mana"), unitInfoY(i));
		}
		
		for (i in 0...enemies.length)
		{
			add(enemyNames[i], unitInfoX(battle.enums.Team.Right, "name"), unitInfoY(i));
			add(enemyHPs[i], unitInfoX(battle.enums.Team.Right, "hp"), unitInfoY(i));
			add(enemyManas[i], unitInfoX(battle.enums.Team.Right, "mana"), unitInfoY(i));
		}
		
		shiftKey = false;
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		
		//var test:ProgressBar = new ProgressBar(900, 10);
		//add(test, 0, 505.7);
		//test.progress = 0.4;
	}
	
	public function new()
	{
		super();
	}
	
	//================================================================================
    // Inline map
    //================================================================================
	
	private static inline function abilityX(i:Int):Float
	{
		return 15 + i * 70;
	}
	
	private static inline function unitX(pos:Int, team:battle.enums.Team):Float
	{
		if (pos == 0)
			return (team == battle.enums.Team.Left)? 235 : 600;
		else if (pos == 1 || pos == 2)
			return (team == battle.enums.Team.Left)? 100 : 735;
		else
			return -1;
	}
	
	private static inline function unitY(pos:Int):Float
	{
		if (pos == 0)
			return 215;
		else if (pos == 1)
			return 355;
		else if (pos == 2)
			return 105;
		else
			return -1;
	}
	
	private static inline function unitInfoX(team:battle.enums.Team, type:String)
	{
		if (type == "name")
			return (team == battle.enums.Team.Left)? 3 : 564;
		else if (type == "hp")
			return (team == battle.enums.Team.Left)? 180 : 742;
		else if (type == "mana")
			return (team == battle.enums.Team.Left)? 267 : 828;
		else 
			return -1;
	}
	
	private static inline function unitInfoY(pos:Int):Float
	{
		if (pos == 0)
			return 28;
		else if (pos == 1)
			return 53;
		else if (pos == 2)
			return 4;
		else
			return -1;
	}
	
	//================================================================================
    // Graphic utils & core
    //================================================================================
	
	private inline function getUnitBounds(pos:Int, team:battle.enums.Team):Rectangle
	{
		var sample:MovieClip = new Ghost();
		return new Rectangle(unitX(pos, team), unitY(pos), sample.width, sample.height);
	}
	
	private function addTextfield(targetArray:Array<TextField>, text:String, font:String, size:Int, color:Null<Int> = null, bold:Null<Bool> = null)
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color, bold);
		t.text = text;
		t.setTextFormat(format);
		targetArray.push(t);
	}
	
	private function playOnce(mc:MovieClip, x:Float, y:Float, ?onComplete:Null<Dynamic>, ?onCompleteParams:Null<Array<Dynamic>>)
	{
		function handler(e:Event) {
			if (mc.currentFrame == mc.totalFrames)
			{
				mc.removeEventListener(Event.ENTER_FRAME, handler);
				mc.stop();
				remove(mc);
				if (onComplete != null)
					Reflect.callMethod(onComplete, onComplete, onCompleteParams);
			}
		}
		
		if (onCompleteParams == null)
			onCompleteParams = [];
		
		add(mc, x, y);
		mc.addEventListener(Event.ENTER_FRAME, handler);
		mc.play();
	}
	
	public function add(object:DisplayObject, x:Float, y:Float)
	{
		addChild(object);
		object.x = x;
		object.y = y;
	}
	
	public function remove(object:DisplayObject)
	{
		removeChild(object);
	}
	
	//================================================================================
    // Other
    //================================================================================
	
	private function getUnit(coords:UnitCoords):MovieClip
	{
		var array:Array<MovieClip> = (coords.team == battle.enums.Team.Left)? alliesVision : enemiesVision;
		return array[coords.pos];
	}
}