package roaming.screens;

import haxe.CallStack;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import roaming.Player;

enum Screen
{
	Roaming;
	Ability;
}

/**
 * Screen control center
 * @author Gulvan
 */

class Canvas extends SSprite implements ICanvas
{

	private var screen:IScreen;
	
	public function switchTo(screen:Screen)
	{
		removeChild(cast this.screen);
		
		this.screen = switch (screen)
		{
			case Screen.Roaming: new SRoaming(this);
			case Screen.Ability: new SAbility(this);
		}
		
		addChild(cast this.screen);
		this.screen.init();
	}
	
	public function init(startingScreen:Screen)
	{
		this.screen = switch (startingScreen)
		{
			case Screen.Roaming: new SRoaming(this);
			case Screen.Ability: new SAbility(this);
		}
		
		addChild(cast this.screen);
		this.screen.init();
	}
	
	public function new() 
	{
		super();
	}
	
	
}