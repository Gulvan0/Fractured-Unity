package;

import flash.display.Sprite;
import graphic.Fonts;
import graphic.components.CantConnect;
import graphic.components.LoginForm;
import haxe.macro.Expr.Error;
import haxe.ui.Toolkit;
import haxe.ui.core.MouseEvent;
import haxe.ui.core.Screen;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.DisplayObject;
import openfl.display.StageDisplayState;
import openfl.text.TextField;

using graphic.Utils;

interface Listener
{
	public function playerDataRecieved(player:Xml, progress:Xml):Void;
	public function battleFinished():Void;
}

/**
 * @author Gulvan
 */
class Main extends SSprite implements Listener
{
	public static var ip(default, null):String = "ec2-18-224-7-170.us-east-2.compute.amazonaws.com";
	
	public static var screenW(default, null):Int = 1366;
	public static var screenH(default, null):Int = 768;
	
	public static var player:Null<Player>;
	public static var progress:Null<Progress>;
	
	public static var listener(default, null):Listener;
	
	private var container:Sprite;
	private var displayMap:Map<String, DisplayObject>;
	
	private function exit(e)
	{
		Sys.exit(0);
	}
	
	private function initRoam()
	{
		if (ConnectionManager.state == ConnectionManager.ClientState.NotConnected)
			return;
		
		var scr:LayoutReader.Screen = new LayoutReader("screens/roaming.xml").generate(["portrait" => Assets.getPlayer(player.element)]);
		scr.map.get("exitBtn").addEventListener(MouseEvent.CLICK, exit, false, 0, true);
		cast(scr.map.get("upperBar/playerData/name"), TextField).text = player.name;
		cast(scr.map.get("upperBar/playerData/desc"), TextField).text = player.element.getName() + " Lvl. " + player.level;
		cast(scr.map.get("upperBar/playerData/xpbar/valueText"), TextField).text = player.xp + "/" + player.xpToLvlup();
		cast(scr.map.get("upperBar/progressData/zonetext"), TextField).text = progress.getZoneName();
		cast(scr.map.get("upperBar/progressData/stagetext"), TextField).text = "Stage " + progress.getStage();
		
		addChild(scr.cont);
	}
	
	private function initBattle()
	{	
		//var common:Common = new Common(progress.currentZone, allies, enemies, model);
		//
		//container = common;
		//add(container, 0, 0);
		//common.init(new UPair(allies, enemies));
	}
	
	private function initLogin()
	{
		if (displayMap.exists("connectFail"))
		{
			removeChild(displayMap["connectFail"]);
			displayMap.remove("connectFail");
		}
		
		try
		{	
			ConnectionManager.init("localhost", 5000);
			displayMap["login"] = new LoginForm();
			displayMap["login"].centre();
			Screen.instance.addComponent(cast displayMap["login"]);
		}
		catch (e:String)
		{
			if (e != "ConnectionFailed")
				throw e;
			
			displayMap["connectFail"] = new CantConnect(initLogin);
			displayMap["connectFail"].centre();
			addChild(displayMap["connectFail"]);
		}
	}
	
	//================================================================================
	
	public function playerDataRecieved(pl:Xml, prog:Xml)
	{
		Screen.instance.removeComponent(cast displayMap["login"]);
		player = SaveLoad.loadPlayer(pl);
		progress = SaveLoad.loadProgress(prog);
		initRoam();
	}
	
	public function battleFinished()
	{
		//removeChild(container);
		//initRoam();
	}
	
	//================================================================================
	
	public function new() 
	{
		super();
		listener = this;
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Toolkit.init();
		displayMap = new Map();
		try
		{
			initLogin();
		}
		catch (e:Error)
		{
			trace(e.message);
			trace(e.pos);
			Sys.exit(1);
		}
		catch (e:Dynamic)
		{
			trace(e);
			Sys.exit(1);
		}
	} 
}
