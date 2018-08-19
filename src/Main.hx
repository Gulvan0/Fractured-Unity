package;

import battle.Model;
import battle.Unit;
import battle.enums.Team;
import battle.struct.UPair;
import battle.vision.Common;
import flash.display.Sprite;
import graphic.Fonts;
import haxe.CallStack;
import haxe.crypto.Md5;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.StageDisplayState;
import roaming.Player;
import roaming.screens.Canvas;
import sys.FileSystem;
import sys.io.File;

/**
 * @author Gulvan
 */
class Main extends SSprite 
{
	public static var screenW:Int = 1366;
	public static var screenH:Int = 768;
	
	public static var player:Player;
	public static var progress:Progress;
	
	public static var instance(default, null):Main;
	
	private var container:Sprite;
	
	private function initRoam()
	{
		var canvas:Canvas = new Canvas();
		container = canvas;
		addChild(container);
		canvas.init(Screen.Roaming);
	}
	
	private function initBattle()
	{	
		var id:ID = ID.Player;
		var params:ParameterList = {
			name:player.name,
			hp:100,
			mana:100,
			wheel:[ID.LgLightningBolt, ID.LgEnergize, ID.LgStrikeback, ID.LgDisrupt, ID.LgThunderbirdSoul, ID.LgEMPBlast, ID.LgArcFlash, ID.LgElectricalStorm],
			strength:1,
			flow:1,
			intellect:6
		}
		
		var allies:Array<Unit> = [new Unit(id, Element.Lightning, Team.Left, 0, params)];
		var enemies:Array<Unit> = createEnemyArray(progress.currentZone, progress.progress[progress.currentZone].value);
		
		var model:Model = new Model(allies, enemies);
		var common:Common = new Common(progress.currentZone, allies, enemies, model);
		
		container = common;
		add(container, 0, 0);
		common.init(new UPair(allies, enemies));
		model.init();
	}
	
	public function battleFinished()
	{
		removeChild(container);
		initRoam();
	}
	
	//==========================================================================================
	
	public static function save()
	{
		var manager:SaveLoad = new SaveLoad();
		manager.save(progress, player, "savefile.xml");
		manager.close();
	}
	
	private static function load():Bool
	{
		try
		{
			var manager:SaveLoad = new SaveLoad();
			manager.open("savefile.xml");
			progress = manager.loadProgress();
			player = manager.loadPlayer();
			manager.close();
		}
		catch (e:String)
		{
			if (e == SaveLoad.CORRUPTION_ERROR)
				return false;
			else
				throw e;
		}
		return true;
	}
	
	private static function create()
	{
		progress = new Progress([Zone.NullSpace => 1], Zone.NullSpace);
		player = new Player(Element.Lightning, "Zealon");
	}
	
	//================================================================================
	
	public function new() 
	{
		super();
		
		instance = this;
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		
		try
		{
			if (load())
				initRoam();
		}
		catch (e:Dynamic)
		{
			trace(e);
			trace(CallStack.toString(CallStack.exceptionStack()));
			Sys.exit(1);
		}
	}
	
	//================================================================================
	
	private function createEnemyArray(zone:Zone, stage:Int):Array<Unit>
	{
		var enemyIDs:Array<ID> = XMLUtils.parseStage(zone, stage);
		var enemies:Array<Unit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(new Unit(enemyIDs[i],null,Team.Right, i));
			
		return enemies;
	}

}
