package roaming.components;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hxassert.Assert;
import openfl.display.MovieClip;
import openfl.display.Shape;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import roaming.Tree.TreeAbility;
using MathUtils;

/**
 * An ability tree box
 * @author Gulvan
 */
class TreeContainer extends SSprite 
{
	private var levels:Array<Array<Int>> = [];
	private var icons:SSprite = new SSprite();
	private var branches:SSprite = new SSprite();
	private var contours:SSprite = new SSprite();

	private var branchesIndex:Array<Array<Array<Shape>>> = [for (i in 0...GameRules.treeWidth) [for (j in 0...GameRules.treeHeight) []]];
	private var contoursIndex:Array<Array<DisplayObject>> = [for (i in 0...GameRules.treeWidth) []];
	
	public function new() 
	{
		super();
		levels = [for (i in 0...GameRules.treeWidth) [for (j in 0...GameRules.treeHeight) 0]];
		for (a in Main.player.tree)
			levels[a.i][a.j] = a.level; 

		add(new TreeBox(), 0, 0);
		addChild(branches);
		addChild(icons);
		addChild(contours);
		drawBranches();
		drawIcons();
		drawContours();
	}
	
	private function drawBranches()
	{
		for (ab in Main.player.tree)
			for (di in ab.unlocks)
			{
				var line:Shape = new Shape();
				line.graphics.moveTo(treeAbX(ab.i), treeAbY(ab.j));
				line.graphics.lineStyle(5, ab.level > 0? 0xD5AA02 : 0x6F6A68);
				line.graphics.lineTo(treeAbX(ab.i + di), treeAbY(ab.j + 1));
				branches.addChild(line);
				branchesIndex[ab.i][ab.j].push(line);
			}
	}

	private function drawIcons()
	{
		for (ability in Main.player.tree)
			icons.add(Assets.getRoundAbility(ability.id), treeAbX(ability.i), treeAbY(ability.j));
	}

	private function drawContours()
	{
		for (ab in Main.player.tree)
		{
			var contour:DisplayObject = ab.level > 0? new LearnedAbContour() : new AbSlotContour();
			contoursIndex[ab.i][ab.j] = contour;
			contours.add(contour, treeAbX(ab.i), treeAbY(ab.j));
		}
	}
	
	public function identifyAbility(stageX:Int, stageY:Int):Null<ID>
	{
		var candidateI:Int = -1;
		var candidateJ:Int = -1;
		for (i in 0...GameRules.treeWidth)
			if (treeAbX(i) - stageX <= SAbility.ABILITY_RADIUS)
				candidateI = i;
		for (j in 0...GameRules.treeWidth)
			if (treeAbY(j) - stageY <= SAbility.ABILITY_RADIUS)
				candidateI = j;
		if (candidateI != -1 && candidateJ != -1 && MathUtils.distance(new Point(stageX, stageY), new Point(treeAbX(candidateI), treeAbY(candidateJ))) <= SAbility.ABILITY_RADIUS)
			return Main.player.tree.get(candidateI, candidateJ).id;
		else
			return null;
	}

	public function redraw(levels:Array<Array<Int>>)
	{
		var diff:Array<Point> = findDifferences(this.levels, levels);
		for (d in diff)
		{
			var i:Int = cast d.x;
			var j:Int = cast d.y;
			var ab:TreeAbility = Main.player.tree.get(i, j);
			contours.removeChild(contoursIndex[i][j]);
			for (b in branchesIndex[i][j])
				branches.removeChild(b);
			
			for (dj in ab.unlocks)
			{
				var line:Shape = new Shape();
				line.graphics.lineTo(treeAbX(ab.i), treeAbY(ab.j));
				line.graphics.lineStyle(5, ab.level > 0? 0xD5AA02 : 0x6F6A68);
				line.graphics.lineTo(treeAbX(ab.i + 1), treeAbY(ab.j + dj));
				branches.addChild(line);
				branchesIndex[ab.i][ab.j].push(line);
			}
			contoursIndex[i][j] = ab.level > 0? new LearnedAbContour() : new AbSlotContour();
			contours.addChild(contoursIndex[i][j]);
		}
	}

	private function findDifferences(l1:Array<Array<Int>>, l2:Array<Array<Int>>):Array<Point>
	{
		var a:Array<Point> = [];
		for (i in 0...GameRules.treeWidth)
			for (j in 0...GameRules.treeHeight)
				if (l1[i][j] == 0 && l2[i][j] != 0 || l1[i][j] != 0 && l2[i][j] == 0)
					a.push(new Point(i, j));
		return a;
	}
	
	//----------------------------------------------------------------------------------------------------------
	
	private var BOX_H:Float = 305;

	private function treeAbX(i:Int):Float
	{
		return (0.5 + i) * (treeAbOffsetX() + 2 * SAbility.ABILITY_RADIUS); 
	}
	
	private function treeAbY(j:Int):Float
	{
		return (0.5 + j) * (treeAbOffsetY() + 2 * SAbility.ABILITY_RADIUS);  
	}
	
	private function treeAbOffsetX():Float
	{
		return new TreeBox().width / GameRules.treeWidth - SAbility.ABILITY_RADIUS * 2;
	}
	
	private function treeAbOffsetY():Float
	{
		return BOX_H / GameRules.treeHeight - SAbility.ABILITY_RADIUS * 2;
	}
	
}