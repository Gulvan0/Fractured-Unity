package roaming.components;
import openfl.display.Sprite;
import hxassert.Assert;
import openfl.display.Bitmap;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
using MathUtils;

/**
 * ...
 * @author Gulvan
 */
class WheelContainer extends SSprite 
{
	private var wheel:Array<Sprite>;
	
	///Wheel as it appears to the user, may not be equal to real player wheel because of client-server delay
	public var visionWheel:Array<ID>;
	
	public function new() 
	{
		super();
		
		wheel = [];
		visionWheel = Main.player.wheel.copy();
		for (i in 0...GameRules.wheelSlotCount(Main.player.level))
			drawWheelAb(i);
		var p = Assets.getPlayer(Main.player.element);
		add(p, -p.width/2, -p.height/2);
	}
	
	private function drawWheelAb(i:Int, ?id:ID)
	{
		if (id == null)
			id = (i < Main.player.wheel.length)? Main.player.wheel[i] : ID.EmptyAbility;
		wheel[i] = new Sprite();
		wheel[i].addChild(Assets.getRoundAbility(id));
		wheel[i].addChild(new AbSlotContour());
		add(wheel[i], wheelAbX(i), wheelAbY(i));
	}
	
	public function redrawWheelAb(i:Int, ?id:ID)
	{
		visionWheel[i] = id;
		remove(wheel[i]);
		drawWheelAb(i, id);
	}

	public function has(id:ID):Bool
	{
		return Lambda.has(visionWheel, id);
	}

	public function indexOf(id:ID):Int
	{
		return Lambda.indexOf(visionWheel, id);
	}
	
	public function identifyAbility(stageX:Float, stageY:Float):Null<Int>
	{
		for (i in 0...wheel.length)
		{
			trace(wheelAbX(i), wheelAbY(i));
			if (MathUtils.distance(new Point (stageX, stageY), new Point(x + wheelAbX(i), y + wheelAbY(i))) <= SAbility.ABILITY_RADIUS)
				return i;
		}
		return null;
	}
	
	//---------------------------------------------------------------------------------------
	
	private var WHEEL_RADIUS:Float = 125;
	
	private function wheelAbX(i:Int):Float
	{
		return WHEEL_RADIUS * Math.sin(2 * Math.PI * i / GameRules.wheelSlotCount(Main.player.level)); 
	}

	private function wheelAbY(i:Int):Float
	{
		return -WHEEL_RADIUS * Math.cos(2 * Math.PI * i / GameRules.wheelSlotCount(Main.player.level));
	}
	
}