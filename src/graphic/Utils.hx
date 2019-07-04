package graphic;
import openfl.text.TextField;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

/**
 * Graphic utils
 * @author gulvan
 */
class Utils 
{

	public static function centre(s:DisplayObject, ?container:Null<DisplayObjectContainer>) 
	{
		var w:Float = (container == null)? Main.screenW : container.width;
		var h:Float = (container == null)? Main.screenH : container.height;
		var t:Float = (container == null)? 0 : container.y;
		var l:Float = (container == null)? 0 : container.x;
		
		s.x = l + w / 2 - s.width / 2;
		s.y = t + h / 2 - s.height / 2;
	}

	public static function justify(a:Array<DisplayObject>, container:DisplayObject, horizontal:Bool)
	{
		var offset:Float = horizontal? container.width : container.height;
		for (obj in a)
			offset -= horizontal? obj.width : obj.height;
		offset /= a.length - 1;

		var currentMerge:Float = horizontal? container.x : container.y;
		for (i in 0...a.length)
			if (horizontal)
			{
				a[i].x = currentMerge;
				currentMerge += a[i].width + offset;
			}
			else
			{
				a[i].y = currentMerge;
				currentMerge += a[i].height + offset;
			}
	}

	public static function justifyTF(a:Array<TextField>, container:DisplayObject, horizontal:Bool)
	{
		var offset:Float = horizontal? container.width : container.height;
		for (obj in a)
			offset -= horizontal? obj.textWidth : obj.textHeight;
		offset /= a.length - 1;

		var currentMerge:Float = horizontal? container.x : container.y;
		for (i in 0...a.length)
			if (horizontal)
			{
				a[i].x = currentMerge;
				currentMerge += a[i].textWidth + offset;
			}
			else
			{
				a[i].y = currentMerge;
				currentMerge += a[i].textHeight + offset;
			}
	}
	
	///Assuming we have more than 2 sprites and all the sprites have equal width
	public static function distribute(a:Array<Sprite>, width:Float, lBorderOffset:Float, rBorderOffset:Float, ?groupX:Float = 0)
	{
		var offset:Float = (width - lBorderOffset - rBorderOffset - a.length * a[0].width) / (a.length - 1);
		
		for (i in 0...a.length)
			a[i].x = groupX + lBorderOffset + i * (a[0].width + offset);
	}

	public static function darken(color:Int):Int
	{
		var red:Int = Math.floor(color / Math.pow(16, 4));
		var blue:Int = Math.round(color % Math.pow(16, 2));
		var green:Int = Math.round((color - red * Math.pow(16, 4) - blue) / Math.pow(16, 2));
		red -= cast Math.min(Math.ceil(red * 0.6), red);
		green -= cast Math.min(Math.ceil(green * 0.6), green);
		blue -= cast Math.min(Math.ceil(blue * 0.6), blue);
		return Math.round(red * Math.pow(16, 4) + green * Math.pow(16, 2) + blue);
	}
	
}