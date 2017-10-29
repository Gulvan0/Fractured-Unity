package;

import battle.Controller;
import battle.Unit;
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
		Actuate.defaultEase = Linear.easeNone;
			
		
		
		new Controller();
		addChild(Controller.instance);
		
		var id:ID = ID.PlayerZealon;
		var params:ParameterList = {
			name:"Zealon",
			hp:100,
			mana:100,
			wheel:[ID.LgShockTherapy, ID.LgHighVoltage, ID.LgCharge, ID.LgElectricalStorm],
			strength:2,
			flow:2,
			intellect:5
		}
		
		Controller.instance.init(0, 2, [new Unit(id, Team.Left, 0, params)]);
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
