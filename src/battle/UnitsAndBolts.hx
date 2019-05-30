package battle;
import graphic.Utils;
import battle.Buff;
import battle.Common.TargetResult;
import battle.enums.InputMode;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.enums.Source;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import graphic.Fonts;
import graphic.components.ProgressBar;
import haxe.Constraints.Function;
import haxe.Timer;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Cubic;
import motion.easing.Quad;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.geom.Point;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

using MathUtils;

enum ThrowPhase
{
	None;
	Thrown;
	Resulting;
}

/**
 * Vision of units and ability animations
 * @author Gulvan
 */
class UnitsAndBolts extends SSprite 
{
	private var common:Common;
	
	private var warnField:TextField;
	private var unitsVision:UPair<MovieClip>;
	private var alacrityBars:UPair<ProgressBar>;
	private var selectedUnit:Array<MovieClip>;
	
	private var phase:ThrowPhase = ThrowPhase.None;
	private var lastThrownType:StrikeType;
	
	
	private var UNITW:Float = 54.5;
	private var UNITH:Float = Assets.getPlayer(Element.Lightning).height;
	private var ALACBARW:Float = 150;
	private var WARNX:Float = 0;
	private var WARNY:Float = 125;
	private var WARNW:Float = Main.screenW;
	
	private function ALACBARX(coords:UnitCoords):Float
	{
		return UNITX(coords) - (ALACBARW - UNITW) / 2;
	}
	
	private function ALACBARY(coords:UnitCoords):Float
	{
		return UNITY(coords) + UNITH + 5;
	}
	
	private inline function UNITX(coords:UnitCoords):Float
	{
		var a:Float = (coords.pos == 0)? 270 : 125;
		return (coords.team == Team.Left)? a : 1366 - a - UNITW;
	}
	
	private inline function UNITY(coords:UnitCoords):Float
	{
		if (coords.pos == 0)
			return 310;
		else if (coords.pos == 1)
			return 440;
		else if (coords.pos == 2)
			return 180;
		else
			return -1;
	}
	
	//------------------------------------------------------------------------------------------
	
	public function new(units:UPair<UnitData>, common:Common) 
	{
		super();
		this.common = common;
		var alliesVision:Array<MovieClip> = [for (a in units.left) (a.isPlayer())? Assets.getPlayer(a.element) : Assets.getUnit(a.id)];
		var enemiesVision:Array<MovieClip> = [for (e in units.right) (e.isPlayer())? Assets.getPlayer(e.element) : Assets.getUnit(e.id)];
		unitsVision = new UPair(alliesVision, enemiesVision);
		alacrityBars = UPair.map(units.left, units.right, function(t){return new ProgressBar(ALACBARW, 5, 0x15B082, 0.5, 0, null, null, t.alacrity.maxValue);});
		selectedUnit = [];
		
		var format:TextFormat = new TextFormat();
		format.size = 18;
		format.bold = true;
		format.color = 0xD50010;
		format.align = TextFormatAlign.CENTER;
		warnField = new TextField();
		warnField.width = WARNW;
		warnField.visible = false;
		warnField.setTextFormat(format);
	}
	
	public function init() 
	{
		for (u in unitsVision)
		{
			var coords:UnitCoords = unitsVision.find(u);
			add(u, UNITX(coords), UNITY(coords));
			add(alacrityBars.get(coords), ALACBARX(coords), ALACBARY(coords));
			add(warnField, WARNX, WARNY);
		}
			
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
	}
	
	public function deInit()
	{
		stage.removeEventListener(MouseEvent.CLICK, clickHandler);
	}
	
	private function animateTF(target:UnitCoords, element:Element, text:String, ?heal:Bool = false)
	{
		var coords:UnitCoords = target;
		var tf:TextField = new TextField();
		var format:TextFormat = new TextFormat();
		format.color = Fonts.color(heal? null : element);
		format.size = 50;
		format.align = TextFormatAlign.CENTER;
		format.font = Fonts.DAMAGE;
		tf.text = text;
		tf.width = 200;
		tf.setTextFormat(format);
		tf.filters = [new DropShadowFilter(Utils.darken(format.color))];
		
		add(tf, UNITX(coords) - 90, UNITY(coords) + unitsVision.get(coords).height * 0.25);
		Actuate.tween(tf, 1.5, {y: UNITY(coords) + unitsVision.get(coords).height, alpha: 0});
	}
	
	//-------------------------------------------------------------------------------------------
	
	private function clickHandler(e:MouseEvent)
	{
		var clickPoint:Point = new Point(e.stageX, e.stageY);
		for (unit in unitsVision)
			if (clickPoint.inside(unit.getRect(this)))
			{
				if (common.inputMode == InputMode.Targeting)
				{
					trace(90);
					unglowSelected();
					trace(90);
					common.target(unitsVision.find(unit));
					trace(90);
				}
				return;
			}
	}
	
	private function moveHandler(e:MouseEvent)
	{
		if (common.inputMode == InputMode.Targeting)
		{
			unglowSelected();
			findAndGlow();
		}
	}
	
