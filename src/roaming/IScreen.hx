package roaming;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;

/**
 * @author Gulvan
 */
interface IScreen 
{
	public function draw(player:Unit);
	public function onKeyPress(e:KeyboardEvent);
	public function onClick(e:MouseEvent);
	public function close();
}