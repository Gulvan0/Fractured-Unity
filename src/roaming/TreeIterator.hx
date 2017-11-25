package roaming;

/**
 * ...
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
	private var i:Int;
	private var j:Int;
	
	public function hasNext()
	{
		if (j < XMLUtils.getGlobal("tree", "width", 1))
			if (i < XMLUtils.getGlobal("tree", "height", 1))
				return true;
		return false;
	}
	
	public function next()
	{
		if (j < XMLUtils.getGlobal("tree", "width", 1))
		{
			var oldI:Int = i;
			var oldJ:Int = j;
			j++;
			
			return {
				id: tree.getID(oldI, oldJ),
				lvl: tree.getLvl(oldI, oldJ),
				maxLvl: tree.getMaxLvl(oldI, oldJ),
				requirements: tree.getRequirementsDeltaJ(oldI, oldJ)
			};
		}
		else
		{
			var oldI:Int = i;
			var oldJ:Int = j;
			i++;
			j = 0;
			
			return {
				id: tree.getID(oldI, oldJ),
				lvl: tree.getLvl(oldI, oldJ),
				maxLvl: tree.getMaxLvl(oldI, oldJ),
				requirements: tree.getRequirementsDeltaJ(oldI, oldJ)
			};
		}
	}
	
	public function new(tree:Tree) 
	{
		this.i = 0;
		this.j = 0;
		this.tree = tree;
	}
	
}