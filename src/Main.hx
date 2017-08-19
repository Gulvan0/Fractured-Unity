package;

import data.Assets;
import data.StageEnemies;
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
		
		var heroParams:ParamsUnit = new ParamsUnit();
		heroParams.name = "Hero";
		heroParams.hp = 100;
		heroParams.mana = 100;
		heroParams.wheel = ["ability_quick_strike", "ability_heal", "ability_dark_pact"];
		heroParams.strength = 1;
		heroParams.flow = 1;
		heroParams.intellect = 1;
		var hero:BattleUnit = new BattleUnit("unit_hero", Team.Left, 0, heroParams);
		
		BattleController.instance.init(0, 2, [hero]);
		throw 11;
	}

}
