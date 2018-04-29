package roaming.screens.components;
import hxassert.Assert;
import openfl.display.MovieClip;
import openfl.display.Shape;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import roaming.Tree.TreeAbility;
using roaming.screens.Utils;
using MathUtils;

/**
 * An ability tree box
 * @author Gulvan
 */
class TreeContainer extends SSprite 
{
	
	private var parentScreen:ISAbility;
	private var abRadius:Float;
	
	private var icons:Array<Array<MovieClip>> = [for (i in 0...XMLUtils.getGlobal("tree", "height", 1)) []];
	private var branches:Array<Array<Array<Shape>>> = [for (i in 0...XMLUtils.getGlobal("tree", "height", 1)) [for (j in 0...XMLUtils.getGlobal("tree", "width", 1)) []]];
	
	public function new(parent:ISAbility) 
	{
		super();
		this.parentScreen = parent;
		abRadius = parentScreen.getAbRadius();
		
		add(new TreeBox(), 0, 0);
		
		for (ability in Main.player.tree)
		{
			trace("drawing icon: " + ability.id);
			branches[ability.i][ability.j] = createBranches(ability);
			for (branch in branches[ability.i][ability.j]) add(branch, treeAbX(ability.j), treeAbY(ability.i));
			
			icons[ability.i][ability.j] = Assets.getBattleAbility(ability.id).squareToRound();
			add(icons[ability.i][ability.j], treeAbX(ability.j), treeAbY(ability.i));
		}
	}
	
	private function createBranches(ab:TreeAbility):Array<Shape>
	{
		var array:Array<Shape> = [];
		
		for (dj in ab.unlocksJ)
		{
			var line:Shape = new Shape();
			line.graphics.lineStyle(5, ab.currentLvl > 0? 0xD5AA02 : 0x6F6A68);
			line.graphics.lineTo(treeAbX(ab.j + dj) - treeAbX(ab.j), treeAbY(ab.i + 1) - treeAbY(ab.i));
			array.push(line);
		}
		
		return array;
	}
	
	public function updateBranches(i:Int, j:Int)
	{
		Assert.assert(i.inRange(0, XMLUtils.getGlobal("tree", "height", 1) - 1));
		Assert.assert(j.inRange(0, XMLUtils.getGlobal("tree", "width", 1) - 1));
		
		var ability:TreeAbility = Main.player.tree.get(i, j);
		
		remove(icons[i][j]);
		for (dj in ability.unlocksJ)
			remove(icons[i + 1][j + dj]);
		for (branch in branches[i][j])
			remove(branch);
			
		branches[i][j] = createBranches(ability);
		
		for (branch in branches[i][j])
			add(branch, treeAbX(ability.j), treeAbY(ability.i));
		for (dj in ability.unlocksJ)
			add(icons[i + 1][j + dj], treeAbX(j + dj), treeAbY(i + 1));
		add(icons[i][j], treeAbX(j), treeAbY(i));
			
	}
	
	public function onClick(localPoint:Point) 
	{
		trace("Tree recieved click");
		var ab:Point = identifyAbility(localPoint);
		if (ab.x == -1)
			return;
			
		parentScreen.put(cast ab.x, cast ab.y);
	}
	
	public function onRightClick(localPoint:Point) 
	{
		trace("Tree recieved right-click");
		var ab:Point = identifyAbility(localPoint);
		if (ab.x == -1)
			return;
			
		parentScreen.learn(cast ab.x, cast ab.y);
	}
	
	private function identifyAbility(localClickPoint:Point):Point
	{
		for (i in Utils.getClickCandidates(function(i) return treeAbY(i) - abRadius, XMLUtils.getGlobal("tree", "height", 1) + 1, localClickPoint.y))
			for (j in Utils.getClickCandidates(function(i) return treeAbX(i) - abRadius, XMLUtils.getGlobal("tree", "width", 1) + 1, localClickPoint.x))
				if (localClickPoint.distance(new Point(treeAbX(j), treeAbY(i))) <= abRadius)
					return new Point(i, j);
		return new Point(-1, -1);
	}
	
	//----------------------------------------------------------------------------------------------------------
	
	private function treeAbX(j:Int):Float
	{
		return (treeAbOffsetX() + 2 * abRadius) * j + treeAbOffsetX() + abRadius; 
	}
	
	private function treeAbY(i:Int):Float
	{
		return (treeAbOffsetY() + 2 * abRadius) * i + treeAbOffsetY() + abRadius; 
	}
	
	private function treeAbOffsetX():Float
	{
		var count:Int = 4;//XMLUtils.getGlobal("tree", "width", 1);
		var boxW:Float = new TreeBox().width;
		return (boxW - count * abRadius * 2) / (count + 1);
	}
	
	private function treeAbOffsetY():Float
	{
		var count:Int = 7;//XMLUtils.getGlobal("tree", "height", 1);
		var boxH:Float = new TreeBox().height;
		return (boxH - count * abRadius * 2) / (count + 1);
	}
	
}