	private function findAndGlow():Bool
	{
		var array = (stage.mouseX > Main.screenW / 2)? unitsVision.right : unitsVision.left;
			
		for (unit in array)
			if ((new Point(stage.mouseX, stage.mouseY)).inside(unit.getRect(this)))
			{
				if (!Lambda.empty(selectedUnit) && selectedUnit[0] != unit)
					unglowSelected();
				var color:Int = common.checkTarget(unitsVision.find(unit)) == TargetResult.Ok? 0x00C431 : 0xEC1C11;
				selectedUnit.push(unit);
				System.gc();
				unit.filters = [new DropShadowFilter(4, 45, color), new DropShadowFilter(4, 225, color)];
				return true;
			}
		return false;
	}
	
	private function unglowSelected()
	{
		if (!Lambda.empty(selectedUnit))
		{
			selectedUnit[0].filters = [];
			selectedUnit = [];
		}
	}
	
	public function hpUpdate(target:UnitCoords, dhp:Int, newV:Int, element:Element, crit:Bool, source:Source):Void 
	{
		if (source == Source.Ability && lastThrownType != StrikeType.Spell)
		{
			var t:Timer = new Timer(100);
			t.run = function ()
			{
				if (phase == ThrowPhase.Resulting)
				{
					t.stop();
					animateTF(target, element, Math.abs(dhp) + (crit? "!" : ""), dhp > 0);
				}
			}
			t.run();
		}
		else
			animateTF(target, element, Math.abs(dhp) + (crit? "!" : ""), dhp > 0);
	}
	
	public function alacUpdate(unit:UnitCoords, dalac:Float, newV:Float):Void 
	{
		var bar:ProgressBar = alacrityBars.get(unit);
		Actuate.tween(bar, 0.3, {progress: newV / bar.capacity});
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		var t:Timer = new Timer(100);
		t.run = function ()
		{
			if (phase == ThrowPhase.Resulting)
			{
				t.stop();
				animateTF(target, element, "MISS");
			}
		}
		t.run();
	}
	
	public function death(unit:UnitCoords):Void 
	{
		remove(unitsVision.get(unit));
	}
	
	public function abSelected(num:Int):Void 
	{
		findAndGlow();
	}
	
	public function abDeselected(num:Int):Void 
	{
		unglowSelected();
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		phase = ThrowPhase.Thrown;
		lastThrownType = type;
		switch (type)
		{
			case StrikeType.Bolt:
				animateBolt(target, caster, element);
			case StrikeType.Kick:
				animateKickIn(target, caster);
			default:
		}
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		switch (type)
		{
			case StrikeType.Kick:
				animateKickOut(caster);
			case StrikeType.Spell:
				animateSpell(element, target);
			default:
		}
	}
	
	public function warn(text:String):Void 
	{
		warnField.text = text;
		warnField.visible = true;
		var timer = new Timer(3000);
		timer.run = function() {warnField.visible = false; timer.stop();}
	}
	
	//================================================================================
    // Animation supply
    //================================================================================
	
	private function animateBolt(target:UnitCoords, caster:UnitCoords, element:Element)
	{
		var animation:MovieClip = Assets.getBolt(element);
		add(animation, UNITX(caster), UNITY(caster) + 50);
		animation.play();
		
		var actuator:GenericActuator<MovieClip> = Actuate.tween(animation, 0.7, {x: UNITX(target), y: UNITY(target) + 50});
		actuator.ease(Quad.easeIn);
		actuator.onComplete(cleanAndRespond, [animation]);
	}
	
	private function animateKickIn(target:UnitCoords, caster:UnitCoords)
	{
		function kick() {
			Actuate.timer(0.6).onComplete(function(){phase = ThrowPhase.Resulting; });
		}
		
		var kickRange:Int = caster.team == Team.Left? -20 : 20;
		var actuator:GenericActuator<MovieClip> = Actuate.tween(unitsVision.get(caster), 0.5, {x: UNITX(target) + kickRange, y: UNITY(target)});
		actuator.ease(Cubic.easeOut);
		actuator.onComplete(kick);
	}	
	
	private function animateKickOut(caster:UnitCoords)
	{
		var actuator:GenericActuator<MovieClip> = Actuate.tween(unitsVision.get(caster), 0.5, {x: UNITX(caster), y: UNITY(caster)});
		actuator.ease(Cubic.easeOut);
		actuator.onComplete(function(){phase = ThrowPhase.None; });
	}
	
	private function animateSpell(element:Element, target:UnitCoords)
	{
		var animation:MovieClip = Assets.getSpellAnim(element);
		add(animation, unitsVision.get(target).x, unitsVision.get(target).y);
		playOnce(animation, function(){phase = ThrowPhase.None; });
	}
	
	//================================================================================
	
	private function playOnce(mc:MovieClip, ?onComplete:Null<Function>)
	{
		function handler(e:Event) {
			if (mc.currentFrame == mc.totalFrames)
			{
				mc.removeEventListener(Event.ENTER_FRAME, handler);
				remove(mc);
				if (onComplete != null)
					Reflect.callMethod(onComplete, onComplete, []);
			}
		}
		
		mc.addEventListener(Event.ENTER_FRAME, handler);
		mc.play();
	}
	
	private function cleanAndRespond(animation:MovieClip)
	{
		remove(animation);
		phase = ThrowPhase.Resulting;
	}
	
}