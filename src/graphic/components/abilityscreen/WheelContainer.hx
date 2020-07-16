package graphic.components.abilityscreen;
import openfl.events.MouseEvent;
import openfl.display.Sprite;
import hxassert.Assert;
import openfl.display.Bitmap;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
import ID.AbilityID;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * ...
 * @author Gulvan
 */
class WheelContainer extends Sprite 
{
	private var wheel:Array<Sprite>;
	
	///Wheel as it appears to the user, may not be equal to real player wheel because of client-server delay
	public var visionWheel:Array<AbilityID>;
	
	public function new() 
	{
		super();
		
		wheel = [];
		visionWheel = Main.player.wheel.copy();
		for (i in 0...GameRules.wheelSlotCount(Main.player.level))
			drawWheelAb(i);
		var p = Assets.getPlayer(Main.player.element);
		this.add(p, -p.width/2, -p.height/2);
	}
	
	private function drawWheelAb(i:Int, ?id:AbilityID)
	{
		if (id == null)
			id = (i < Main.player.wheel.length)? Main.player.wheel[i] : AbilityID.EmptyAbility;
		wheel[i] = new Sprite();
		wheel[i].addChild(Assets.getRoundAbility(id));
		wheel[i].addChild(new AbSlotContour());
		this.add(wheel[i], wheelAbX(i), wheelAbY(i));
	}
	
	public function redrawWheelAb(i:Int, ?id:AbilityID)
	{
		visionWheel[i] = id;
		removeChild(wheel[i]);
		drawWheelAb(i, id);
	}

	public function has(id:AbilityID):Bool
	{
		return Lambda.has(visionWheel, id);
	}

	public function indexOf(id:AbilityID):Int
	{
		return Lambda.indexOf(visionWheel, id);
	}
	
	public function identifyAbility(stageX:Float, stageY:Float):Null<Int>
	{
		for (i in 0...wheel.length)
			if (MathUtils.distance(new Point (stageX, stageY), new Point(x + wheelAbX(i), y + wheelAbY(i))) <= SAbility.ABILITY_RADIUS)
				return i;
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