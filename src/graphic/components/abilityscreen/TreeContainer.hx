package graphic.components.abilityscreen;
import struct.Tree.TreeAbility;
import graphic.components.HintTextfield;
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
	public var levels(default, null):Array<Array<Int>> = [];
	private var icons:Sprite = new Sprite();
	private var branches:Sprite = new Sprite();
	private var contours:Sprite = new Sprite();
	private var hint:Null<HintTextfield>;
	private var hintEnabled:Bool = true;

	private var iconsArray:Array<Sprite> = [];
	private var branchesIndex:Array<Array<Array<Shape>>> = [for (i in 0...GameRules.treeWidth) [for (j in 0...GameRules.treeHeight) []]];
	private var contoursIndex:Array<Array<DisplayObject>> = [for (i in 0...GameRules.treeWidth) []];
	
	public function new() 
	{
		super();
		levels = [for (i in 0...GameRules.treeWidth) [for (j in 0...GameRules.treeHeight) 0]];
		for (a in Main.player.tree)
			levels[a.i][a.j] = a.level; 

		this.add(new TreeBox(), 0, 0);
		addChild(branches);
		addChild(icons);
		addChild(contours);
		drawBranches();
		drawIcons();
		drawContours();
	}

	public function init() 
	{
		addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
	}

	public function deInit()
	{
		removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
	}

	public function updateHint()
	{
		if (hint != null)
		{
			removeChild(hint);
			var abCoords:Null<Point> = identifyAbility(hint.x + x, hint.y + y);
			var hintCoords:Point = new Point(hint.x, hint.y);
			if (abCoords != null)
			{
				var ab:TreeAbility = Main.player.tree.get(cast abCoords.x, cast abCoords.y);
				var header:String = ab.name + " (" + levels[ab.i][ab.j] + "/" + ab.maxLvl + ")";
				var text:String = ab.description;
				hint = new HintTextfield(header, text);
				this.add(hint, hintCoords.x, hintCoords.y);
			}
		}
	}

	public function disableHint() 
	{
		hintEnabled = false;
		if (hint != null)
		{
			removeChild(hint);
			hint = null;
		}
	}

	public function enableHint()
	{
		hintEnabled = true;
	}

	private function moveHandler(e:MouseEvent) 
	{
		if (hintEnabled)
		{
			var abCoords:Null<Point> = identifyAbility(e.stageX, e.stageY);
			if (abCoords != null)
				if (hint == null)
				{
					var ab:TreeAbility = Main.player.tree.get(cast abCoords.x, cast abCoords.y);
					var header:String = ab.name + " (" + levels[ab.i][ab.j] + "/" + ab.maxLvl + ")";
					var text:String = ab.description;
					hint = new HintTextfield(header, text);
					this.add(hint, e.stageX - x, e.stageY - y);
				}
				else 
				{
					hint.x = e.stageX - x;
					hint.y = e.stageY - y;
				}
			else if (hint != null)
			{
				removeChild(hint);
				hint = null;
			}
		}
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
	
	public function identifyAbility(stageX:Float, stageY:Float):Null<Point>
	{
		var candidateI:Int = -1;
		var candidateJ:Int = -1;
		for (i in 0...GameRules.treeWidth)
			if (treeAbX(i) - stageX <= SAbility.ABILITY_RADIUS)
				candidateI = i;
		for (j in 0...GameRules.treeHeight)
			if (treeAbY(j) - stageY <= SAbility.ABILITY_RADIUS)
				candidateJ = j;
		if (candidateI != -1 && candidateJ != -1 && MathUtils.distance(new Point(stageX, stageY), new Point(treeAbX(candidateI) + x, treeAbY(candidateJ) + y)) <= SAbility.ABILITY_RADIUS)
			return new Point(candidateI, candidateJ);
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
			
			for (di in ab.unlocks)
			{
				var line:Shape = new Shape();
				line.graphics.moveTo(treeAbX(i), treeAbY(j));
				line.graphics.lineStyle(5, levels[i][j] > 0? 0xD5AA02 : 0x6F6A68);
				line.graphics.lineTo(treeAbX(i + di), treeAbY(j + 1));
				branches.addChild(line);
				branchesIndex[i][j].push(line);
			}
			contoursIndex[i][j] = levels[i][j] > 0? new LearnedAbContour() : new AbSlotContour();
			contours.add(contoursIndex[i][j], treeAbX(i), treeAbY(j));
		}
		this.levels = levels;
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

	public function meetsRequirements(i:Int, j:Int):Bool
	{
		for (dI in Main.player.tree.get(i, j).requires)
			if (levels[i+dI][j-1] == 0)
				return false;
		return true;
	}

	public function isMaxedOut(i:Int, j:Int):Bool
	{
		return Main.player.tree.get(i, j).maxLvl == levels[i][j];
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