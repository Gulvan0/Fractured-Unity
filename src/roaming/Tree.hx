package roaming;
import hxassert.Assert;
import MathUtils;

/**
 * ...
 * @author Gulvan
 */
class Tree
{
	
	private var tree:Array<Array<TreeAbility>>;
	
	public function getID(i:Int, j:Int):String
	{
		Assert.assert(MathUtils.inRange(i, 0, 6));
		Assert.assert(MathUtils.inRange(i, 0, 3));
		
		return tree[i][j].id;
	}
	
	public function learn(i:Int, j:Int):Bool 
	{
		
	}
	
	public function new() 
	{
		tree = new Array<Array<TreeAbility>>();
	}
	
}