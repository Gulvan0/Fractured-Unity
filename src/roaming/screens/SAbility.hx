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
import roaming.Player;
import roaming.Tree;
import roaming.Unit;
import roaming.screens.Canvas.Screen;
using MathUtils;

/**
 * Ability screen. Contains ability tree, ability wheel and attribute box
 * @author Gulvan
 */
class SAbility extends SSprite implements ISAbility
{
	
	private var canvas:ICanvas;
	
	private var treeContainer:TreeContainer;
	private var wheelContainer:WheelContainer;
	private var attribContainer:AttributeContainer;
	private var closeButton:MovieClip;
	
	public function new(canvas:ICanvas) 
	{
		super();
		this.canvas = canvas;
		
		treeContainer = new TreeContainer(this);
		wheelContainer = new WheelContainer(this);
		attribContainer = new AttributeContainer(this);
		closeButton = new CloseAbScreen();
		
		add(new AbilityScreenBG(), 0, 0);
		add(treeContainer, treeCont.x, treeCont.y);
		add(wheelContainer, wheelCont.x, wheelCont.y);
		add(attribContainer, attribCont.x, attribCont.y);
		add(closeButton, exitX(), exitY);
		
		stage.addEventListener(MouseEvent.CLICK, onClick);
	}
	
	public function put(i:Int, j:Int)
	{
		if (Main.player.wheel.length < 8)
		{
			var id:ID = Main.player.tree.get(i, j).id;
							
			for (iID in Main.player.wheel)
				if (id == iID)
					return;
							
			Main.player.wheel.push(id);
			wheelContainer.redrawWheelAb(Main.player.wheel.length);
		}
		else
			trace("Wheel is full, unable to add more abilities");
	}
	
	public function splice(i:Int)
	{
		if (Main.player.wheel.length > i)
		{
			Main.player.wheel.splice(i, 1);
			for (x in i...Main.player.wheel.length + 1)
				wheelContainer.redrawWheelAb(x);
		}
	}
	
	private function onClick(e:MouseEvent)
	{
		var point:Point = new Point(e.stageX, e.stageY);
		
		if (point.inside(closeButton.getRect(this)))
		{
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			canvas.switchTo(Screen.Roaming);
		}
		else if (point.inside(treeContainer.getRect(this)))
			treeContainer.onClick(point.subtract(treeCont));
		else if (point.inside(wheelContainer.getRect(this)))
			wheelContainer.onClick(point.subtract(wheelCont));
		else if (point.inside(attribContainer.getRect(this)))
			attribContainer.onClick(point.subtract(attribCont));
		
	}
	
	//-------------------------------------------------------------------------------
	
	private var treeCont:Point = new Point(50, 50);
	private var wheelCont:Point = new Point(370, 495);
	private var attribCont:Point = new Point(404, 98);
	private var exitY:Float = 40;
	
	private function exitX():Float
	{
		return stage.width - new CloseAbScreen().width * 2 - 20;
	}
	
	public function getAbRadius():Float
	{
		return 18;
	}
	
}