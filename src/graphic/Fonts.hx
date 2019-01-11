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
@:font("assets/fonts/gothicheavy.ttf")
private class GothicHeavy extends Font {}
@:font("assets/fonts/gothicmedium.ttf")
private class GothicMedium extends Font {}
@:font("assets/fonts/trebuchetbold.ttf")
private class TrebuchetMSBold extends Font {}

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
	public static var GOTHICHEAVY(default, null):String;
	public static var GOTHICMEDIUM(default, null):String;
	public static var TREBUCHETBOLD(default, null):String;
	
	public static function init():Void 
	{
		Font.registerFont(Mirror);
		Font.registerFont(Damage);
		Font.registerFont(Buff);
		Font.registerFont(Time);
		Font.registerFont(GothicHeavy);
		Font.registerFont(GothicMedium);
		Font.registerFont(TrebuchetMSBold);
		MIRROR = (new Mirror()).fontName;
		DAMAGE = (new Damage()).fontName;
		BUFF = (new Buff()).fontName;
		TIME = (new Time()).fontName;
		GOTHICHEAVY = (new GothicHeavy()).fontName;
		GOTHICMEDIUM = (new GothicMedium()).fontName;
		TREBUCHETBOLD = (new TrebuchetMSBold()).fontName;
	}
	
	public static function get(alias:String):String
	{
		return switch (alias.toUpperCase())
		{
			case "GOTHICHEAVY": return GOTHICHEAVY;
			case "GOTHICMEDIUM": return GOTHICMEDIUM;
			case "TREBUCHETBOLD": return TREBUCHETBOLD;
			default: throw "Unrecognized font";
		}
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