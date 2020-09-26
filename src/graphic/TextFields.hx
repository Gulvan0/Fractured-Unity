package graphic;
import engine.Color;
import struct.Attribute;
import graphic.components.mainmenu.PlayerInfobox;
import graphic.components.mainmenu.quickbar.QuickBarItem.QuickBarStyle;
import graphic.components.mainmenu.quickbar.QuickBarItem.ItemName;
import graphic.components.RestrictedField;
import openfl.filters.DropShadowFilter;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import haxe.ds.IntMap;

/**
 * ...
 * @author Gulvan
 */
class TextFields 
{

	public static function roamZoneName(text:String):TextField
	{
		return create(text, 0x000033, "Impact", 14, TextFormatAlign.RIGHT);
	}
	
	public static function roamStageNum(text:String):TextField
	{
		return create(text, 0x000033, "Impact", 15, TextFormatAlign.LEFT);
	}
	
	public static function roamPlayerName(text:String):TextField
	{
		return create(text, 0x000000, Fonts.GOTHICHEAVY, 18);
	}
	
	public static function roamXPValue(text:String):TextField
	{
		var tf = create(text, 0x765B01, Fonts.TREBUCHETBOLD, 21, null, 235);
		tf.height = tf.textHeight + 5;
		return tf;
	}
	
	public static function default1(text:String, w:Int):TextField
	{
		return create(text, 0x000000, Fonts.GOTHICMEDIUM, 15, TextFormatAlign.CENTER, w);
	}

	public static function editorPatternButtonsHeader():TextField
	{
		return create("Patterns:", 0xFFFFFF, Fonts.ERAS, 30, LEFT, 200);
	}

	public static function battleWarn(text:String):TextField
	{
		return create(text, 0x000000, Fonts.ERAS, 20, CENTER, Main.screenW);
	}

	public static function editorWarn():TextField
	{
		return create("", 0xD50010, Fonts.ERAS, 18, CENTER, Main.screenW);
	}

	public static function editorParamName(text:String):TextField
	{
		return create(text, 0xCCCCCC, Fonts.ERAS, 22);
	}

	public static function editorParamValue(v:Float, from:Float, to:Float, int:Bool, cb:Float->Void):TextField
	{
		var tf = new RestrictedField(v, from, to, int, cb);
		tf.defaultTextFormat = new TextFormat(Fonts.ERAS, 20, 0xCCCCCC);
		tf.defaultTextFormat.align = TextFormatAlign.CENTER;
		tf.width = 55;
		return tf;
	}

	public static function editorParamboxWarn(text:String):TextField
	{
		return create(text, 0x333333, Fonts.ERAS, 13, LEFT, 250, 18);
	}

	public static function editorOptionSelector(text:String):TextField
	{
		return create(text, 0xCCCCCC, Fonts.ERAS, 22, TextFormatAlign.CENTER);
	}

	public static function editorHelpHeader(text:String):TextField
	{
		return create(text, 0xCCCCCC, Fonts.TAHOMABOLD, 25, TextFormatAlign.CENTER, 304, 1);
	}

	public static function editorHelpGeneral(text:String, ?width:Int, ?color:Int = 0xCCCCCC):TextField
	{
		return create(text, color, Fonts.ERAS, 23, TextFormatAlign.CENTER, width);
	}

	public static function editorHelpManualLink():TextField
	{
		var text:String = "Editor manual";
		var tf = create(text, 0xCCCCCC, "Arial", 23, TextFormatAlign.CENTER);
		tf.defaultTextFormat.italic = true;
		tf.defaultTextFormat.underline = true;
		tf.text = text;
		tf.width = 310;
		return tf;
	}

	public static var quickBarItemShadowColor:Int = 0x333333;
	public static var quickBarItemActiveShadowColor:Int = 0x666666;
	public static function quickBarItemColor(style:QuickBarStyle):Int
	{
		return switch style {
			case MainScreen: 0xD68380;
			case Character: 0x49B7CC;
		}
	}
	public static function quickBarItemActiveColor(style:QuickBarStyle):Int
	{
		return switch style {
			case MainScreen: 0xE58C89;
			case Character: 0x7FE7FF;
		}
	}

	public static function quickBarItem(text:String, style:QuickBarStyle):TextField
	{
		var tf = create(text, quickBarItemColor(style), Fonts.TAHOMA, 23, TextFormatAlign.CENTER);
		tf.filters = [new DropShadowFilter(4, 45, quickBarItemShadowColor)];
		return tf;
	}

