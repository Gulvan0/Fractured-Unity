package roaming.screens;
import openfl.display.MovieClip;
import openfl.geom.Point;
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
	
	public function new(parent:ISAbility) 
	{
		super();
		this.parentScreen = parent;
		abRadius = parent.getAbRadius();
		
		add(new TreeBox(), 0, 0);
		
		for (ability in Main.player.tree)
			add(Assets.getBattleAbility(ability.id).squareToRound(), treeAbX(ability.j), treeAbY(ability.i));
	}
	
	public function onClick(localPoint:Point) 
	{
		for (i in Utils.getClickCandidates(treeAbY, XMLUtils.getGlobal("tree", "height", 1), localPoint.y))
			for (j in Utils.getClickCandidates(treeAbX, XMLUtils.getGlobal("tree", "width", 1), localPoint.x))
				if (localPoint.getDistance(new Point(treeAbX(j), treeAbY(i))) <= abRadius)
				{
					parentScreen.put(i, j);
					return;
				}
	}
	
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