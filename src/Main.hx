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
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.Lib;
import battle.enums.Team;
import roaming.Player;
import roaming.Tree;
import roaming.Unit.RoamUnitParameters;
import roaming.screens.Basis;
import roaming.screens.SAbility;
import sys.FileSystem;

/**
 * Main class
 * @author Gulvan
 */
class Main extends SSprite 
{
	
	public static var player:Player;
	public static var progress:Progress;
	
	public static function onBattleOver()
	{
		Controller.instance.destroy();
		
		try
		{
			//To be filled
		}
		catch (e:Dynamic)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
	}
	
	private function initRoam()
	{
		new Basis();
		addChild(Basis.instance);
		
		Basis.instance.init();
	}
	
	private function initBattle()
	{	
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
			Actuate.defaultEase = Linear.easeNone;
			
			player = new Player(Element.Lightning, "Gulvan");
			progress = new Progress(0, 2);
			
			initRoam();
		}
		catch (e:String)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
		catch (e:Dynamic)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
	}

}
