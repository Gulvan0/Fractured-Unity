package graphic.components.abilityscreen;
import ID.AbilityID;
import graphic.components.hints.AbilityHint.AbilityHintType;
import struct.Element;
import io.AbilityParser;
import openfl.events.MouseEvent;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import hxassert.Assert;
import openfl.display.MovieClip;
import openfl.display.Shape;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * An ability tree box
 * @author Gulvan
 */
class TreeContainer extends Sprite 
{
	private var icons:Sprite = new Sprite();
	private var branches:Sprite = new Sprite();
	private var contours:Sprite = new Sprite();

	private var branchesIndex:Array<Array<Array<Sprite>>> = [for (i in 0...GameRules.treeHeight) [for (j in 0...GameRules.treeWidth) []]];
	private var contoursIndex:Array<Array<DisplayObject>> = [for (i in 0...GameRules.treeHeight) []];

	private var unlockCache:Array<Array<Array<Int>>> = [for (i in 0...GameRules.treeHeight) [for (j in 0...GameRules.treeWidth) []]];

	public function new() 
	{
		super();

		dispose();
		buildUnlockCache();
		draw();
	}

	public function redraw() 
	{
		removeChildren();
		branches = new Sprite();
		icons = new Sprite();
		contours = new Sprite();
		branchesIndex = [for (i in 0...GameRules.treeHeight) [for (j in 0...GameRules.treeWidth) []]];
		contoursIndex = [for (i in 0...GameRules.treeHeight) []];
		dispose();
		draw();
	}

	private function dispose()
	{
		addChild(new TreeBox());
		addChild(branches);
		addChild(icons);
		addChild(contours);
	}

	private function buildUnlockCache()
	{
		var element:Element = Element.createByName(Main.player.character.element);
		var tree = AbilityParser.trees.get(element);
		for (i in 0...GameRules.treeHeight)
			for (j in 0...GameRules.treeWidth)
				for (char in tree[i][j].requires.split(""))
					if (char == "l")
						unlockCache[i-1][j-1].push(1);
					else if (char == "c")
						unlockCache[i-1][j].push(0);
					else if (char == "r")
						unlockCache[i-1][j+1].push(-1);
	}
	
	private function draw()
	{
		var levels = Main.player.character.tree;
		var element:Element = Element.createByName(Main.player.character.element);
		var tree = AbilityParser.trees.get(element);
		for (i in 0...GameRules.treeHeight)
			for (j in 0...GameRules.treeWidth)
			{
				var level = levels[i][j];
				drawBranches(i, j, level);
				icons.add(Assets.getRoundAbility(AbilityID.createByName(tree[i][j].id), true, Roaming, level), treeAbX(j), treeAbY(i));
				drawContour(i, j, level);
			}
	}

	private function drawBranches(i:Int, j:Int, level:Int)
	{
		for (dj in unlockCache[i][j])
		{
			var color = level > 0? 0xD5AA02 : 0x333333;
			var line = Shapes.line(treeAbX(j + dj), treeAbY(i + 1), color, 5, treeAbX(j), treeAbY(i));
			branches.addChild(line);
			branchesIndex[i][j].push(line);
		}
	}

	private function drawContour(i:Int, j:Int, level:Int)
	{
		var contour:DisplayObject = level > 0? new LearnedAbContour() : new AbSlotContour();
		contoursIndex[i][j] = contour;
		contours.add(contour, treeAbX(j), treeAbY(i));
	}
	
	public function identifyAbility(stageX:Float, stageY:Float):Null<TreePos>
	{
		var candidateI:Int = -1;
		var candidateJ:Int = -1;
		for (j in 0...GameRules.treeWidth)
			if (treeAbX(j) - stageX <= SAbility.ABILITY_RADIUS)
				candidateJ = j;
		for (i in 0...GameRules.treeHeight)
			if (treeAbY(i) - stageY <= SAbility.ABILITY_RADIUS)
				candidateI = i;
		if (candidateI != -1 && candidateJ != -1 && MathUtils.distance(new Point(stageX, stageY), new Point(treeAbX(candidateJ) + x, treeAbY(candidateI) + y)) <= SAbility.ABILITY_RADIUS)
			return {i:candidateI, j:candidateJ};
		else
			return null;
	}

	public function redrawAbility(i:Int, j:Int, newLevel:Int)
	{
		contours.removeChild(contoursIndex[i][j]);
		for (b in branchesIndex[i][j])
			branches.removeChild(b);
		branchesIndex[i][j] = [];

		var element:Element = Element.createByName(Main.player.character.element);
		var tree = AbilityParser.trees.get(element);
		var id = AbilityID.createByName(tree[i][j].id);
		
		if (i != GameRules.treeHeight - 1)
			drawBranches(i, j, newLevel);
		icons.add(Assets.getRoundAbility(id, true, Roaming, newLevel), treeAbX(j), treeAbY(i));
		drawContour(i, j, newLevel);
	}
	
	//----------------------------------------------------------------------------------------------------------
	
	private var BOX_H:Float = 710;

	private function treeAbX(j:Int):Float
	{
		return (0.5 + j) * (treeAbOffsetX() + 2 * SAbility.ABILITY_RADIUS); 
	}
	
	private function treeAbY(i:Int):Float
	{
		return (0.5 + i) * (treeAbOffsetY() + 2 * SAbility.ABILITY_RADIUS);  
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