package roaming;
import hxassert.Assert;
import MathUtils;

class TreeAbility extends Ability
{
	public var i:Int;
	public var j:Int;
	public var requiredJ:Array<Int>
	
	public function new(id:ID, maxLvl:Int) 
	{
		super(id, maxLvl);
	}
}

/**
 * A class representing abilityTree. i is a row number, j is a column number
 * @author Gulvan
 */
class Tree
{
	
	private var tree(default, null):Array<Array<Ability>>;
	private var requirementsDeltaJ(default, null):Array<Array<Array<Int>>>;
	
	public function get(i:Int, j:Int):TreeAbility
	{
		insideAssert();
		
		var ab:TreeAbility = tree[i][j];
		ab.i = i;
		ab.j = j;
		ab.requiredJ = requirementsDeltaJ[i][j];
		
		return ab;
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
	
	public function iterator():Iterator<TreeAbility>
	{
		return new TreeIterator(this);
	}
	
}