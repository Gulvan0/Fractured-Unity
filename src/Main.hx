package;

import battle.EffectHandler;
import battle.Model;
import battle.Unit;
import battle.data.Units;
import battle.enums.AbilityType;
import battle.struct.UPair;
import battle.vision.AbilityBar;
import battle.vision.Common;
import battle.vision.UnitStateBar;
import battle.vision.UnitsAndBolts;
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
import roaming.screens.Canvas;
import roaming.screens.SAbility;
import sys.FileSystem;

/**
 * @author Gulvan
 */
class Main extends SSprite 
{
	
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
			wheel:[ID.LgLightningBolt, ID.LgVoltSnare],
			strength:1,
			flow:2,
			intellect:6
		}
		
		var allies:Array<Unit> = [new Unit(id, Team.Left, 0, params)];
		var enemies:Array<Unit> = createEnemyArray(progress.zone, progress.stage);
		
		var model:Model = new Model(allies, enemies);
		var common:Common = new Common(progress.zone, model);
		var unitsAndBolts:UnitsAndBolts = new UnitsAndBolts(allies, enemies, model);
		var bottomBar:AbilityBar = new AbilityBar(allies[0], model);
		var upperBar:UnitStateBar = new UnitStateBar(allies, enemies, model);
		
		var effectHandler:EffectHandler = new EffectHandler();
		effectHandler.init(model);
		
		model.addObserver(unitsAndBolts);
		model.addObserver(bottomBar);
		model.addObserver(upperBar);
		model.addObserver(effectHandler);
		
		add(common, 0, 0);
		add(unitsAndBolts, UnitsAndBolts.xPos, UnitsAndBolts.yPos);
		add(bottomBar, AbilityBar.xPos, AbilityBar.yPos);
		add(upperBar, UnitStateBar.xPos, UnitStateBar.yPos);
		
		var pair:UPair<Unit> = new UPair(allies, enemies);
		
		common.init();
		unitsAndBolts.init();
		bottomBar.init();
		upperBar.init(pair);
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
		
		try
		{
			Actuate.defaultEase = Linear.easeNone;
			
			player = new Player(Element.Lightning, "Gulvan");
			progress = new Progress(0, 2);
			
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
