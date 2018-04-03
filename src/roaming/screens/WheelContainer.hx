package roaming.screens;
import hxassert.Assert;
import openfl.display.MovieClip;
import openfl.geom.Point;
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
		abRadius = parent.getAbRadius();
		
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
		Assert.assert(i.inRange(0, 8));
		remove(wheel[i]);
		drawWheelAb(i);
	}
	
	public function onClick(localPoint:Point)
	{
		for (i in Utils.getClickCandidates(wheelAbX, Main.player.wheel.length, localPoint.x))
			if (localPoint.getDistance(new Point(wheelAbX(i), 0)) <= abRadius)
			{
				parentScreen.splice(i);
				return;
			}
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