	public static function xpbarLevel(text:String):TextField
	{
		var tf = create(text, 0xF2D269, Fonts.GOTHICHEAVY, 37, CENTER, 66);
		tf.height = tf.textHeight + 5;
		return tf;
	}

	public static function classRecord(text:String):TextField
	{
		return create(text, 0xCCCCCC, Fonts.TAHOMA, 18, CENTER, 166);
	}

	public static function infoboxPlayerName(text:String):TextField
	{
		return create(text, 0x000000, Fonts.TAHOMA, 25, CENTER, PlayerInfobox.INFOBOX_WIDTH);
	}

	public static function infoboxRating(text:String):TextField
	{
		return create(text, 0xE0AD00, Fonts.TAHOMA, 20, CENTER, PlayerInfobox.INFOBOX_WIDTH);
	}

	public static function infoboxMostplayedHeader():TextField
	{
		return create("Most played classes:", 0x000000, Fonts.TAHOMA, 20, LEFT, PlayerInfobox.INFOBOX_WIDTH, 2);
	}
	
	public static function infoboxPlayerComment(text:String):TextField
	{
		var tf = create(text, 0x000000, Fonts.ERAS, 18, CENTER, PlayerInfobox.INFOBOX_WIDTH);
		tf.height = tf.textHeight + 5;
		return tf;
	}

	public static function respecLabel():TextField
	{
		return create("Re-spec", 0x000000, Fonts.ERAS, 21, LEFT, 90);
	}
	
	public static function upperBarName(name:String, width:Float):TextField
	{
		return create(name, 0x000000, Fonts.ERAS, 14, CENTER, width);
	}

	public static function highlightUpperBarName(tf:TextField, on:Bool) 
	{
		var format = new TextFormat(Fonts.ERAS, 14);
		format.color = on? 0xFFFF00 : 0x000000;
		format.align = CENTER;
		tf.setTextFormat(format);
	}

	public static function upperBarHPManaValue(text:String, width:Float):TextField
	{
		return create(text, 0x000000, Fonts.GOTHICHEAVY, 14, LEFT, width);
	}

	public static function damage(text:String, color:Int, width:Float):TextField
	{
		return create(text, color, Fonts.DAMAGE, 55, CENTER, width);
	}

	public static function abilityKey(text:String):TextField
	{
		var tf = create(text, 0x000000, Fonts.GOTHICHEAVY, 14, CENTER, Assets.FULL_ABILITY_RADIUS*2);
		tf.mouseEnabled = false;
		return tf;
	}

	public static function sabilityReference():TextField
	{
		var tf = new RichString("Reference:\n"+
		"\n"+
		"&00FFFF[RMB] on tree: Learn/Upgrade ability or edit its patterns\n"+
		"&00FFFF[RMB] on wheel: Unequip ability or edit its patterns\n"+
		"&00FFFF[LMB] to drag the ability\n"+
		"Each ability can be put on wheel only once\n"+
		"\n"+
		"Hover the attribute names for additional information\n"+
		"Hold &00FFFF[Ctrl] while clicking on a plus button to spend 10 attribute points at once").format(20, 320, 0x000000, false, CENTER);
		tf.height = tf.textHeight + 5;
		return tf;
	}

	public static function attName(a:Attribute):TextField
	{
		var tf = create(a.getName(), Color.attribute(a), Fonts.ERAS, 21);
		tf.height = tf.textHeight + 5;
		return tf;
	}

	public static function popupDecide(text:String, color:Int):TextField
	{
		var tf = create(text, color, Fonts.ERAS, 30);
		tf.height = tf.textHeight + 5;
		return tf;
	}

	public static function bhName(name:String):TextField
	{
		return create('Evader: $name', 0xFFFFFF, Fonts.ERAS, 20);
	}

	public static var defaultHintHeaderSize:Int = 18;
	public static var defaultHintTextSize:Int = 15;
	
	private static function create(text:String, color:Int, font:String, size:Int, ?align:TextFormatAlign = TextFormatAlign.LEFT, ?width:Float, ?indent:Int = 0):TextField
	{
		var format:TextFormat = new TextFormat(font, size, color);
		format.align = align;
		format.indent = indent;
		return createWithFormat(text, format, width);
	}

	private static function createWithFormat(text:String, format:TextFormat, ?width:Float):TextField
	{
		var tf:TextField = new TextField();
		tf.selectable = false;
		tf.defaultTextFormat = format;
		tf.text = text;
		if (width != null)
		{
			tf.wordWrap = true;
			tf.width = width;
		}
		else
			tf.width = tf.textWidth + 5;
		return tf;
	}
	
}