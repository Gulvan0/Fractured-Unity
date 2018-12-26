package graphic;
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
	
	private static function create(text:String, color:Int, font:String, size:Int, align:TextFormatAlign = TextFormatAlign.LEFT, width:Int = -1):TextField
	{
		var tf:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.align = align;
		tf.text = text;
		tf.width = (width == -1)? tf.textWidth + 5 : width;
		tf.selectable = false;
		tf.wordWrap = true;
		tf.setTextFormat(format);
		return tf;
	}
	
}