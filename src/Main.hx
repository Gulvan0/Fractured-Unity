package;

import sys.io.FileOutput;
import openfl.net.URLLoaderDataFormat;
import openfl.events.Event;
import openfl.net.URLRequest;
import openfl.net.URLLoader;
import sys.io.File;
import sys.FileSystem;
import openfl.system.Capabilities;
import battle.Ability;
import battle.Common;
import battle.struct.UnitData;
import graphic.Fonts;
import graphic.components.CantConnect;
import graphic.components.LoginForm;
import graphic.components.TextWindow;
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
using Listeners;

interface Listener
{
	public function playerDataRecieved(player:Xml, progress:Xml):Void;
	public function battleDataRecieved(c:Array<UnitData>, p:Array<Ability>):Void;
	public function battleFinished():Void;
}

/**
 * @author Gulvan
 */
class Main extends SSprite implements Listener
{
	#if local
	public static var ip(default, null):String = "localhost";
	#else
	public static var ip(default, null):String = "ec2-18-224-7-170.us-east-2.compute.amazonaws.com";
	#end

	public static var version:String = "alpha2.3";
	
	public static var screenW(default, null):Int = 1366;
	public static var screenH(default, null):Int = 768;
	
	public static var login:Null<String>;
	public static var player:Null<Player>;
	public static var progress:Null<Progress>;
	
	public static var listener(default, null):Listener;
	
	private var displayMap:Map<String, DisplayObject>;
	
	private function exit(e)
	{
		Sys.exit(0);
	}
	
	private function dndFinding(e)
	{
		displayMap.get("dndBtn").removeEventListener(MouseEvent.CLICK, dndFinding);
		ConnectionManager.findMatch();
		displayMap["lfgwindow"] = new TextWindow("Looking for an enemy...");
		displayMap["lfgwindow"].centre();
		addChild(displayMap["lfgwindow"]);
	}
	
	private function initRoam()
	{
		if (ConnectionManager.state == ConnectionManager.ClientState.NotConnected)
			return;
		
		var reader:LayoutReader = new LayoutReader("screens/roaming.xml");
		var scr:LayoutReader.Screen = reader.generate(["portrait" => Assets.getPlayer(player.element)]);
		displayMap = scr.map;
		displayMap.get("exitBtn").addVocalListener(MouseEvent.CLICK, exit);
		displayMap.get("dndBtn").addVocalListener(MouseEvent.CLICK, dndFinding);
		cast(displayMap.get("upperBar/playerData/name"), TextField).text = login;
		cast(displayMap.get("upperBar/playerData/desc"), TextField).text = player.element.getName() + " Lvl. " + player.level;
		cast(displayMap.get("upperBar/playerData/xpbar/valueText"), TextField).text = player.xp.value + "/" + (player.xp.value + player.xpToLvlup());
		cast(displayMap.get("upperBar/progressData/zonetext"), TextField).text = progress.getZoneName();
		cast(displayMap.get("upperBar/progressData/stagetext"), TextField).text = "Stage " + progress.getStage();
		
		displayMap["roamScreen"] = scr.cont;
		addChild(displayMap["roamScreen"]);
	}
	
	private function initBattle(c:Array<UnitData>, p:Array<Ability>):Common
	{
		trace(2);
		var common:Common = new Common(Zone.NullSpace, c, p, login);
		trace(2);
		displayMap["battle"] = common;
		trace(2);
		addChild(displayMap["battle"]);
		common.init();
		trace(2);
		return common;
	}
	
	private function initLogin()
	{
		if (FileSystem.exists(Main.exePath() + "logindata.d"))
		{
			var a:Array<String> = File.getContent(Main.exePath() + "logindata.d").split("|");
			ConnectionManager.logIn(a[0], a[1]);
		}
		else
		{
			displayMap["login"] = new LoginForm();
			displayMap["login"].centre();
			Screen.instance.addComponent(cast displayMap["login"]);
		}
	}

	private function tryConnect():Bool
	{
		if (displayMap.exists("connectFail"))
		{
			removeChild(displayMap["connectFail"]);
			displayMap.remove("connectFail");
		}

		try
		{	
			ConnectionManager.init(ip, 5000);
		}
		catch (e:String)
		{
			if (e != "ConnectionFailed")
				throw e;
			
			displayMap["connectFail"] = new CantConnect(launch);
			displayMap["connectFail"].centre();
			addChild(displayMap["connectFail"]);
			return false;
		}

		return true;
	}

	private function checkVersion(onUpToDate:Void->Void)
	{
		ConnectionManager.getVersion(function (ver:String){
			if (Main.version == ver)
				onUpToDate();
			else
				updateClient();
		});
	}

	private function updateClient()
	{
		var loader:URLLoader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, function (e:Event)
		{
			var fo:FileOutput = File.write(exePath() + "inst.exe");
			fo.write(loader.data);
			fo.close();
			FileSystem.rename(Sys.programPath(), exePath() + "FracturedUnity-old.exe");
			Sys.command(exePath() + "inst.exe");
			Sys.exit(1);
		});
		loader.dataFormat = URLLoaderDataFormat.BINARY;
		loader.load(new URLRequest("https://github.com/Gulvan0/Server/blob/master/installer.exe?raw=true"));
	}

	private function launch()
	{
		var oldexe:String = exePath() + "FracturedUnity-old.exe";
		if (FileSystem.exists(oldexe))
			if (Sys.programPath() != oldexe)
				FileSystem.deleteFile(oldexe);
			else
				Sys.exit(0);
		if (FileSystem.exists(exePath() + "inst.exe"))
			FileSystem.deleteFile(exePath() + "inst.exe");
		if (tryConnect())
			checkVersion(initLogin);
	}
	
	//================================================================================
	
	public function new() 
	{
		super();
		listener = this;
		if (Capabilities.screenResolutionX == 1366 && Capabilities.screenResolutionY == 768)
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Toolkit.init();
		displayMap = new Map();
		
		#if skiplogin
		ConnectionManager.init(ip, 5000);
		ConnectionManager.debugLogIn();
		#else
		launch();
		#end
	} 

	//================================================================================
	
	public function battleDataRecieved(c:Array<UnitData>, p:Array<Ability>)
	{
		displayMap.get("exitBtn").removeEventListener(MouseEvent.CLICK, exit);
		trace(1);
		removeChild(displayMap["roamScreen"]);
		trace(1);
		removeChild(displayMap["lfgwindow"]);
		trace(1);
		displayMap = new Map();
		trace(1);
		ConnectionManager.setCommon(initBattle(c, p));
	}
	
	public function playerDataRecieved(pl:Xml, prog:Xml)
	{
		if (displayMap.exists("login"))
			Screen.instance.removeComponent(cast displayMap["login"]);
		player = SaveLoad.loadPlayer(login, pl);
		progress = SaveLoad.loadProgress(prog);
		initRoam();
	}
	
	public function battleFinished()
	{
		removeChild(displayMap["battle"]);
		displayMap.remove("battle");
		initRoam();
	}

	//====================================================================================

	public static function exePath():String
	{
		var path:String = Sys.programPath();
		path = path.substring(0, path.lastIndexOf("\\"));
		path += "\\";
		return path;
	}
}
