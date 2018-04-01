package roaming.screens;

import hxassert.Assert;
import lime.math.Rectangle;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import roaming.IScreen;
import roaming.Player;
import roaming.Tree;
import roaming.Unit;
using MathUtils;

/**
 * Ability screen. Contains ability tree and ability wheel
 * @author Gulvan
 */
class SAbility extends SSprite implements IScreen 
{
	
	private var wheel:Array<MovieClip>;
	private var attribValues:Array<TextField>;
	private var addButtons:Array<MovieClip>;
	private var closeButton:MovieClip;
	
	public function draw() 
	{
		add(new AbilityScreenBG(), bg.x, bg.y);
		add(new TreeBox(), treeBox.x, treeBox.y);
		
		for (ability in Main.player.tree)
		{
			var icon:MovieClip = Assets.getBattleAbility(ability.id);
			icon = squareToRound(icon);
			add(icon, treeAbX(ability.j), treeAbY(ability.i));
		}
		
		for (i in 0...8)
			drawWheelAb(i);
		
		var unit:MovieClip = Assets.getUnit(Main.player.id);
		unit.width = unit.width * 233.5 / unit.height;
		unit.height = 233.5;
		add(unit, playerIcon.x, playerIcon.y); 
		
		addName("Vitality", 0x008000, 1);
		addName("Strength", 0xFF3300, 2);
		addName("Flow", 0xA0D80E, 3);
		addName("Intellect", 0x6600CC, 4);
		
		addValue("--", 0x000000, 1);
		addValue(Main.player.strength + "", 0x000000, 2);
		addValue(Main.player.flow + "", 0x000000, 3);
		addValue(Main.player.intellect + "", 0x000000, 4);
		
		for (i in 1...5)
			add(addButtons[i], plusX, lineY(i) + plusLineOffset);
		
		closeButton = new CloseAbScreen();
		add(closeButton, exitX(), exitY());
		closeButton.addEventListener(MouseEvent.CLICK, onCloseRequest, false, 0, true);
	}
	
	private function addName(attribute:String, color:Int, line:Int)
	{
		add(createTF(attribute, "Eras Demi ITC", 21, color, 1), attributeX, lineY(line));
	}
	
	private function addValue(value:String, color:Int, line:Int)
	{
		var tf:TextField = createTF(value, "Eras Demi ITC", 21, color, 1);
		attribValues[line] = tf;
		add(tf, valueX, lineY(line));
	}
	
