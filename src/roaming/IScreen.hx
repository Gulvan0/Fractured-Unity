package roaming;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;

/**
 * @author Gulvan
 */
interface IScreen 
{
	public function draw():Void;
	public function onKeyPress(e:KeyboardEvent):Void;
	public function close():Void;
}