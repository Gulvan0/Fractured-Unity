package battle.vision;
import battle.IObservableModel;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.InputMode;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.enums.Source;
import graphic.Fonts;
import haxe.Constraints.Function;
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

import battle.IModelObserver;
import battle.Unit;
using MathUtils;

/**
 * Vision of units and ability animations
 * @author Gulvan
 */
class UnitsAndBolts extends SSprite implements IModelObserver 
{
	
	private var model:IObservableModel;
	
	private var unitsVision:UPair<MovieClip>;
	private var selectedUnit:Array<MovieClip>;
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>, model:IObservableModel) 
	{
		super();
		
		this.model = model;
		
		var alliesVision:Array<MovieClip> = [for (a in allies) Assets.getUnit(a.id)];
		var enemiesVision:Array<MovieClip> = [for (e in enemies) Assets.getUnit(e.id)];
		unitsVision = new UPair(alliesVision, enemiesVision);
		selectedUnit = [];
	}
	
	public function init() 
	{
		for (u in unitsVision)
		{
			var coords:UnitCoords = unitsVision.find(u);
			add(u, UNITX(coords), UNITY(coords));
		}
			
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
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
		
		add(tf, UNITX(coords) - 90, UNITY(coords) + unitsVision.get(coords).height * 0.25);
		Actuate.tween(tf, 1, {y: UNITY(coords) + unitsVision.get(coords).height, alpha: 0});
	}
	
	//-------------------------------------------------------------------------------------------
	
	private static var UNITW:Float = 54.5;
	
	private inline function UNITX(coords:UnitCoords):Float
	{
		var a:Float = (coords.pos == 0)? 415 : 250;
		return (coords.team == Team.Left)? a : 1366 - a - UNITW;
	}
	
	private inline function UNITY(coords:UnitCoords):Float
	{
		if (coords.pos == 0)
			return 416;
		else if (coords.pos == 1)
			return 516;
		else if (coords.pos == 2)
			return 307;
		else
			return -1;
	}
	
	//------------------------------------------------------------------------------------------
	
	private function clickHandler(e:MouseEvent)
	{
		var clickPoint:Point = new Point(e.stageX, e.stageY);
		
		for (unit in unitsVision)
			if (clickPoint.inside(unit.getRect(this)))
			{
				if (model.getInputMode() == InputMode.Targeting)
				{
					unglowSelected();
					model.targetAndUse(unitsVision.find(unit));
				}
				return;
			}
	}
	
	private function moveHandler(e:MouseEvent)
	{
		if (model.getInputMode() == InputMode.Targeting)
			if (!findAndGlow())
				unglowSelected();
	}
	
	private function findAndGlow():Bool
	{
		var array = (stage.mouseX > 450)? unitsVision.right : unitsVision.left;
			
		for (unit in array)
			if ((new Point(stage.mouseX, stage.mouseY)).inside(unit.getRect(this)))
			{
				if (!Lambda.empty(selectedUnit) && selectedUnit[0] != unit)
					unglowSelected();
				var color:Int = model.targetAvaibility(unitsVision.find(unit))? 0x00C431 : 0xEC1C11;
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
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, caster:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		animateTF(UnitCoords.get(target), element, Math.abs(dhp) + (crit? "!" : ""), dhp > 0);
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		//no action
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		//Redrawing alacrity bar
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		//no action
	}
	
	public function preTick(current:Unit):Void
	{
		//no action
	}
	
	public function tick(current:Unit):Void 
	{
		//no action
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		animateTF(target, element, "MISS");
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
		//no action
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		switch (type)
		{
			case StrikeType.Bolt:
				animateBolt(target, caster, element);
			case StrikeType.Kick:
				animateKickIn(target, caster);
			default:
				model.respond();
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
				model.respond();
		}
	}
	
	public function warn(text:String):Void 
	{
		//replace with visual error printing
		#if js
		js.Browser.alert(text);
		#elseif neko
		trace("WARN//" + text);
		#end
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
			Actuate.timer(0.6).onComplete(model.respond);
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
		actuator.onComplete(model.respond);
	}
	
	private function animateSpell(element:Element, target:UnitCoords)
	{
		var animation:MovieClip = Assets.getSpellAnim(element);
		add(animation, unitsVision.get(target).x, unitsVision.get(target).y);
		playOnce(animation, model.respond);
	}
	
	//================================================================================
	
	private function playOnce(mc:MovieClip, onComplete:Function)
	{
		function handler(e:Event) {
			if (mc.currentFrame == mc.totalFrames)
			{
				mc.removeEventListener(Event.ENTER_FRAME, handler);
				remove(mc);
				Reflect.callMethod(onComplete, onComplete, []);
			}
		}
		
		mc.addEventListener(Event.ENTER_FRAME, handler);
		mc.play();
	}
	
	private function cleanAndRespond(animation:MovieClip)
	{
		remove(animation);
		model.respond();
	}
	
}