package;

import data.Assets;
import data.StageEnemies;
import data.UnitParameters;
import js.Browser;
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
		new BattleController();
		addChild(BattleController.instance);
		
		var paramsID:String = "unit_zealon";
		var hero:BattleUnit = new BattleUnit("unit_hero", Team.Left, 0, UnitParameters.getParametersByID(paramsID));
		
		BattleController.instance.init(0, 1, [hero]);
	}

}
