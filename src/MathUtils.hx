package;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Gulvan
 */
class MathUtils 
{

	public static function sign(v:Float):Int
	{
		return (v == 0)? 0 : (v > 0)? 1 : -1;
	}
	
	public static function inRange(number:Float, leftBorder:Float, rightBorder:Float, leftIncluded:Bool = true, rightIncluded:Bool = true):Bool 
	{
		if (number >= leftBorder && number <= rightBorder)
			if (leftIncluded || number != leftBorder)
				if (rightIncluded || number != rightBorder)
					return true;
		return false;
	}
	
	public static inline function inside(point:Point, field:Rectangle):Bool
	{
		if ((point.x >= field.x && point.x <= field.x + field.width) && (point.y >= field.y && point.y <= field.y + field.height))
			return true;
		return false;
	}
	
	public static function distance(point1:Point, point2:Point):Float
	{
		var x1:Float = point1.x;
		var x2:Float = point2.x;
		var y1:Float = point1.y;
		var y2:Float = point2.y;
		
		return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
	}
	
	public static function randomInt(leftBorder:Int, rightBorder:Int):Int
	{
		return leftBorder + Math.round(Math.random() * (rightBorder - leftBorder));
	}
	
	public static function flip():Bool
	{
		return Math.random() >= 0.5;
	}
	
}