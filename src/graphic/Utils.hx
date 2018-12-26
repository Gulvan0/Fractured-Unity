package graphic;
import openfl.display.Sprite;

/**
 * Graphic utils
 * @author gulvan
 */
class Utils 
{

	public static function centre(s:Sprite, ?container:Null<Sprite>) 
	{
		var w:Float = (container == null)? Main.screenW : container.width;
		var h:Float = (container == null)? Main.screenH : container.height;
		var t:Float = (container == null)? 0 : container.y;
		var l:Float = (container == null)? 0 : container.x;
		
		s.x = l + w / 2 - s.width / 2;
		s.y = t + h / 2 - s.height / 2;
	}
	
}