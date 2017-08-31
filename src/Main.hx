package;

import data.Assets;
import data.StageEnemies;
import data.UnitParameters;
import js.Browser;
import motion.Actuate;
import motion.actuators.GenericActuator;
import motion.easing.Linear;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.Lib;
import dataobj.ParamsUnit;
import utils.Team;

/**
 * Main class
 * @author Gulvan
 */
class Main extends Sprite 
{
	
	public function new() 
	{
		super();
		Actuate.defaultEase = Linear.easeNone;
		
		new BattleController();
		addChild(BattleController.instance);
		
		var id:String = "unit_zealon";
		var hero:BattleUnit = new BattleUnit(id, Team.Left, 0, UnitParameters.getParametersByID(id));
		
		BattleController.instance.init(0, 2, [hero]);
	}

}
