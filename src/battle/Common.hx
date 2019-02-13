package battle;
import battle.EffectHandler;
import battle.IObservableModel;
import battle.Model;
import battle.Unit;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import graphic.ProgressBar;
import haxe.CallStack;
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
import battle.enums.Source;
import Element;
import Assets;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.display.MovieClip;
import battle.enums.InputMode;
import MathUtils;
import battle.enums.Team;

using MathUtils;

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	public static var shiftKey:Bool;
	
	private var model:Model;
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	private var effectHandler:EffectHandler;
	
	private function keyUpHandler(e:KeyboardEvent)
	{
		if (e.keyCode == 16)
            shiftKey = false;
	}
	
	private function keyHandler(e:KeyboardEvent)
	{
		trace("key handled: " + e.keyCode);
		
		if (e.keyCode == 16)
			shiftKey = true;
		else if (e.keyCode.inRange(49, 57))
			if (model.getInputMode() != InputMode.None)
				model.choose(e.keyCode - 49);
	}
	
	private function clickHandler(e:MouseEvent)
	{
		trace("click handled: " + e.stageX + ", " + e.stageY);
	}
	
	//================================================================================
	
	private static var ABILITYBARH:Float = 80;
	private static var ABILITYBARX:Float = 0;
	private static var ABILITYBARY:Float = Main.screenH - ABILITYBARH;
	private static var STATEBARX:Float = 0;
	private static var STATEBARY:Float = 0;
	
	public function init(pair:UPair<Unit>) 
	{	
		model.addObserver(objects);
		model.addObserver(abilityBar);
		model.addObserver(stateBar);
		model.addObserver(effectHandler);
		
		add(bg, 0, 0);
		add(objects, 0, 0);
		add(abilityBar, ABILITYBARX, ABILITYBARY);
		add(stateBar, STATEBARX, STATEBARY);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		
		objects.init();
		abilityBar.init();
		stateBar.init(pair);
		effectHandler.init(model);
	}
	
	public function new(zone:Zone, allies:Array<Unit>, enemies:Array<Unit>, model:Model)
	{
		super();
		this.model = model;
		shiftKey = false;
		
		bg = Assets.getBattleBG(zone);
		objects = new UnitsAndBolts(allies, enemies, model);
		abilityBar = new AbilityBar(allies[0], model);
		stateBar = new UnitStateBar(allies, enemies, model);
		effectHandler = new EffectHandler();
	}
}