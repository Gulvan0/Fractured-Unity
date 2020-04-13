package graphic;
import openfl.text.TextField;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

enum Axis
{
	X;
	Y;
}

/**
 * Graphic utils
 * @author gulvan
 */
class Utils 
{

	public static function centre(s:DisplayObject, ?container:Null<DisplayObject>, ?limitToAxis:Axis, ?isCentralRegistration:Bool = false) 
	{
		var w:Float = (container == null)? Main.screenW : container.width;
		var h:Float = (container == null)? Main.screenH : container.height;
		var t:Float = (container == null)? 0 : container.y;
		var l:Float = (container == null)? 0 : container.x;
		var sw:Float = Std.is(s, TextField)? cast(s, TextField).textWidth : s.width;
		var sh:Float = Std.is(s, TextField)? cast(s, TextField).textHeight : s.height;

		
		if (limitToAxis == null || limitToAxis == Axis.X)
			s.x = l + w / 2 - (isCentralRegistration? 0 : sw / 2);
		if (limitToAxis == null || limitToAxis == Axis.Y)	
			s.y = t + h / 2 - (isCentralRegistration? 0 : sh / 2);
	}

	public static function justify(a:Array<DisplayObject>, containerCoord:Float, containerMetric:Float, horizontal:Bool)
	{
		var offset:Float = containerMetric;
		for (obj in a)
			offset -= horizontal? obj.width : obj.height;
		offset /= a.length - 1;

		var currentMerge:Float = containerCoord;
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

	public static function justifyTF(a:Array<TextField>, containerCoord:Float, containerMetric:Float, horizontal:Bool, ?withBorderOffset:Bool = false)
	{
		if (a.length == 1)
		{
			if (horizontal)
				a[0].x = containerCoord + (containerMetric - a[0].textWidth) / 2;
			else 
				a[0].y = containerCoord + (containerMetric - a[0].textHeight) / 2;
			return;
		}

		var offset:Float = containerMetric;
		for (obj in a)
			offset -= horizontal? obj.textWidth : obj.textHeight;
		offset /= withBorderOffset? a.length : a.length - 1;

		var currentMerge:Float = containerCoord + (withBorderOffset? offset / 2 : 0);
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

	public static function fillScreen(image:DisplayObject)
	{
		var qx:Float = Main.screenW / image.width;
		var qy:Float = Main.screenH / image.height;
		if (qx > qy)
		{
			image.x = (image.width*qy - Main.screenW)/2;
			image.y = 0;
			image.scaleX = image.scaleY = qy;
		}
		else
		{
			image.x = 0;
			image.y = (image.height*qx - Main.screenH)/2;
			image.scaleX = image.scaleY = qx;
		}
	}

	public static function move(obj:DisplayObject, x:Float, y:Float)
	{
		obj.x = x;
		obj.y = y;
	}
	
}