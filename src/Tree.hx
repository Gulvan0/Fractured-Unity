package;
import hxassert.Assert;
using MathUtils;

class TreeAbility
{
	public var i:Int;
	public var j:Int;

	public var id:ID;
	public var name:String;
	public var description:String;
	public var maxLvl:Int;
	public var requires:Array<Int>;
	public var unlocks:Array<Int>;

	public var level:Int;
	public function new()
	{

	}
}

class TreeIterator
{
	private var a:Array<Array<TreeAbility>>;
	private var i:Int;
	private var j:Int;

	public function hasNext():Bool
	{
		return j < GameRules.treeHeight;
	}

	public function next():TreeAbility
	{
		if (i == GameRules.treeWidth - 1)
		{
			i = 0;
			return a[j++][GameRules.treeWidth - 1];
		}
		else
			return a[j][i++];
	}

	public function new(a:Array<Array<TreeAbility>>) 
	{
		this.a = a;
		i = 0;
		j = 0;
	}
}

/**
 * A class that represents ability tree
 * @author Gulvan
 */
class Tree
{
	private var array(default, null):Array<Array<TreeAbility>>;
	
	public function get(i:Int, j:Int):TreeAbility
	{
		return array[j][i];
	}

	private static function parseTree(element:Element):Array<Array<TreeAbility>>
	{
		var treeInfo:Xml = XMLUtils.fromFile("data\\" + element.getName() + "Tree.xml");
		var abilityGrid:Array<Array<TreeAbility>> = [];
		for (row in treeInfo.elementsNamed("row"))
		{
			var abilityRow:Array<TreeAbility> = [];
			for (ability in row.elementsNamed("ability"))
			{
				var ab:TreeAbility = new TreeAbility();
				ab.i = abilityRow.length;
				ab.j = abilityGrid.length;
				ab.id = ID.createByName(ability.get("id"));
				ab.maxLvl = Std.parseInt(ability.get("maxlvl"));
				ab.requires = [for (i in 0...3) if (ability.get("requires").charAt(i) == '1') i-1];
				ab.unlocks = [];
				ab = complementAbility(ab);
				abilityRow.push(ab);
			}
			abilityGrid.push(abilityRow);
		}

		for (j in 1...GameRules.treeHeight)	
			for (i in 0...GameRules.treeWidth)
				for (dI in abilityGrid[j][i].requires)
					abilityGrid[j - 1][i + dI].unlocks.push(-dI);
		return abilityGrid;
	}

	public static function complementAbility(ab:TreeAbility):TreeAbility
	{
		var abilitiesInfo:Xml = XMLUtils.fromFile("data\\Abilities.xml");
		for (node in abilitiesInfo.elementsNamed("ability"))
			if (node.get("id") == ab.id.getName())
			{
				for (node2 in node.elementsNamed("name"))
				{
					ab.name = node2.firstChild().nodeValue;
					break;
				}
				for (node2 in node.elementsNamed("description"))
				{
					ab.description = node2.firstChild().nodeValue;
					break;
				}
				return ab;
			}
		throw "Not found";
	}

	public function new(element:Element, levels:Array<Array<Int>>) 
	{
		array = parseTree(element);
		for (i in 0...GameRules.treeWidth)
			for (j in 0...GameRules.treeHeight)
				array[j][i].level = levels[i][j];
	}

	public function iterator():Iterator<TreeAbility>
	{
		return new TreeIterator(array);
	}
	
}