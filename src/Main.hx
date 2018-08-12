package;

import battle.Model;
import battle.Unit;
import battle.enums.Team;
import battle.struct.UPair;
import battle.vision.Common;
import graphic.Fonts;
import haxe.CallStack;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.StageDisplayState;
import roaming.Player;
import roaming.screens.Canvas;

/**
 * @author Gulvan
 */
class Main extends SSprite 
{
	public static var screenW:Int = 1366;
	public static var screenH:Int = 768;
	
	public static var player:Player;
	public static var progress:Progress;
	
	private function initRoam()
	{
		var canvas:Canvas = new Canvas();
		addChild(canvas);
		canvas.init(Screen.Roaming);
	}
	
	private function initBattle()
	{	
		var id:ID = ID.PlayerZealon;
		var params:ParameterList = {
			name:player.name,
			hp:100,
			mana:100,
			wheel:[ID.LgLightningBolt, ID.LgEnergize, ID.LgStrikeback, ID.LgDisrupt, ID.LgThunderbirdSoul, ID.LgEMPBlast, ID.LgArcFlash, ID.LgElectricalStorm],
			strength:1,
			flow:1,
			intellect:6
		}
		
		var allies:Array<Unit> = [new Unit(id, Team.Left, 0, params)];
		var enemies:Array<Unit> = createEnemyArray(progress.currentZone, progress.progress[progress.currentZone]);
		
		var model:Model = new Model(allies, enemies);
		var common:Common = new Common(progress.currentZone, allies, enemies, model);
		
		add(common, 0, 0);
		common.init(new UPair(allies, enemies));
		model.init();
	}
	
	public function initTreeHelper()
	{
		
	}
	
	public static function onBattleOver()
	{
		//To be filled
	}
	
	//================================================================================
	
	public function new() 
	{
		super();
		
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		
		player = new Player(Element.Lightning, "Gulvan");
		progress = new Progress([Zone.NullSpace => 3], Zone.NullSpace);
		
		try
		{
			initBattle();
		}
		catch (e:Dynamic)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
	}
	
	//================================================================================
	
	private function createEnemyArray(zone:Int, stage:Int):Array<Unit>
	{
		var enemyIDs:Array<ID> = XMLUtils.parseStage(zone, stage);
		var enemies:Array<Unit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(new Unit(enemyIDs[i], Team.Right, i));
			
		return enemies;
	}

}
