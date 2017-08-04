package;

import data.Assets;
import data.StageEnemies;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.Lib;
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
		BattleController.instance.init(0, 2, [new BattleUnit("unit_hero", "Hero", Team.Left, 0, 1, 1, 1, 100, 100, ["ability_quick_strike", "ability_heal", "ability_dark_pact"])]);
		throw 11;
	}

}
