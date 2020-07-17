package;

import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import graphic.components.startmenu.StartMenu;
import graphic.components.mainmenu.MainMenuCoordinator;
import openfl.display.Sprite;
import graphic.components.bheditor.BHEditor;
import struct.Element;
import ID.AbilityID;
import motion.easing.Bounce;
import graphic.components.ProgressBar;
import graphic.Sounds;
import openfl.geom.Point;
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
import graphic.components.TextWindow;
import haxe.ui.Toolkit;
import openfl.events.MouseEvent;
import haxe.ui.core.Screen;
import io.AdvancedJSONReader;
import io.SaveLoad;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.DisplayObject;
import openfl.display.StageDisplayState;
import openfl.text.TextField;
import graphic.components.abilityscreen.SAbility;
import struct.Player;
import struct.Progress;
import struct.Zone;
import graphic.LayoutReader;

using graphic.Utils;
using engine.Listeners;
using engine.MathUtils;
using graphic.SpriteExtension;

interface Listener
{
	public function playerDataRecieved(player:Xml, progress:Xml):Void;
	public function battleDataRecieved(c:Array<UnitData>, p:Array<Ability>):Void;
	public function battleFinished():Void;
}

/**
 * @author Gulvan
 */
class Main extends Sprite //implements Listener
{
	#if local
	public static var ip(default, null):String = "localhost";
	#else
	public static var ip(default, null):String = "ec2-18-222-25-127.us-east-2.compute.amazonaws.com";
	#end

	public static var version:String = "alpha3.1";
	
	public static var screenW(default, null):Int = 1366;
	public static var screenH(default, null):Int = 768;
	public static var FPS(default, null):Int = 60;
	
	public static var login:Null<String>;
	public static var player:Null<Player>;
	public static var progress:Null<Progress>;
	public static var rating:Int;
	
	public static var listener(default, null):Listener;

	private var coordinator:MainMenuCoordinator;
	private var startMenu:StartMenu;
	
	public static function logout()
	{
		if (FileSystem.exists(exePath() + "logindata.d"))
			FileSystem.deleteFile(exePath() + "logindata.d");
		ConnectionManager.logOut();
		login = null;
		player = null;
		progress = null;
		/*deInitRoam();
		if (tryConnect())
			initLogin();*///TODO:Move to coordinator
	}

	//================================================================================
	
	private function init()
	{
		//listener = this;
		if (Capabilities.screenResolutionX == 1366 && Capabilities.screenResolutionY == 768)
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Listeners.init(stage);
		Toolkit.init();
	}

	private function onLogged()
	{
		removeChild(startMenu);
		addChild(coordinator);
	}

	private function start()
	{
		startMenu = new StartMenu();
		coordinator = new MainMenuCoordinator();
		addChild(startMenu);
		
		var launcher:Launcher = new Launcher();
		launcher.init(onLogged, startMenu.generateLoginForm.bind(onLogged), startMenu.generateCantConnect.bind(launcher.retry));
		launcher.launch();
	}
	
	public function new() 
	{
		super();
		init();
		//start();
		Tests.quickBar(stage);
	} 

	//================================================================================
	
	/*public function battleDataRecieved(c:Array<UnitData>, p:Array<Ability>)
	{
		deInitRoam();
		ConnectionManager.setCommon(initBattle(c, p));
	}
	
	public function playerDataRecieved(pl:Xml, prog:Xml)
	{
		if (displayMap.exists("login"))
			haxe.ui.core.Screen.instance.removeComponent(cast displayMap["login"]);
		player = SaveLoad.loadPlayer(login, pl);
		progress = SaveLoad.loadProgress(prog);
		rating = SaveLoad.loadRating(pl);
		
	}
	
	public function battleFinished()
	{
		removeChild(displayMap["battle"]);
		displayMap.remove("battle");
		ConnectionManager.updatePlayerAndReturn(initRoam);
	}*///TODO: Move

	//====================================================================================

	public static function exePath():String
	{
		var path:String = Sys.programPath();
		path = path.substring(0, path.lastIndexOf("\\"));
		path += "\\";
		return path;
	}
}
