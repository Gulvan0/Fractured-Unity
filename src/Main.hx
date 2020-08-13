package;

import ConnectionManager.BattleData;
import battle.AbilityBar;
import battle.BuffRect;
import struct.PlayerData;
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
import io.AbilityParser;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.DisplayObject;
import openfl.display.StageDisplayState;
import openfl.text.TextField;
import graphic.components.abilityscreen.SAbility;
import struct.Progress;
import struct.Zone;
import graphic.LayoutReader;

using graphic.Utils;
using engine.Listeners;
using engine.MathUtils;
using graphic.SpriteExtension;

typedef ClassRecord = {element:String, wins:Int, losses:Int}

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
	public static var player:Null<PlayerData>;
	public static var record:Null<Array<ClassRecord>>;
	//public static var progress:Null<Progress>;

	private static var instance:Main;
	private var awaitingLogin:Bool;
	private var coordinator:MainMenuCoordinator;
	private var startMenu:Null<StartMenu>;
	private var battleCommon:Null<Common>;
	
	public static function logout()
	{
		if (FileSystem.exists(exePath() + "logindata.d"))
			FileSystem.deleteFile(exePath() + "logindata.d");
		ConnectionManager.logOut();
		login = null;
		player = null;
		record = null;
		instance.onLoggedOut();
	}
	
	private function init()
	{
		instance = this;
		if (Capabilities.screenResolutionX == 1366 && Capabilities.screenResolutionY == 768)
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Listeners.init(stage);
		Toolkit.init();
		AbilityParser.initMap();
		Assets.init();
	}

	private function initBattle(data:BattleData)
	{
		removeChild(coordinator);
		battleCommon = new Common(data.common, data.personal, login, battleFinished);
		addChild(battleCommon);
		battleCommon.init();
		ConnectionManager.setCommonAndRespond(battleCommon);
	}

	private function battleFinished()
	{
		removeChild(battleCommon);
		battleCommon = null;
		ConnectionManager.updateData(initMainScreen);
	}

	private function initMainScreen() 
	{
		coordinator.matchFoundCallback = initBattle;
		coordinator.initMain();
		addChild(coordinator);
	}

	private function onLoaded()
	{
		removeChild(startMenu);
		startMenu = null;
		initMainScreen();
	}

	private function onLoggedOut()
	{
		removeChild(coordinator);
		start();
	}

	private function start()
	{
		startMenu = new StartMenu();
		coordinator = new MainMenuCoordinator();
		addChild(startMenu);
		
		var launcher:Launcher = new Launcher();
		launcher.init(onLoaded, startMenu.generateLoginForm.bind(onLoaded), startMenu.generateCantConnect.bind(launcher.retry));
		launcher.launch();
	}
	
	public function new() 
	{
		super();
		init();
		start();
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
