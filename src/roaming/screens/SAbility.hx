package roaming.screens;

import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import roaming.IScreen;
import roaming.Player;
import roaming.Unit;

/**
 * ...
 * @author Gulvan
 */
class SAbility extends Sprite implements IScreen 
{
	
	
	
	public function new() 
	{
		super();
	}
	
	
	/* INTERFACE roaming.IScreen */
	
	public function draw() 
	{
		trace("Drawing ability screen");
	}
	
	public function onKeyPress(e:KeyboardEvent) 
	{
		
	}
	
	public function onClick(e:MouseEvent) 
	{
		
	}
	
	public function close() 
	{
		
	}
	
}