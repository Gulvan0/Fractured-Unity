package roaming.screens.components;
import hxassert.Assert;
import openfl.display.Bitmap;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
using roaming.screens.Utils;
using MathUtils;

/**
 * ...
 * @author Gulvan
 */
class WheelContainer extends SSprite 
{

	private var parentScreen:ISAbility;
	private var abRadius:Float;
	
	private var wheel:Array<MovieClip>;
	
	public function new(parent:ISAbility) 
	{
		super();
		this.parentScreen = parent;
		abRadius = parentScreen.getAbRadius();
		
		wheel = [];
		for (i in 0...8)
			drawWheelAb(i);
	}
	
	private function drawWheelAb(i:Int)
	{
		Assert.assert(i.inRange(0, 8));
		var id:ID = (i < Main.player.wheel.length)? Main.player.wheel[i] : ID.EmptyAbility;
		wheel[i] = Assets.getBattleAbility(id).squareToRound();
		add(wheel[i], wheelAbX(i), 0);
	}
	
	public function redrawWheelAb(i:Int)
	{
		trace("ability redrawing: " + i);
		Assert.assert(i.inRange(0, 8));
		remove(wheel[i]);
		drawWheelAb(i);
	}
	
	public function onClick(localPoint:Point)
	{
		trace("wheel recieved click");
		var ab:Int = identifyAbility(localPoint);
		if (ab == -1)
			return;
			
		parentScreen.splice(ab);
	}
	
	private function identifyAbility(localClickPoint:Point):Int
	{
		for (i in Utils.getClickCandidates(function(i) return wheelAbX(i) - abRadius, Main.player.wheel.length + 1, localClickPoint.x))
			if (localClickPoint.distance(new Point(wheelAbX(i), 0)) <= abRadius)
				return i;
		return -1;
	}
	
	//---------------------------------------------------------------------------------------
	
	private var wheelAbWidth:Float = 513;
	
	private function wheelAbX(i:Int):Float
	{
		return (2 * abRadius + wheelAbXOffset()) * i; 
	}
	
	private function wheelAbXOffset():Float
	{
		return (wheelAbWidth - 2 * abRadius * 7) / 8; 
	}
	
}