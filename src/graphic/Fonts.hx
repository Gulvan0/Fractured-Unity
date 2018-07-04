package graphic;
import openfl.text.Font;

@:font("assets/fonts/mirror.ttf")
private class Mirror extends Font {}

/**
 * Font Manager
 * @author Gulvan
 */
class Fonts 
{

	public static var MIRROR(default, null):String;
	
	public static function init():Void 
	{
		Font.registerFont(Mirror);
		MIRROR = (new Mirror()).fontName;
	}
	
	public function new() 
	{
		
	}
	
}