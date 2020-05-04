package graphic;
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
		return create("Patterns:", 0xFFFFFF, Fonts.ERAS, 30);
	}

	public static function editorWarn():TextField
	{
		return create("", 0xD50010, Fonts.ERAS, 18, TextFormatAlign.CENTER, Main.screenW);
	}

	public static var quickBarItemShadowColor:Int = 0x014754;
	public static var quickBarItemActiveShadowColor:Int = 0x666666;
	public static var quickBarItemColor:Int = 0x49B7CC;
	public static var quickBarItemActiveColor:Int = 0x7FE7FF;
	public static function quickBarItem(text:String):TextField
	{
		var tf = create(text, quickBarItemColor, Fonts.TAHOMA, 23, TextFormatAlign.CENTER);
		tf.filters = [new DropShadowFilter(4, 45, quickBarItemShadowColor)];
		return tf;
	}
	
	private static function create(text:String, color:Int, font:String, size:Int, align:TextFormatAlign = TextFormatAlign.LEFT, width:Int = -1):TextField
	{
		var tf:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.align = align;
		tf.width = (width == -1)? tf.textWidth + 5 : width;
		tf.selectable = false;
		tf.wordWrap = true;
		tf.defaultTextFormat = format;
		tf.text = text;
		return tf;
	}
	
}