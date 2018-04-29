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
import roaming.enums.Attribute;
import roaming.screens.Canvas.Screen;
import roaming.screens.components.AttributeContainer;
import roaming.screens.components.PointsAndRespec;
import roaming.screens.components.TreeContainer;
import roaming.screens.components.WheelContainer;
using MathUtils;

/**
 * Ability screen. Contains ability tree, ability wheel and attribute box
 * @author Gulvan
 */
class SAbility extends SSprite implements IScreen implements ISAbility
{
	
	private var canvas:ICanvas;
	
	private var treeContainer:TreeContainer;
	private var wheelContainer:WheelContainer;
	private var attribContainer:AttributeContainer;
	private var parContainer:PointsAndRespec;
	private var closeButton:MovieClip;
	
	public function new(canvas:ICanvas) 
	{
		super();
		this.canvas = canvas;
		
		treeContainer = new TreeContainer(this);
		wheelContainer = new WheelContainer(this);
		attribContainer = new AttributeContainer(this);
		parContainer = new PointsAndRespec(this);
		closeButton = new CloseAbScreen();
		
		add(new AbilityScreenBG(), 0, 0);
		add(treeContainer, treeCont.x, treeCont.y);
		add(wheelContainer, wheelCont.x, wheelCont.y);
		add(attribContainer, attribCont.x, attribCont.y);
		add(parContainer, parCont.x, parCont.y);
		add(closeButton, exitX(), exitY);
	}
	
	public function init()
	{
		trace(stage);
		stage.addEventListener(MouseEvent.CLICK, onClick);
		stage.addEventListener(MouseEvent.RIGHT_CLICK, onRightClick);
	}
	
	public function put(i:Int, j:Int)
	{
		var ab:TreeAbility = Main.player.tree.get(i, j);
		trace("putting: " + ab.id.getName() + "(" + i +"; " + j + ")");
		
		if (ab.currentLvl == 0)
		{
			trace("Ability isn't learnt");
			return;
		} 
		if (Main.player.wheel.length == 8)
		{
			trace("Wheel is full, unable to add more abilities");
			return;
		}	
		for (id in Main.player.wheel)
			if (id == ab.id)
			{
				trace("Ability is already on the wheel");
				return;
			}
		
		Main.player.wheel.push(ab.id);
		wheelContainer.redrawWheelAb(Main.player.wheel.length - 1);
	}
	
	public function splice(i:Int)
	{
		if (Main.player.wheel.length > i)
		{
			trace("splicing " + i);
			Main.player.wheel.splice(i, 1);
			for (x in i...Main.player.wheel.length + 1)
				wheelContainer.redrawWheelAb(x);
		}
	}
	
	public function learn(i:Int, j:Int)
	{
		if (Main.player.abilityPoints > 0)
			if (Main.player.tree.learn(i, j))
			{
				Main.player.spendAbPoint();
				treeContainer.updateBranches(i, j);
				parContainer.updateAbpValue();
			}
			else
				trace("You haven't learned abilities required to unlock this ability or it already has maximum level");
		else
			trace("You have no ability points");
	}
	
	public function power(att:Attribute)
	{
		attribContainer.updateValue(att); 
		parContainer.updateAttpValue();
	}
	
	public function respec()
	{
		Main.player.reSpec();
		for (i in 0...8)
			wheelContainer.redrawWheelAb(i);
		for (j in 0...XMLUtils.getGlobal("tree", "width", 1))
			for (i in 0...XMLUtils.getGlobal("tree", "height", 1))
				treeContainer.updateBranches(i, j);
		for (att in Type.allEnums(Attribute))
			attribContainer.updateValue(att);
		parContainer.updateAbpValue();
		parContainer.updateAttpValue();
		trace("Re-spec successful");
	}
	
	private function onClick(e:MouseEvent)
	{
		var point:Point = new Point(e.stageX, e.stageY);
		trace("Click: " + point);
		
		if (point.inside(closeButton.getRect(this)))
		{
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			canvas.switchTo(Screen.Roaming);
		}
		else if (point.inside(wheelContainer.getRect(this)))
			wheelContainer.onClick(point.subtract(wheelCont));
		else if (point.inside(treeContainer.getRect(this)))
			treeContainer.onClick(point.subtract(treeCont));
		else if (point.inside(attribContainer.getRect(this)))
			attribContainer.onClick(point.subtract(attribCont));
		else if (point.inside(parContainer.getRect(this)))
			parContainer.onClick(point.subtract(parCont));
		
	}
	
	private function onRightClick(e:MouseEvent)
	{
		var point:Point = new Point(e.stageX, e.stageY);
		trace("Rightclick: " + point);
		
		if (point.inside(treeContainer.getRect(this)))
			treeContainer.onRightClick(point.subtract(treeCont));
		
	}
	
	//-------------------------------------------------------------------------------
	
	private var treeCont:Point = new Point(50, 50);
	private var wheelCont:Point = new Point(370, 495);
	private var attribCont:Point = new Point(404, 98);
	private var parCont:Point = new Point(380, 360);
	private var exitY:Float = 40;
	
	private function exitX():Float
	{
		return 900 - new CloseAbScreen().width * 2;
	}
	
	public function getAbRadius():Float
	{
		return 18;
	}
	
}