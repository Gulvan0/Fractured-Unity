package graphic;
import openfl.text.Font;

@:font("assets/fonts/mirror.ttf")
private class Mirror extends Font {}
@:font("assets/fonts/damage.ttf")
private class Damage extends Font {}
@:font("assets/fonts/buff.ttf")
private class Buff extends Font {}
@:font("assets/fonts/time.ttf")
private class Time extends Font {}

/**
 * Font Manager
 * @author Gulvan
 */
class Fonts 
{

	public static var MIRROR(default, null):String;
	public static var DAMAGE(default, null):String;
	public static var BUFF(default, null):String;
	public static var TIME(default, null):String;
	
	public static function init():Void 
	{
		Font.registerFont(Mirror);
		Font.registerFont(Damage);
		Font.registerFont(Buff);
		Font.registerFont(Time);
		MIRROR = (new Mirror()).fontName;
		DAMAGE = (new Damage()).fontName;
		BUFF = (new Buff()).fontName;
		TIME = (new Time()).fontName;
	}
	
	public static function color(element:Null<Element>):Int
	{
		return switch (element)
		{
			case Element.Fire: 0xFF6509;
			case Element.Terra: 0x6A744B;
			case Element.Lightning: 0xF2F277;
			case Element.Shadow: 0x9B55B3;
			case Element.Frost: 0x4ACAFB;
			case Element.Poison: 0x40954A;
			case Element.Physical: 0xCA2828;
			default: 0x33FA01;
		}
	}
	
	public function new() 
	{
		
	}
	
}