package;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * Provides an extended functionality for the Sprite class
 * @author Gulvan
 */
class SSprite extends Sprite 
{

	public function new() 
	{
		super();
	}
	
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