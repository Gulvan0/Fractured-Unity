package utils;

/**
 * ...
 * @author Gulvan
 */
class MathUtils 
{

	public static function inRange(number:Float, leftBorder:Float, rightBorder:Float, leftIncluded:Bool = true, rightIncluded:Bool = true):Bool 
	{
		if (number >= leftBorder && number <= rightBorder)
			if (leftIncluded || number != leftBorder)
				if (rightIncluded || number != rightBorder)
					return true;
		return false;
	}
	
	public static function randomInt(leftBorder:Int, rightBorder:Int):Int
	{
		return leftBorder + Math.round(Math.random() * (rightBorder - leftBorder));
	}
	
}