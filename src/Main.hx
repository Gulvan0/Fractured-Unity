package;

import data.Assets;
import data.StageEnemies;
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
		
		var heroParams:ParamsUnit = new ParamsUnit();
		heroParams.name = "Hero";
		heroParams.hp = 100;
		heroParams.mana = 100;
		heroParams.wheel = ["ability_quick_strike", "ability_heal", "ability_dark_pact"];
		heroParams.strength = 0;
		heroParams.flow = 0;
		heroParams.intellect = 1;
		var hero:BattleUnit = new BattleUnit("unit_hero", Team.Left, 0, heroParams);
		
		BattleController.instance.init(0, 1, [hero]);
	}

}
