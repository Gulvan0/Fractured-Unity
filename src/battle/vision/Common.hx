package battle.vision;
import battle.IObservableModel;
import battle.Model;
import battle.Unit;
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
	
	private var model:IObservableModel;
	
	private var bg:DisplayObject;
	
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
			shiftKey = true;
		else if (e.keyCode.inRange(49, 57))
			if (shiftKey)
				model.printAbilityInfo(e.keyCode - 49);
			else if (model.getInputMode() != InputMode.None)
				model.choose(e.keyCode - 49);
	}
	
	private function clickHandler(e:MouseEvent)
	{
		trace("click handled: " + e.stageX + ", " + e.stageY);
	}
	
	//================================================================================
	
	public function init() 
	{
		add(bg, 0, 0);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
	}
	
	public function new(zone:Int, model:IObservableModel)
	{
		super();
		
		shiftKey = false;
		this.model = model;
		bg = Assets.getBattleBG(zone);
	}
}