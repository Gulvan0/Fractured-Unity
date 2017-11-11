package roaming.screens;

import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import roaming.IScreen;
import roaming.Player;

/**
 * ...
 * @author Gulvan
 */
class Basis extends Sprite 
{

	public static var instance:Null<Basis>;
	
	private var screen:Null<IScreen>;
	
	private var background:MovieClip;
	private var nextBattle:MovieClip;
	private var abilityScreenBtn:MovieClip;
	
	private function onClick(e:MouseEvent)
	{
		if (screen != null)
			screen.onClick(e);
		else
		{
			if (MathUtils.inRange(e.stageX, 68.45, //To inline map!!!!
		}
	}
	
	private function onKeyPress(e:KeyboardEvent)
	{
		if (screen != null) 
			screen.onKeyPress(e);
	}
	
	//================================================================================
	// INIT + Constructor
	//================================================================================
	
	public function destroy()
	{
		instance = null;
	}
	
	public function init()
	{
		var zone:Int = Main.progress.zone;
		
		background = Assets.getRoamingBG(zone);
		nextBattle = new NextBattle();
		abilityScreenBtn = new AbilityScreenButton();
		
		add(background, bgX(zone), bgY(zone));
		add(nextBattle, arrowX(zone), arrowY(zone));
		add(abilityScreenBtn, 68.45, -21);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		stage.addEventListener(MouseEvent.CLICK, onClick);
		
		instance = this;
	}
	
	public function new() 
	{
		super();
	}
	
	//================================================================================
	// Inline map
	//================================================================================
	
	private static inline function bgX(zone:Int):Float
	{
		if (zone == 0)
			return -25.35;
		else
			return -1;
	}
	
	private static inline function bgY(zone:Int):Float
	{
		if (zone == 0)
			return -21.45;
		else
			return -1;
	}
	
	private static inline function arrowX(zone:Int):Float
	{
		if (zone == 0)
			return 436.35;
		else
			return -1;
	}
	
	private static inline function arrowY(zone:Int):Float
	{
		if (zone == 0)
			return 398.15;
		else
			return -1;
	}
	
	//================================================================================
	// Graphic core
	//================================================================================
	
	public function add(object:DisplayObject, x:Float, y:Float)
	{
		addChild(object);
		object.x = x;
		object.y = y;
	}
	
	public function remove(object:DisplayObject)
	{
		removeChild(object);
	}
	
}