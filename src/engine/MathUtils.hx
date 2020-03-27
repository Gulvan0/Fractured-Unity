package engine;
import openfl.geom.Point;
import openfl.geom.Rectangle;

class RectArea
{
	public var p1:Point;
	public var p2:Point;

	public function toRect():Rectangle
	{
		return new Rectangle(p1.x, p1.y, p2.x - p1.x, p2.y - p1.y);
	}

	public function new(p1:Point, p2:Point)
	{
		this.p1 = new Point(Math.min(p1.x, p2.x), Math.min(p1.y, p2.y));
		this.p2 = new Point(Math.max(p1.x, p2.x), Math.max(p1.y, p2.y));
	}
}

class RoundArea
{
	public var center:Point;
	public var radius:Float;

	public function new(center:Point, radius:Float)
	{
		this.center = center;
		this.radius = radius;
	}
}

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
	
	public static function inRange(number:Float, leftBorder:Float, rightBorder:Float, ?leftIncluded:Bool = true, ?rightIncluded:Bool = true):Bool 
	{
		if (number >= leftBorder && number <= rightBorder)
			if (leftIncluded || number != leftBorder)
				if (rightIncluded || number != rightBorder)
					return true;
		return false;
	}

	///Only accepts 'normal' rectangles
	public static inline function insideC(x:Float, y:Float, field:Rectangle):Bool
	{
		if ((x >= field.x && x <= field.x + field.width) && (y >= field.y && y <= field.y + field.height))
			return true;
		return false;
	}

	///Only accepts 'normal' rectangles
	public static inline function inside(point:Point, field:Rectangle):Bool
	{
		return insideC(point.x, point.y, field);
	}

	public static function moveRect(rect:Rectangle, dx:Float, dy:Float)
	{
		rect.x += dx;
		rect.y += dy;
	}

	public static function rectByPoints(x1:Float, y1:Float, x2:Float, y2:Float):Rectangle
	{
		return new Rectangle(Math.min(x1, x2), Math.min(y1, y2), Math.abs(x1 - x2), Math.abs(y1 - y2));
	}

	public static inline function intersects(rect1:Rectangle, rect2:Rectangle):Bool
	{
		return !rect1.intersection(rect2).isEmpty();
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

	public static function degreeToRadian(v:Float):Float
	{
		return v * Math.PI / 180;
	}

	public static function radianToDegree(v:Float):Float
	{
		return v * 180 / Math.PI;
	}
	
}