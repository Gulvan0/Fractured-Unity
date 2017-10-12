package roaming;
import hxassert.Assert;
import MathUtils;

/**
 * A class representing abilityTree. i is a row number, j is a column number
 * @author Gulvan
 */
class Tree
{
	
	private var tree(default, never):Array<Array<TreeAbility>>;
	private var requirementsDeltaJ(default, never):Array<Array<Array<Int>>>;
	
	public function getID(i:Int, j:Int):String
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
		tree = new Array<Array<TreeAbility>>();
		requirementsDeltaJ = new Array<Array<Array<Int>>>();
	}
	
	private function insideAssert()
	{
		var width:Int = cast XMLUtils.getGlobal("tree", "width");
		var height:Int = cast XMLUtils.getGlobal("tree", "height");
		Assert.assert(MathUtils.inRange(i, 0, height - 1));
		Assert.assert(MathUtils.inRange(j, 0, width - 1));
	}
	
}