	private function createTF(text:String, font:String, size:Int, ?color:Null<Int>, ?spacing:Null<Float>):TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.letterSpacing = spacing;
		t.text = text;
		t.setTextFormat(format);
		return t;
	}
	
	private function drawWheelAb(i:Int)
	{
		Assert.assert(i.inRange(0, 8));
		var id:ID = (i < Main.player.wheel.length)? Main.player.wheel[i] : ID.EmptyAbility;
		var icon:MovieClip = Assets.getBattleAbility(id);
		icon = squareToRound(icon);
		wheel[i] = icon;
		add(wheel[i], wheelAbX(i), wheelAbY);
	}
	
	private function redrawWheelAb(i:Int)
	{
		Assert.assert(i.inRange(0, 8));
		remove(wheel[i]);
		drawWheelAb(i);
	}
	
	private function onClick(e:MouseEvent)
	{
		var point:Point = new Point(e.stageX, e.stageY);
		
		if (point.inside(new TreeBox().getRect(this)))
			for (i in getCandidates(XMLUtils.getGlobal("tree", "height", 1), point.y, treeAbY))
				for (j in getCandidates(XMLUtils.getGlobal("tree", "width", 1), point.x, treeAbX))
					if (point.getDistance(new Point(treeAbX(j), treeAbY(i))) <= abRadius)
					{
						if (Main.player.wheel.length < 8)
						{
							Main.player.wheel.push(Main.player.tree.get(i, j).id);
							redrawWheelAb(Main.player.wheel.length);
						}
						else
							trace("Wheel is full, unable to add more abilities");
							
						return;
					}
		else if (point.y.inRange(wheelAbY - abRadius, wheelAbY + abRadius))
			for (i in getCandidates(Main.player.wheel.length, point.x, wheelAbX))
				if (point.getDistance(new Point(wheelAbX(i), wheelAbY)) <= abRadius)
				{
					Main.player.wheel.splice(i, 1);
					for (x in i...Main.player.wheel.length + 1)
						redrawWheelAb(x);
						
					return;
				}
	}
	
	private function getCandidates(upperLimit:Int, clickCoordinate:Float, coordFunction:Int->Float):Array<Int>
	{
		for (i in 0...upperLimit)
			if (clickCoordinate > coordFunction(i))
				if (i > 0)
					return [i - 1; i];
				else
					return [];	
		return [];
	}
	
	private function onCloseRequest(e:MouseEvent)
	{
		Basis.instance.closeScreen();
	}
	
	public function onKeyPress(e:KeyboardEvent) 
	{
		//no handling
	}
	
	public function close() 
	{
		//no cleanup
	}
	
	public function new() 
	{
		super();
		wheel = [];
		attribValues = [];
		addButtons = [new AddVitality(), new AddStrength(), new AddFlow(), new AddIntellect()];
	}
	
	/**
	 * Parameter object has to have its zero at top-left corner. Returned object has its zero at its center
	 * @param	ability
	 */
	public function squareToRound(ability:MovieClip):MovieClip
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
		
		container.width = container.width * abRadius * 2 / newMask.width;
		container.height = container.height * abRadius * 2 / newMask.height;
		
		return container;
	}
	
	//================================================================================
	// Inline map
	//================================================================================
	
	private static var bg:Point = new Point(0, 0);
	private static var treeBox:Point = new Point(50, 50);
	private static inline var abRadius:Float = 18;
	
	private static inline var wheelAbY:Float = 495;
	private static inline var wheelAbXFirst:Float = 370;
	private static inline var wheelAbXLast:Float = 883;
	
	private static var playerIcon:Point = new Point(404, 98);
	private static inline var attributeX:Float = 566;
	private static inline var valueX:Float = 732;
	private static inline var plusX:Float = 786;
	private static inline var plusLineOffset:Float = 5.5;
	
	private static inline function treeAbX(j:Int):Float
	{
		return (treeAbOffsetX() + 2 * abRadius) * j + treeAbOffsetX() + abRadius + treeBox.x - 2; 
	}
	
	private static inline function treeAbY(i:Int):Float
	{
		return (treeAbOffsetY() + 2 * abRadius) * i + treeAbOffsetY() + abRadius + treeBox.y - 2; 
	}
	
	private static inline function treeAbOffsetX():Float
	{
		var count:Int = 4;//XMLUtils.getGlobal("tree", "width", 1);
		var boxW:Float = new TreeBox().width;
		return (boxW - count * abRadius * 2) / (count + 1);
	}
	
	private static inline function treeAbOffsetY():Float
	{
		var count:Int = 7;//XMLUtils.getGlobal("tree", "height", 1);
		var boxH:Float = new TreeBox().height;
		return (boxH - count * abRadius * 2) / (count + 1);
	}
	
	private static inline function wheelAbX(i:Int):Float
	{
		return wheelAbXFirst + (2 * abRadius + wheelAbXOffset()) * i; 
	}
	
	private static inline function wheelAbXOffset():Float
	{
		return (wheelAbXLast - wheelAbXFirst - 2 * abRadius * 7) / 8; 
	}
	
	private static inline function lineY(n:Int):Float
	{
		if (n == 1)
			return 131.5;
		else if (n == 2)
			return 177.5;
		else if (n == 3)
			return 223.5;
		else if (n == 4)
			return 269.5;
		else 
			return -1;
	}
	
	private inline function exitX():Float
	{
		return stage.width - new CloseAbScreen().width * 2 - 20;
	}
	
	private inline function exitY():Float
	{
		return 40;
	}
	
}