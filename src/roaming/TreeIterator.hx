package roaming;
import roaming.Tree.TreeAbility;

/**
 * Iterator for Tree class
 * @author Gulvan
 */
class TreeIterator<TreeAbility>
{

	private var tree:Tree;
	private var width:Int;
	private var height:Int;
	
	private var i:Int;
	private var j:Int;
	
	public function hasNext()
	{
		if (j < width)
			if (i < height)
				return true;
		return false;
	}
	
	public function next()
	{
		if (j == width - 1)
		{
			j = 0;
			return tree.get(i++, width - 1);
		}
		else
			return tree.get(i, j++);
	}
	
	public function new(tree:Tree) 
	{
		this.i = 0;
		this.j = 0;
		
		this.tree = tree;
		this.width = XMLUtils.getGlobal("tree", "width", 1);
		this.height = XMLUtils.getGlobal("tree", "height", 1);
	}
	
}