package utils;
import hxassert.Assert;
import openfl.geom.Rectangle;
import openfl.geom.Point;

/**
 * ...
 * @author Gulvan
 */
class Utils
{

	public static inline function contains(point:Point, field:Rectangle):Bool 
	{
		if ((point.x >= field.x && point.x <= field.x + field.width) && (point.y >= field.y && point.y <= field.y + field.height))
			return true;
		return false;
	}
	
	public static function findWeakestUnit(array:Array<BattleUnit>):BattleUnit 
	{
		Assert.require(array.length > 0);
		
		var result:BattleUnit = array[0];
		
		for (unit in array)
			if (unit.hpPool.value < result.hpPool.value)
				result = unit;
		
		return result;
	}
	
}