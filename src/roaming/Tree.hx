package roaming;
import hxassert.Assert;
import MathUtils;

class TreeAbility extends Ability
{
	public var i:Int;
	public var j:Int;
	public var requiredJ:Array<Int>;
	
	public function new(ability:Ability, i:Int, j:Int, requiredJ:Array<Int>) 
	{
		super(ability.id, ability.maxLvl);
		
		Assert.assert(MathUtils.inRange(i, 0, XMLUtils.getGlobal("tree", "height", 1) - 1));
		Assert.assert(MathUtils.inRange(j, 0, XMLUtils.getGlobal("tree", "width", 1) - 1));
		
		currentLvl = ability.currentLvl;
		this.i = i;
		this.j = j;
		this.requiredJ = requiredJ;
	}
}

/**
 * A class representing abilityTree. i is a row number, j is a column number
 * @author Gulvan
 */
class Tree
{
	
	private var tree(default, null):Array<Array<Ability>>;
	private var reqDeltaJ(default, null):Array<Array<Array<Int>>>;
	
	public function get(i:Int, j:Int):TreeAbility
	{
		return new TreeAbility(tree[i][j], i, j, reqDeltaJ[i][j]);
	}
	
	public function learn(i:Int, j:Int):Bool 
	{
		Assert.assert(MathUtils.inRange(i, 0, XMLUtils.getGlobal("tree", "height", 1) - 1));
		Assert.assert(MathUtils.inRange(j, 0, XMLUtils.getGlobal("tree", "width", 1) - 1));
		
		for (deltaJ in reqDeltaJ[i][j])
			if (tree[i - 1][j + deltaJ].currentLvl == 0)
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
		reqDeltaJ = XMLUtils.parseTreePaths(element);
	}
	
	public function iterator():Iterator<TreeAbility>
	{
		return new TreeIterator(this);
	}
	
}