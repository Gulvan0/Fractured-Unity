package battle;
import graphic.Sounds;
import openfl.display.Sprite;
import graphic.Utils;
import battle.Buff;
import battle.Common.TargetResult;
import battle.enums.InputMode;
import battle.enums.AbilityType;
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
import struct.Element;
import engine.Color;

using engine.MathUtils;
using engine.Listeners;
using graphic.SpriteExtension;

/**
 * Vision of units and ability animations
 * @author Gulvan
 */
class UnitsAndBolts extends Sprite 
{
	private var common:Common;
	
	private var warnField:TextField;
	private var unitsVision:UPair<MovieClip>;
	private var alacrityBars:UPair<ProgressBar>;
	private var selectedUnit:Array<MovieClip>;
	
	private var throwAnim:Null<(Void->Void)->Void>;
	private var textAnim:Array<Void->Void>;
	
	
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
		var a:Float = (coords.pos == 0)? 325 : 133;
		return (coords.team == Team.Left)? a : Main.screenW - a - UNITW;
	}
	
	private inline function UNITY(coords:UnitCoords):Float
	{
		if (coords.pos == 0)
			return 367;
		else if (coords.pos == 1)
			return 540;
		else if (coords.pos == 2)
			return 194;
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
		alacrityBars = units.map(u -> new ProgressBar(ALACBARW, 5, 0x15B082, 0.5, 0, null, null, u.alacrity.maxValue));
		selectedUnit = [];
		textAnim = [];
		
		var format:TextFormat = new TextFormat();
		format.size = 18;
		format.bold = true;
		format.color = 0xD50010;
		format.align = TextFormatAlign.CENTER;
		warnField = new TextField();
		warnField.width = WARNW;
		warnField.visible = false;
		warnField.selectable = false;
		warnField.setTextFormat(format);
	}
	
	public function init() 
	{
		for (u in unitsVision)
		{
			var coords:UnitCoords = unitsVision.find(u);
			this.add(u, UNITX(coords), UNITY(coords));
			this.add(alacrityBars.get(coords), ALACBARX(coords), ALACBARY(coords));
		}
		this.add(warnField, WARNX, WARNY);
			
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
	}
	
	public function deInit()
	{
		stage.removeEventListener(MouseEvent.CLICK, clickHandler);
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
	}
	
	private function animateTF(target:UnitCoords, element:Element, text:String, ?heal:Bool = false)
	{
		var container:Sprite = new Sprite();
		var coords:UnitCoords = target;
		var tf:TextField = new TextField();
		var format:TextFormat = new TextFormat();
		format.color = heal? Color.HEAL : Color.elemental(element);
		format.size = 55;
		format.letterSpacing = 4;
		format.align = TextFormatAlign.CENTER;
		format.font = Fonts.DAMAGE;
		tf.text = text;
		tf.width = ALACBARW;
		tf.setTextFormat(format);
		container.addChild(tf);
		//container.filters = [new DropShadowFilter(Utils.darken(format.color))];
		
		this.add(container, ALACBARX(coords), UNITY(coords) + unitsVision.get(coords).height * 0.15);
		Actuate.tween(container, 1.5, {y: UNITY(coords) + unitsVision.get(coords).height, alpha: 0});
		if (heal)
			Sounds.HEAL.play();
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
					Sounds.CLICK.play();
					unglowSelected();
					common.target(unitsVision.find(unit));
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
		if (source == Source.Ability)
			textAnim.push(animateTF.bind(target, element, Math.abs(dhp) + (crit? "!" : ""), dhp > 0));
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
		if (throwAnim != null) 
		{
			throwAnim(function(){
				animateTF(target, element, "MISS");
				for (a in textAnim) a();
				throwAnim = null;
				textAnim = [];
			});
		}
	}
	
	public function death(unit:UnitCoords):Void 
	{
		removeChild(unitsVision.get(unit));
		removeChild(alacrityBars.get(unit));
	}
	
	public function abSelected(num:Int):Void 
	{
		findAndGlow();
	}
	
	public function abDeselected(num:Int):Void 
	{
		unglowSelected();
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID.AbilityID, type:AbilityType, element:Element):Void 
	{
		throwAnim = switch (type)
		{
			case AbilityType.Bolt: animateBolt.bind(target, caster, element);
			case AbilityType.Kick: animateKickIn.bind(target, caster);
			default: null;
		}
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID.AbilityID, type:AbilityType, element:Element):Void 
	{
		if (type == AbilityType.Bolt)
			Sounds.THROW.play();
		if (throwAnim != null)
			throwAnim(continueAnim.bind(target, caster, id, type, element));
		else
			continueAnim(target, caster, id, type, element);
	}

	private function continueAnim(target:UnitCoords, caster:UnitCoords, id:ID.AbilityID, type:AbilityType, element:Element) 
	{
		for (a in textAnim) a();

		if (type == AbilityType.Kick)
			animateKickOut(caster);
		else if (type == AbilityType.Spell)
			animateSpell(element, target);

		textAnim = [];
		throwAnim = null;
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
	
	private function animateBolt(target:UnitCoords, caster:UnitCoords, element:Element, onOver:Void->Void)
	{
		var animation:MovieClip = Assets.getBolt(element);
		this.add(animation, UNITX(caster), UNITY(caster) + 50);
		animation.play();
		
		var actuator:GenericActuator<MovieClip> = Actuate.tween(animation, 0.7, {x: UNITX(target), y: UNITY(target) + 50});
		actuator.ease(Quad.easeIn);
		actuator.onComplete(function ()
		{
			Sounds.STRIKE[element].play();
			removeChild(animation); 
			onOver();
		});
	}
	
	private function animateKickIn(target:UnitCoords, caster:UnitCoords, onOver:Void->Void)
	{
		function kick() {
			Actuate.timer(0.6).onComplete(onOver);
			Sounds.KICK.play();
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
	}
	
	private function animateSpell(element:Element, target:UnitCoords)
	{
		var animation:MovieClip = Assets.getSpellAnim(element);
		this.add(animation, unitsVision.get(target).x, unitsVision.get(target).y);
		var t:Timer = new Timer(100/6);
		t.run = function () 
		{
			if (animation.currentFrame == animation.totalFrames)
			{
				t.stop();
				removeChild(animation);
			}
			animation.nextFrame();
		}
		Sounds.SPELL[element].play();
	}
	
}