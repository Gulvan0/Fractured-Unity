package roaming;
import hxassert.Assert;
import MathUtils;
import roaming.TreeIterator.TreeAbilityData;

/**
 * A class representing abilityTree. i is a row number, j is a column number
 * @author Gulvan
 */
class Tree
{
	
	private var tree(default, null):Array<Array<TreeAbility>>;
	private var requirementsDeltaJ(default, null):Array<Array<Array<Int>>>;
	
	public function getID(i:Int, j:Int):ID
	{
		insideAssert();
		return tree[i][j].id;
	}
	
	public function getLvl(i:Int, j:Int):Int
	{
		insideAssert();
		return tree[i][j].currentLvl;
	}
	
	public function getMaxLvl(i:Int, j:Int):Int
	{
		insideAssert();
		return tree[i][j].maxLvl;
	}
	
	public function getRequirementsDeltaJ(i:Int, j:Int):Array<Int>
	{
		insideAssert();
		return requirementsDeltaJ[i][j];
	}
	
	public function learn(i:Int, j:Int):Bool 
	{
		for (deltaJ in getRequirementsDeltaJ(i, j))
			if (getLvl(i - 1, j + deltaJ) == 0)
				return false;
				
		return tree[i][j].learn();
	}
	
	public function reset():Int
	{
		var sum:Int = 0;
		for (row in tree)
			for (ability in row)
				sum += ability.reset();
		return sum;
	}
	
	public function new(element:Element) 
	{
		tree = XMLUtils.parseTree(element);
		requirementsDeltaJ = XMLUtils.parseTreePaths(element);
	}
	
	private function insideAssert()
	{
		var width:Int = XMLUtils.getGlobal("tree", "width", 1);
		var height:Int = XMLUtils.getGlobal("tree", "height", 1);
		Assert.assert(MathUtils.inRange(i, 0, height - 1));
		Assert.assert(MathUtils.inRange(j, 0, width - 1));
	}
	
	public function iterator():Iterator<TreeAbilityData>
	{
		return new TreeIterator(this);
	}
	
}