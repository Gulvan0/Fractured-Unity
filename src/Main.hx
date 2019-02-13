package;

import flash.display.Sprite;
import graphic.Fonts;
import graphic.components.CantConnect;
import graphic.components.LoginForm;
import haxe.ui.Toolkit;
import haxe.ui.core.Screen;
import motion.Actuate;
import motion.easing.Linear;
import openfl.Lib;
import openfl.display.StageDisplayState;

using graphic.Utils;

/**
 * @author Gulvan
 */
class Main extends SSprite 
{
	public static var ip:String = "ec2-18-224-7-170.us-east-2.compute.amazonaws.com";
	
	public static var screenW:Int = 1366;
	public static var screenH:Int = 768;
	
	public static var player:Null<Player>;
	public static var progress:Null<Progress>;
	
	private var container:Sprite;
	private var displayMap:Map<String, Sprite>;
	
	private function initRoam()
	{
		addChild(new LayoutReader("screens/roaming.xml").generate(["portrait" => new Zealon()]).cont);
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
	
	public function battleFinished()
	{
		//removeChild(container);
		//initRoam();
	}
	
	//================================================================================
	
	public function new() 
	{
		super();
		Lib.current.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		Actuate.defaultEase = Linear.easeNone;
		Fonts.init();
		Toolkit.init();
		displayMap = new Map();
		try
		{
			initRoam();
		}
		catch (e:Dynamic)
		{
			trace(e);
		}
	} 
}
