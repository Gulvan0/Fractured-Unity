package;

import sys.thread.Thread;
import openfl.display.Bitmap;
import haxe.Timer;
import openfl.filters.GlowFilter;
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
	#if lan
	public static var ip(default, null):String = "192.168.0.32";
	#elseif local
	public static var ip(default, null):String = "localhost";
	#else
	public static var ip(default, null):String = "ec2-18-222-25-127.us-east-2.compute.amazonaws.com";
	#end

	#if (local || lan)
	public static var port(default, null):Int = 92;
	#else
	public static var port(default, null):Int = 5000;
	#end

	public static var version:String = "alpha3.5";
	
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

	private var background:Sprite = new Sprite();
	
	public static function logout(?connectionLost:Bool = false)
	{
		if (FileSystem.exists(exePath() + "logindata.d"))
			FileSystem.deleteFile(exePath() + "logindata.d");
		ConnectionManager.logOut();
		login = null;
		player = null;
		record = null;
		instance.onLoggedOut();
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
		removeChild(startMenu);
		removeChild(coordinator);

		startMenu = new StartMenu();
		coordinator = new MainMenuCoordinator();

		var launcher:Launcher = new Launcher();
		launcher.init(onLoaded, startMenu.generateLoginForm.bind(onLoaded), startMenu.generateCantConnect.bind(launcher.retry));

		startMenu.generateCantConnect(launcher.retry, true);
		addChild(startMenu);
	}

	private function launch()
	{
		startMenu = new StartMenu();
		coordinator = new MainMenuCoordinator();
		addChild(startMenu);
		
		var launcher:Launcher = new Launcher();
		launcher.init(onLoaded, startMenu.generateLoginForm.bind(onLoaded), startMenu.generateCantConnect.bind(launcher.retry));
		launcher.launch();
	}

	public static function setBG(bg:Bitmap) 
    {
        var bgscale = Math.max(screenW / bg.width, screenH / bg.height);
        bg.scaleX = bg.scaleY = bgscale;
		instance.background.removeChildren();
        instance.background.addChild(bg);
	}
	
	private function initGame()
	{
		if (Capabilities.screenResolutionX == 1366 && Capabilities.screenResolutionY == 768)
			Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Controls.init();
		Listeners.init(stage);
		Toolkit.init();
		AbilityParser.initMap();
		Assets.init();
	}
	
	public function new() 
	{
		super();
		instance = this;
		addChild(background);
		setBG(Assets.loadingBG());
		Timer.delay(launch, 500);
		Thread.create(initGame);
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
