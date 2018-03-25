package battle.vision;
import battle.IObservableModel;
import battle.Model.AbilityInfo;
import battle.Model.UnitInfo;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.InputMode;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.enums.Source;
import haxe.Constraints.Function;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Cubic;
import motion.easing.Quad;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;

import battle.IModelObserver;
import battle.Unit;

/**
 * Vision of units and ability animations
 * @author Gulvan
 */
class UnitsAndBolts extends SSprite implements IModelObserver 
{
	
	public static var xPos:Float = 0;
	public static var yPos:Float = 0;
	
	private var model:IObservableModel;
	
	private var unitsVision:UPair<MovieClip>;
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>, model:IObservableModel) 
	{
		super();
		
		this.model = model;
		
		var alliesVision:Array<MovieClip> = [for (a in allies) Assets.getBattleUnit(a.id)];
		var enemiesVision:Array<MovieClip> = [for (e in enemies) Assets.getBattleUnit(e.id)];
		unitsVision = new UPair(alliesVision, enemiesVision);
	}
	
	public function init() 
	{
		for (u in unitsVision)
		{
			var coords:UnitCoords = unitsVision.find(u);
			add(u, unitX(coords), unitY(coords));
		}
			
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
	}
	
	private inline function unitX(coords:UnitCoords):Float
	{
		if (coords.pos == 0)
			return (coords.team == Team.Left)? 235 : 600;
		else if (coords.pos == 1 || coords.pos == 2)
			return (coords.team == Team.Left)? 100 : 735;
		else
			return -1;
	}
	
	private inline function unitY(coords:UnitCoords):Float
	{
		if (coords.pos == 0)
			return 215;
		else if (coords.pos == 1)
			return 355;
		else if (coords.pos == 2)
			return 105;
		else
			return -1;
	}
	
	private function clickHandler(e:MouseEvent)
	{
		var clickPoint:Point = new Point(e.stageX, e.stageY);
		
		for (unit in unitsVision)
			if (MathUtils.contains(clickPoint, unit.getRect(this)))
			{
				if (Common.shiftKey)
					model.printUnitInfo(unitsVision.find(unit));
				else if (model.getInputMode() == InputMode.Targeting)
					model.targetAndUse(unitsVision.find(unit));
				return;
			}
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		//Delta over unit
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
	
	public function tick(current:Unit):Void 
	{
		//no action
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		//Miss over unit
	}
	
	public function death(unit:UnitCoords):Void 
	{
		remove(unitsVision.get(unit));
	}
	
	public function abSelected(num:Int):Void 
	{
		//no action
	}
	
	public function abDeselected(num:Int):Void 
	{
		//no action
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, type:AbilityType, element:Element):Void 
	{
		switch (type)
		{
			case AbilityType.Bolt:
				animateBolt(target, caster, element);
			case AbilityType.Kick:
				animateKickIn(target, caster);
			default:
				model.respond();
		}
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:AbilityType):Void 
	{
		switch (type)
		{
			case AbilityType.Kick:
				animateKickOut(caster);
			case AbilityType.Spell:
				animateSpell(id, target);
			default:
				model.respond();
		}
	}
	
	public function abInfoPrint(info:AbilityInfo):Void 
	{
		//no action
	}
	
	public function unitInfoPrint(info:UnitInfo):Void 
	{
		var buffString:String = "";
		for (buff in info.buffQueue.queue)
		{
			if (buffString != "")
				buffString += ";\n";
			buffString += buff.name + "(" + buff.duration + ")" + ", Element: " + buff.element + "\n" + buff.description;
		}
		
		var result:String = info.name + "\n\nBuffs: \n" + buffString;
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
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
		add(animation, unitX(caster), unitY(caster) + 50);
		animation.play();
		
		var actuator:GenericActuator<MovieClip> = Actuate.tween(animation, 0.7, {x: unitX(target), y: unitY(target) + 50});
		actuator.ease(Quad.easeIn);
		actuator.onComplete(cleanAndRespond, [animation]);
	}
	
	private function animateKickIn(target:UnitCoords, caster:UnitCoords)
	{
		function kick() {
			Actuate.timer(0.6).onComplete(model.respond);
		}
		
		var kickRange:Int = caster.team == Team.Left? -20 : 20;
		var actuator:GenericActuator<MovieClip> = Actuate.tween(unitsVision.get(caster), 0.5, {x: unitX(target) + kickRange, y: unitY(target)});
		actuator.ease(Cubic.easeOut);
		actuator.onComplete(kick);
	}
	
	private function animateKickOut(caster:UnitCoords)
	{
		var actuator:GenericActuator<MovieClip> = Actuate.tween(unitsVision.get(caster), 0.5, {x: unitX(caster), y: unitY(caster)});
		actuator.ease(Cubic.easeOut);
		actuator.onComplete(model.respond);
	}
	
	private function animateSpell(abilityID:ID, target:UnitCoords)
	{
		var animation:MovieClip = Assets.getSpellAnim(abilityID);
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