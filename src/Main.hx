package;

import battle.Controller;
import battle.Unit;
import Assets;
import battle.data.Stages;
import battle.data.Units;
import haxe.CallStack;
import haxe.io.Error;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Linear;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.Lib;
import battle.enums.Team;

/**
 * Main class
 * @author Gulvan
 */
class Main extends Sprite 
{
	
	private function init()
	{
		Sys.exit(1);
		
		/*Actuate.defaultEase = Linear.easeNone;
			
		new battle.Controller();
		addChild(battle.Controller.instance);
		
		var id:String = "unit_zealon";
		var hero:battle.Unit = new battle.Unit(id, battle.enums.Team.Left, 0, Units.getParametersByID(id));
		
		battle.Controller.instance.init(0, 2, [hero]);*/
	}
	
	public function new() 
	{
		super();
		
		try
		{
			init();
		}
		catch (e:Dynamic)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
	}

}
