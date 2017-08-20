package;
import hxassert.Assert;
import utils.MathUtils;

/**
 * ...
 * @author Gulvan
 */
class Tree
{
	
	private var tree:Array<Array<TreeAbility>>;
	
	public function getID(i:Int, j:Int):String
	{
		Assert.require(MathUtils.inRange(i, 0, 6));
		Assert.require(MathUtils.inRange(i, 0, 3));
		
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