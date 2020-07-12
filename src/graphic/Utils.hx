package graphic;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.display.Stage;
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

	public static function centre(s:DisplayObject, ?relativeTo:Null<DisplayObject>, ?limitToAxis:Axis, ?isCentralRegistration:Bool = false) 
	{
		return centreRect(s, relativeTo != null? new Rectangle(relativeTo.x, relativeTo.y, relativeTo.width, relativeTo.height) : null, limitToAxis, isCentralRegistration);
	}

	public static function centreRect(s:DisplayObject, ?relativeTo:Null<Rectangle>, ?limitToAxis:Axis, ?isCentralRegistration:Bool = false) 
	{
		var w:Float = (relativeTo == null)? Main.screenW : relativeTo.width;
		var h:Float = (relativeTo == null)? Main.screenH : relativeTo.height;
		var t:Float = (relativeTo == null)? 0 : relativeTo.y;
		var l:Float = (relativeTo == null)? 0 : relativeTo.x;
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

	public static function overlaps(obj1:DisplayObject, obj2:DisplayObject, stage:Stage):Bool
	{
		var intersection:Rectangle = obj1.getBounds(stage).intersection(obj2.getBounds(stage));   
        if (!intersection.isEmpty())
            for (dx in 0...(cast intersection.width))
                for (dy in 0...(cast intersection.height))
                    if (obj1.hitTestPoint(intersection.x + dx, intersection.y + dy, true) && obj2.hitTestPoint(intersection.x + dx, intersection.y + dy, true))
                        return true;
        return false;
	}

	public static function resizeAccordingly(obj:DisplayObject, fitWidth:Float, fitHeight:Float) 
	{
		var scale:Float = Math.min(fitWidth / obj.width, fitHeight / obj.height); 
		scale = Math.min(1, scale);
		obj.scaleX = scale;
		obj.scaleY = scale;
	}

	public static function getOffset(obj:DisplayObject):Point
	{
		var rect:Rectangle = obj.getBounds(obj);
		return new Point(rect.x, rect.y);
	}

	public static function disposeAlignedH(obj:DisplayObject, width:Float, align:Align, ?left:Float = 0, ?objWidth:Float)
	{
		if (objWidth == null)
			objWidth = obj.width;

		obj.x = switch align {
			case Left: left;
			case Center: left + (width - objWidth)/2;
			case Right: left + width - objWidth;
		}
	}

	public static function disposeAlignedV(obj:DisplayObject, height:Float, align:Align, ?top:Float = 0, ?objHeight:Float)
	{
		if (objHeight == null)
			objHeight = obj.height;
		
		obj.y = switch align {
			case Left: top;
			case Center: top + (height - objHeight)/2;
			case Right: top + height - objHeight;
		}
	}
	
}