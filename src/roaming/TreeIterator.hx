package roaming;

/**
 * Iterator for Tree class
 * @author Gulvan
 */
typedef TreeAbilityData = {
	id:ID,
	lvl:Int,
	maxLvl:Int,
	requirements:Array<Int>
}
 
class TreeIterator<TreeAbilityData> 
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
		if (j < width)
		{
			return {
				id: tree.getID(i, j),
				lvl: tree.getLvl(i, j),
				maxLvl: tree.getMaxLvl(i, j),
				requirements: tree.getRequirementsDeltaJ(i, j++)
			};
		}
		else
		{
			j = 0;
			return {
				id: tree.getID(i, height),
				lvl: tree.getLvl(i, height),
				maxLvl: tree.getMaxLvl(i, height),
				requirements: tree.getRequirementsDeltaJ(i++, height)
			};
		}
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