package graphic;
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
	
	public static function roamPlayerInfo(text:String):TextField
	{
		return create(text, 0x000000, Fonts.GOTHICMEDIUM, 13);
	}
	
	public static function roamXPValue(text:String):TextField
	{
		return create(text, 0x765B01, Fonts.TREBUCHETBOLD, 13);
	}
	
	public static function default1(text:String, w:Int):TextField
	{
		return create(text, 0x000000, Fonts.GOTHICMEDIUM, 15, TextFormatAlign.CENTER, w);
	}

	public static function editorPatternButtonsHeader():TextField
	{
		return create("Patterns:", 0xFFFFFF, Fonts.ERAS, 30, LEFT, 200);
	}

	public static function editorWarn():TextField
	{
		return create("", 0xD50010, Fonts.ERAS, 18, TextFormatAlign.CENTER, Main.screenW);
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

	public static var defaultHintHeaderSize:Int = 18;
	public static var defaultHintTextSize:Int = 15;
	
	private static function create(text:String, color:Int, font:String, size:Int, ?align:TextFormatAlign = TextFormatAlign.LEFT, ?width:Int = -1, ?indent:Int = 0):TextField
	{
		var tf:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.align = align;
		format.indent = indent;
		tf.selectable = false;
		tf.wordWrap = true;
		tf.defaultTextFormat = format;
		tf.text = text;
		tf.width = (width == -1)? tf.textWidth + 5 : width;
		return tf;
	}
	
}