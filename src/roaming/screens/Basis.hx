package roaming.screens;

import haxe.CallStack;
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
class Basis extends SSprite 
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
			if ((MathUtils.inRange(e.stageX, abScrBtnX, abScrBtnX + abilityScreenBtn.width))
				&& (MathUtils.inRange(e.stageY, abScrBtnY, abScrBtnY + abilityScreenBtn.height)))
					switchTo(new SAbility());
		}
	}
	
	private function onKeyPress(e:KeyboardEvent)
	{
		if (screen != null) 
			screen.onKeyPress(e);
	}
	
	private function switchTo(screen:IScreen)
	{
		if (this.screen == null)
		{
			this.screen = screen;
			addChild(cast this.screen);
			this.screen.draw();
		}
		else
			throw "Trying to switch to screen while other is active";
	}
	
	public function closeScreen()
	{
		if (this.screen != null)
		{
			this.screen.close();
			removeChild(cast this.screen);
		}
		else
			throw "Trying to close screen while none is open";
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
		add(abilityScreenBtn, abScrBtnX, abScrBtnY);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		stage.addEventListener(MouseEvent.CLICK, onClick);
	}
	
	public function new() 
	{
		super();
		instance = this;
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
	
	private static inline var abScrBtnX:Float = 68.45;
	
	private static inline var abScrBtnY:Float = -21;
	
}