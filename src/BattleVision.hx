package;
import dataobj.AbilityInfo;
import dataobj.UnitInfo;
import format.swf.data.filters.FilterBevel;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Cubic;
import motion.easing.Quad;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.ConvolutionFilter;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.text.TextField;
import openfl.text.TextFormat;
import utils.AbilityTarget;
import utils.AbilityType;
import utils.BattleControllerUseMode;
import utils.DamageSource;
import utils.Element;
import data.Assets;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.MovieClip;
import utils.InputMode;
import utils.MathUtils;
import utils.Team;
import utils.Utils;

using StringTools;

/**
 * [ROOT] vision OF APP IN battle
 * @author Gulvan
 */
class BattleVision extends Sprite
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
	
	//================================================================================
    // Levers
    //================================================================================	
	
	public function changeUnitHP(target:BattleUnit, delta:Int, element:Element, source:DamageSource)
	{
		if (target.team == Team.Left)
			allyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
		else if (target.team == Team.Right)
			enemyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
	}
	
	public function changeUnitMana(target:BattleUnit, delta:Int)
	{
		if (target.team == Team.Left)
			allyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
		else if (target.team == Team.Right)
			enemyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
	}
	
	public function castBuff(id:String, duration:Int)
	{
		//Displaying new buff in a wheel
	}
	
	public function redrawBuffs(target:BattleUnit, buffs:Array<Buff>)
	{
		//Redrawing buffs
	}
	
	public function selectAbility(num:Int)
	{
		
	}
	
	public function deselectAbility(num:Int)
	{
		
	}
	
	public function target(team:Team, pos:Int)
	{
		//targeting animation
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility)
	{
		if (ability.type == AbilityType.Bolt)
		{
			var animation:MovieClip = switch (ability.element)
			{
				case Element.Lightning: new LightningBolt();
				default: new LightningBolt();
			}
			var actuator:GenericActuator<MovieClip>;
			
			add(animation, unitX(caster.position, caster.team), unitY(caster.position) + 50);
			animation.play();
			actuator = Actuate.tween(animation, 0.7, {x: unitX(target.position, target.team), y: unitY(target.position) + 50});
			actuator.onComplete(onUseAnimOver, [target, caster, ability, animation]);
			actuator.ease(Quad.easeIn);
		}
		else if (ability.type == AbilityType.Kick)
		{
			function t3()
			{
				var actuator:GenericActuator<MovieClip>;
				var kicker:MovieClip = getUnit(caster.team, caster.position);
				
				actuator = Actuate.tween(kicker, 0.5, {x: unitX(caster.position, caster.team), y: unitY(caster.position)});
				actuator.onComplete(onUseAnimOver, [target, caster, ability]);
				actuator.ease(Cubic.easeOut);
			}
			
			function t2()
			{
				Actuate.timer(0.8).onComplete(t3);
			}
			
			function t1()
			{
				var actuator:GenericActuator<MovieClip>;
				var kicker:MovieClip = getUnit(caster.team, caster.position);
				var closeDeltaX:Int = caster.team == Team.Left? -20 : 20;
				
				actuator = Actuate.tween(kicker, 0.5, {x: unitX(target.position, target.team) + closeDeltaX, y: unitY(target.position)});
				actuator.onComplete(t2);
				actuator.ease(Cubic.easeOut);
			}
			
			t1();
		}
		else
			onUseAnimOver(target, caster, ability);
	}
	
	public function unitMiss(target:BattleUnit)
	{
		//miss display
	}
	
	public function die(team:Team, pos:Int)
	{
		remove(getUnit(team, pos));
	}
	
	public function printAbilityInfo(info:AbilityInfo)
	{
		var targetString:String = switch (info.target)
		{
			case AbilityTarget.Self: "self";
			case AbilityTarget.Allied: "allies & self";
			case AbilityTarget.Enemy: "enemies";
			case AbilityTarget.All: "all targets";
		}
		#if js
		js.Browser.alert(info.name + "\n" + info.describition + "\n\nCooldown: " + info.currentCooldown + "/" + (info.maxCooldown - 1) + ", Manacost: " + info.manacost + "\nType: " + info.type + "\nPossible targets: " + targetString);
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
		#if js
		js.Browser.alert(info.name + "\n\nBuffs: \n" + buffString);
		#end
	}
	
	public function printWarning(text:String)
	{
		//replace with visual error printing
		#if js
		js.Browser.alert(text);
		#end
	}
	
	//================================================================================
    // INIT + CONSTRUCTOR
    //================================================================================
	
	public function init(zone:Int, allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
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
			add(alliesVision[i], unitX(i, Team.Left), unitY(i));
		for (i in 0...enemiesVision.length)
			add(enemiesVision[i], unitX(i, Team.Right), unitY(i));
		for (i in 0...10)
			add(abilitiesVision[i], abilityX(i), 533);
			
		for (i in 0...allies.length)
		{
			add(allyNames[i], unitInfoX(Team.Left, "name"), unitInfoY(i));
			add(allyHPs[i], unitInfoX(Team.Left, "hp"), unitInfoY(i));
			add(allyManas[i], unitInfoX(Team.Left, "mana"), unitInfoY(i));
		}
		
		for (i in 0...enemies.length)
		{
			add(enemyNames[i], unitInfoX(Team.Right, "name"), unitInfoY(i));
			add(enemyHPs[i], unitInfoX(Team.Right, "hp"), unitInfoY(i));
			add(enemyManas[i], unitInfoX(Team.Right, "mana"), unitInfoY(i));
		}
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
	}
	
	public function new()
	{
		super();
	}
	
	//================================================================================
    // Handlers
    //================================================================================	
	
	private function keyHandler(e:KeyboardEvent)
	{
		trace("key handled");
		if (MathUtils.inRange(e.keyCode, 49, 57))
		{
			trace("in range");
			if (e.shiftKey)
				BattleController.instance.printAbilityInfo(e.keyCode - 49);
			else if (BattleController.instance.inputMode != InputMode.None)
			{
				trace("sufficent mode");
				BattleController.instance.chooseAbility(e.keyCode - 49);
			}
		}
	}
	
	private function clickHandler(e:MouseEvent)
	{
		var clickPoint:Point = new Point(e.stageX, e.stageY);
		trace("click handled: " + clickPoint.x + ", " + clickPoint.y);
		
		for (team in Type.allEnums(Team))
			for (i in 0...3)
			{
				if (Utils.contains(clickPoint, getUnitBounds(i, team)))
				{
					if (e.shiftKey)
						BattleController.instance.printUnitInfo(team, i);
					else if (BattleController.instance.inputMode == InputMode.Targeting)
						BattleController.instance.target(team, i);
					return;
				}
			}
		if (MathUtils.getDistance(clickPoint, new Point(787, 558)) <= 22)
		{
			BattleController.instance.skipTurnAttempt();
			return;
		}
		else if (MathUtils.getDistance(clickPoint, new Point(851, 559)) <= 22)
		{
			BattleController.instance.end(Team.Right);
			return;
		}
	}
	
	private function onUseAnimOver(target:BattleUnit, caster:BattleUnit, ability:BattleAbility, ?animation:Null<MovieClip>)
	{
		if (animation != null)
			remove(animation);
		BattleController.instance.useAbility(target, caster, ability, BattleControllerUseMode.Continue);
	}
	
	//================================================================================
    // Inline map
    //================================================================================
	
	private static inline function abilityX(i:Int):Float
	{
		return 15 + i * 70;
	}
	
	private static inline function unitX(pos:Int, team:Team):Float
	{
		if (pos == 0)
			return (team == Team.Left)? 235 : 600;
		else if (pos == 1 || pos == 2)
			return (team == Team.Left)? 100 : 735;
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
	
	private static inline function unitInfoX(team:Team, type:String)
	{
		if (type == "name")
			return (team == Team.Left)? 3 : 564;
		else if (type == "hp")
			return (team == Team.Left)? 180 : 742;
		else if (type == "mana")
			return (team == Team.Left)? 267 : 828;
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
	
	private inline function getUnitBounds(pos:Int, team:Team):Rectangle
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
	
	private function getUnit(team:Team, pos:Int):MovieClip
	{
		var array:Array<MovieClip> = (team == Team.Left)? alliesVision : enemiesVision;
		return array[pos];
	}
}