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
@:font("assets/fonts/impact.ttf")
private class Impact extends Font {}
@:font("assets/fonts/ERASDEMI.ttf")
private class Eras extends Font {}
@:font("assets/fonts/ERASMD.ttf")
private class ErasMedium extends Font {}
@:font("assets/fonts/noname.ttf")
private class Noname extends Font {}
@:font("assets/fonts/tahoma.ttf")
private class Tahoma extends Font {}
@:font("assets/fonts/tahomabold.ttf")
private class TahomaBold extends Font {}
@:font("assets/fonts/segoe.ttf")
private class Segoe extends Font {}
@:font("assets/fonts/narrow.ttf")
private class Narrow extends Font {}

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
	public static var IMPACT(default, null):String;
	public static var ERAS(default, null):String;
	public static var ERASMEDIUM(default, null):String;
	public static var NONAME(default, null):String;
	public static var TAHOMA(default, null):String;
	public static var TAHOMABOLD(default, null):String;
	public static var SEGOE(default, null):String;
	public static var NARROW(default, null):String;

	public static function init():Void 
	{
		Font.registerFont(Mirror);
		Font.registerFont(Damage);
		Font.registerFont(Buff);
		Font.registerFont(Time);
		Font.registerFont(GothicHeavy);
		Font.registerFont(GothicMedium);
		Font.registerFont(TrebuchetMSBold);
		Font.registerFont(Eras);
		Font.registerFont(ErasMedium);
		Font.registerFont(Noname);
		Font.registerFont(Tahoma);
		Font.registerFont(TahomaBold);
		Font.registerFont(Segoe);
		Font.registerFont(Narrow);
		MIRROR = (new Mirror()).fontName;
		DAMAGE = (new Damage()).fontName;
		BUFF = (new Buff()).fontName;
		TIME = (new Time()).fontName;
		GOTHICHEAVY = (new GothicHeavy()).fontName;
		GOTHICMEDIUM = (new GothicMedium()).fontName;
		TREBUCHETBOLD = (new TrebuchetMSBold()).fontName;
		IMPACT = (new Impact()).fontName;
		ERAS = (new Eras()).fontName;
		ERASMEDIUM = (new ErasMedium()).fontName;
		NONAME = (new Noname()).fontName;
		TAHOMA = (new Tahoma()).fontName;
		TAHOMABOLD = (new TahomaBold()).fontName;
		SEGOE = (new Segoe()).fontName;
		NARROW = (new Narrow()).fontName;
	}
	
	public static function get(alias:Null<String>):Null<String>
	{
		return switch (alias.toUpperCase())
		{
			case null: null;
			case "GOTHICHEAVY": GOTHICHEAVY;
			case "GOTHICMEDIUM": GOTHICMEDIUM;
			case "TREBUCHETBOLD": TREBUCHETBOLD;
			case "IMPACT": IMPACT;
			case "TIME": TIME;
			case "MIRROR": MIRROR;
			case "ERAS": ERAS;
			case "ERASMEDIUM": ERASMEDIUM;
			case "NONAME": NONAME;
			case "TAHOMA": TAHOMA;
			case "TAHOMABOLD": TAHOMABOLD;
			case "SEGOE": SEGOE;
			case "NARROW": NARROW;
			default: throw "Unrecognized font: " + alias.toUpperCase();
		};
	}
	
	public function new() 
	{
		
	}
	
}