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
import roaming.Player;

/**
 * Main class
 * @author Gulvan
 */
class Main extends Sprite 
{
	
	public static var player:Player;
	public static var progress:Progress;
	
	public static function onBattleOver()
	{
		Controller.instance.destroy();
		
		//To be filled
	}
	
	private function init()
	{	
		Actuate.defaultEase = Linear.easeNone;
			
		player = new Player(Element.Lightning);
		progress = new Progress(0, 2);
		
		//Starting battle
		new Controller();
		addChild(Controller.instance);
		
		var id:ID = ID.PlayerZealon;
		var params:ParameterList = {
			name:player.name,
			hp:100,
			mana:100,
			wheel:[ID.LgShockTherapy, ID.LgHighVoltage, ID.LgCharge, ID.LgElectricalStorm],
			strength:2,
			flow:2,
			intellect:5
		}
		
		Controller.instance.init(progress.zone, progress.stage, [new Unit(id, Team.Left, 0, params)]);
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
