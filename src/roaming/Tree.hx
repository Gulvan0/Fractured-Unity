package roaming;
import hxassert.Assert;
using MathUtils;

class TreeAbility extends Ability
{
	public var i:Int;
	public var j:Int;
	public var requiredJ:Array<Int>;
	public var unlocksJ:Array<Int>;
	
	public function new(ability:Ability, i:Int, j:Int, requiredJ:Array<Int>, unlocksJ:Array<Int>) 
	{
		super(ability.id, ability.maxLvl);
		
		Assert.assert(i.inRange(0, XMLUtils.getGlobal("tree", "height", 1) - 1));
		Assert.assert(j.inRange(0, XMLUtils.getGlobal("tree", "width", 1) - 1));
		
		currentLvl = ability.currentLvl;
		this.i = i;
		this.j = j;
		this.requiredJ = requiredJ;
		this.unlocksJ = unlocksJ;
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
		var unlocks:Array<Int> = [];
		if (i < XMLUtils.getGlobal("tree", "height", 1) - 1)
			for (d in -1...2)
				if ((j+d).inRange(0, XMLUtils.getGlobal("tree", "width", 1) - 1))
					for (dj in reqDeltaJ[i + 1][j + d])
						if (dj == -d) 
							unlocks.push(d);
		
		return new TreeAbility(tree[i][j], i, j, reqDeltaJ[i][j], unlocks);
	}
	
	public function learn(i:Int, j:Int):Bool 
	{
		Assert.assert(i.inRange(0, XMLUtils.getGlobal("tree", "height", 1) - 1));
		Assert.assert(j.inRange(0, XMLUtils.getGlobal("tree", "width", 1) - 1));
		
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