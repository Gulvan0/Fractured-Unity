package battle;
import graphic.components.hints.AbilityHint.AbilityHintType;
import openfl.display.Sprite;
import battle.enums.AbilityType;
import battle.struct.Countdown;
import flash.events.Event;
import graphic.Fonts;
import hxassert.Assert;
import openfl.display.MovieClip;
import openfl.display.Shape;
import openfl.events.MouseEvent;
import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using Math;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * ...
 * @author Gulvan
 */
class AbilityCell extends Sprite 
{
	
	public var id:ID.AbilityID;
	private var active:Bool;
	private var cd:Countdown;
	
	private var icon:Sprite;
	private var cdSegments:Array<Shape>;
	private var cdText:TextField;

	public function decrementCooldown()
	{
		if (id == ID.AbilityID.EmptyAbility || id == ID.AbilityID.LockAbility || !active)
			return;
		
		if (cd.value > 0)
		{
			for (seg in cdSegments)
				if (seg.visible == true)
				{
					seg.visible = false;
					break;
				}
			cd.value--;
			removeChild(cdText);
			setCDText();
			cdText.text = (cd.value > 0)? "" + cd.value : "";
			this.add(cdText, -4, 4);
		}
	}
	
	public function changeCooldown(value:Int)
	{
		Assert.assert(value <= cd.keyValue);
		for (i in 0...value)
			cdSegments[cd.keyValue - i - 1].visible = true;
		for (i in value...cd.keyValue)
			cdSegments[cd.keyValue - i - 1].visible = false;
		cd.value = value;
		removeChild(cdText);
		setCDText();
		cdText.text = (cd.value > 0)? "" + cd.value : "";
		this.add(cdText, -4, 4);
	}
	
	public function renewCooldown()
	{
		changeCooldown(cd.keyValue);
	}
	
	public function new(ab:Ability, button:String) 
	{
		super();
		id = ab.id;
		icon = Assets.getBattleAbility(ab.id, true, Battle, ab.level);
		this.add(icon, 0, 0);
		if (ab.checkEmpty()) 
			return;
			
		active = ab.isActive();
		if (active)
		{
			cd = new Countdown(ab.delay, ab.cooldown);
			cdSegments = [];
			drawSegments(ab.cooldown);
			setCDText();
			changeCooldown(ab.delay);
			
			for (seg in cdSegments)
				this.add(seg, Assets.FULL_ABILITY_RADIUS, Assets.FULL_ABILITY_RADIUS);
			this.add(cdText, 5 + Assets.ABILITY_BORDER_THICKNESS, 4 + Assets.ABILITY_BORDER_THICKNESS);
		}
	}
	
	private function setCDText()
	{
		var format:TextFormat = new TextFormat();
		format.color = 0x9F9F9F;
		format.size = 40;
		format.align = TextFormatAlign.CENTER;
		format.font = Fonts.MIRROR;
		cdText = new TextField();
		cdText.embedFonts = true;
		cdText.selectable = false;
		cdText.mouseEnabled = false;
		cdText.setTextFormat(format);
		cdText.width = Assets.INNER_ABILITY_RADIUS * 2;
		cdText.filters = [new DropShadowFilter()];
	}
	
	private function drawSegments(q:Int)
	{
		var angle:Float = 1 / q;
		var prevPoint:Point = new Point(0, -Assets.INNER_ABILITY_RADIUS);
		var t:Float = 2 * Math.PI;
		
		for (i in 1...q+1)
		{
			var vertex:Point = iconVertices(prevPoint, 4)[0];
			var len:Int = 0;
			var nextPoint:Point;
			var a:Float = (-Math.pow((vertex.x - prevPoint.x) + (vertex.y - prevPoint.y), 2) + Math.pow(prevPoint.x, 2) + Math.pow(prevPoint.y, 2) + 2 * Assets.INNER_ABILITY_RADIUS * Assets.INNER_ABILITY_RADIUS) / (Assets.INNER_ABILITY_RADIUS * 2 * Math.sqrt(2 * (prevPoint.x * prevPoint.x + prevPoint.y * prevPoint.y)));
			
			if (q == 1)
				len = 4;
			else
				for (j in 0...4)
					if (Math.cos((angle - 0.25 * j) * t) <= a && (angle - 0.25 * j) > 0)
						len++;
					else
						break;
			
			var fangle:Float = angle * i;
			
			if (i == q)
				nextPoint = new Point(0, -Assets.INNER_ABILITY_RADIUS);
			else if (fangle < 0.125)
				nextPoint = new Point(Math.tan(t * fangle) * Assets.INNER_ABILITY_RADIUS, -Assets.INNER_ABILITY_RADIUS);
			else if (fangle < 0.375)
				nextPoint = new Point(Assets.INNER_ABILITY_RADIUS, Math.tan((fangle - 0.25) * t) * Assets.INNER_ABILITY_RADIUS);
			else if (fangle < 0.625)
				nextPoint = new Point(Math.tan((0.5 - fangle) * t) * Assets.INNER_ABILITY_RADIUS, Assets.INNER_ABILITY_RADIUS);
			else if (fangle < 0.875)
				nextPoint = new Point(-Assets.INNER_ABILITY_RADIUS, Math.tan((0.75 - fangle) * t) * Assets.INNER_ABILITY_RADIUS);
			else
				nextPoint = new Point(Math.tan((fangle - 1) * t) * Assets.INNER_ABILITY_RADIUS, -Assets.INNER_ABILITY_RADIUS);
				
			cdSegments.push(drawSeg([prevPoint].concat(iconVertices(prevPoint, len)).concat([nextPoint])));
			prevPoint = nextPoint;
		}
	}
	
	private function iconVertices(p:Point, len:Int)
	{
		var a:Array<Point> = [new Point(Assets.INNER_ABILITY_RADIUS, -Assets.INNER_ABILITY_RADIUS), new Point(Assets.INNER_ABILITY_RADIUS, Assets.INNER_ABILITY_RADIUS), new Point(-Assets.INNER_ABILITY_RADIUS, Assets.INNER_ABILITY_RADIUS), new Point(-Assets.INNER_ABILITY_RADIUS, -Assets.INNER_ABILITY_RADIUS)];
		
		var index:Int = 0;
		if (p.x == Assets.INNER_ABILITY_RADIUS && p.y != Assets.INNER_ABILITY_RADIUS)
			index = 1;
		else if (p.x == -Assets.INNER_ABILITY_RADIUS && p.y != -Assets.INNER_ABILITY_RADIUS)
			index = 3;
		else if (p.y == Assets.INNER_ABILITY_RADIUS)
			index = 2;
		else if (p.y == -Assets.INNER_ABILITY_RADIUS)
			index = 0;
				
		return [for (i in 0...len) a[(i + index) % 4]];
	}
	
	private function drawSeg(vertices:Array<Point>):Shape
	{
		var seg:Shape = new Shape();
		seg.graphics.lineStyle(0, 0, 0.135);
		seg.graphics.moveTo(0, 0);
		seg.graphics.beginFill(0x000000, 0.7);
		for (p in vertices)
			seg.graphics.lineTo(p.x, p.y);
		seg.graphics.lineTo(0, 0);
		seg.graphics.endFill();
		return seg;
	}
	
}