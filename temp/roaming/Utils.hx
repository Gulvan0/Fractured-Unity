package roaming;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.display.PixelSnapping;

/**
 * Vision utility methods
 * @author Gulvan
 */
class Utils 
{

	public static function getClickCandidates(coordFunction:Int->Float, upperLimit:Int, clickCoordinate:Float):Array<Int>
	{
		for (i in 0...upperLimit)
			if (coordFunction(i) > clickCoordinate)
				if (i > 0)
					return [i - 1, i];
				else
					return [];	
		return [];
	}
	
	/**
	 * Parameter's center must be a top-left corner. Returned object's center is its geometric center
	 * @param	ability
	 */
	public static function squareToRound(ability:MovieClip):MovieClip
	{
		var container:MovieClip = new MovieClip();
		var newMask:MovieClip = new CircleAbilityMask();
		var abwidth:Float = 56;
		var abstroke:Float = 6.85;
		
		ability.x = -abwidth / 2;
		ability.y = -abwidth / 2;
		newMask.width = abwidth - abstroke;
		newMask.height = newMask.width;
		newMask.x = 0;
		newMask.y = 0;
		
		container.addChild(ability);
		container.addChild(newMask);
		ability.mask = newMask;
		
		container.width = container.width * 18 * 2 / newMask.width;
		container.height = container.height * 18 * 2 / newMask.height;
		
		return container;
	}
	
}