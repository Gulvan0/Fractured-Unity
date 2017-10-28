package;
import battle.Unit.ParameterList;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import haxe.xml.Parser;
import hxassert.Assert;
import roaming.ProgressCoords;
import roaming.Tree;
import roaming.TreeAbility;
import roaming.Unit;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function getGlobal(node:String, attribute:String):Null<String>
	{
		var xml:Xml = fromFile("data\\Globals.xml");
		
		for (n in xml.elementsNamed(node))
			return n.get(attribute);
		
		return null;
	}
	
	public static function parseTree(element:Element):Array<Array<TreeAbility>>
	{
		var xml:Xml = getTree(element);
		var tree:Array<Array<TreeAbility>> = [];
		
		if (xml == null)
			return tree;
		
		for (row in xml.elementsNamed("row"))
		{
			var a:Array<TreeAbility> = [];
			for (ability in row.elementsNamed("ability"))
			{
				var id:String = ability.get("id");
				var maxlvl:Int = Std.parseInt(ability.get("maxlvl"));
				a.push(new TreeAbility(id, maxlvl));
			}
			tree.push(a);
		}	
		
		return tree;
	}
	
	public static function parseTreePaths(element:Element):Array<Array<Array<Int>>>
	{
		var xml:Null<Xml> = getTree(element);
		var requirements:Array<Array<Array<Int>>> = [];
		
		if (xml == null)
			return requirements;
		
		for (row in xml.elementsNamed("row"))
		{
			var a:Array<Array<Int>> = [];
			for (ability in row.elementsNamed("ability"))
			{
				var reqStr:String = ability.get("requires");
				var reqAr:Array<Int> = [];
				
				if (reqStr.charAt(0) == '1')
					reqAr.push(-1);
				if (reqStr.charAt(1) == '1')
					reqAr.push(0);
				if (reqStr.charAt(2) == '1')
					reqAr.push(1);
				
				a.push(reqAr);
			}
			requirements.push(a);
		}
		
		return requirements;
	}
	
	public static function parseStage(zone:Int, stage:Int):Array<ID>
	{
		var output:Array<ID> = [];
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNodeByAtt(xml, "zone", "number", ""+zone);
		xml = findNodeByAtt(xml, "stage", "number", ""+stage);
			
		for (enemyID in parseValueArray(xml))
			output.push(Type.createEnum(ID, enemyID));
		
		return output;
	}
	
	public static function parseAbility<T>(ability:ID, param:String, paramType:T):T
	{
		var xml:Xml = fromFile("data\\Abilities.xml");
		xml = findNodeByAtt(xml, "ability", "id", ability.getName());
			
		for (iparam in xml.elementsNamed(param))
			return castNode(iparam.nodeValue, paramType);
	}
	
	public static function parseBuff<T>(buff:ID, param:String, paramType:T):T
	{
		var xml:Xml = fromFile("data\\Buffs.xml");
		xml = findNodeByAtt(xml, "buff", "id", buff.getName());
			
		return castNode(findNodeByName(xml, param).nodeValue, paramType);
	}
	
	public static function parseUnit(unit:ID):ParameterList
	{
		var xml:Xml = fromFile("data\\Units.xml");
		xml = findNodeByAtt(xml, "unit", "id", unit.getName());
		
		return {
			name:findNodeByName(xml, "name"),
			hp:findNodeByName(xml, "hp"),
			mana:findNodeByName(xml, "mana"),
			strength:findNodeByName(xml, "strength"),
			flow:findNodeByName(xml, "flow"),
			intellect:findNodeByName(xml, "intellect"),
			wheel:parseValueArray(findNodeByName(xml, "wheel"))
		}
	}
	
	//================================================================================
    // PRIVATE
    //================================================================================	
	
	private static function getTree(element:Element):Null<Xml>
	{
		switch (element)
		{
			case Element.Lightning:
				return fromFile("data\\LightningTree.xml");
			default:
				return null;
		}
	}
	
	private static function castNode<T>(value:Dynamic, type:T):Dynamic
	{
		if (Std.is(type, String))
			return value;
		else if (Std.is(type, Int))
			return Std.parseInt(value);
		else if (Std.is(type, Bool))
			return value == "true";
		else if (Std.is(type, Float))
			return Std.parseFloat(value);
		else if (Std.is(type, AbilityTarget))
			return Type.createEnum(AbilityTarget, value);
		else if (Std.is(type, AbilityType))
			return Type.createEnum(AbilityType, value);
		else if (Std.is(type, Element))
			return Type.createEnum(Element, value);
	}
	
	private static function findNodeByAtt(xml:Xml, nodeName:String, keyAtt:String, keyAttValue:String):Xml
	{
		var output:Xml;
		
		for (node in xml.elementsNamed(nodeName))
			if (node.get(keyAtt) == keyAttValue)
				output = node;
				
		return output;
	}
	
	private static function findNodeByName(xml:Xml, nodeName:String):Xml
	{
		for (node in xml.elementsNamed(nodeName))
			return node;
	}
	
	private static function parseValueArray(node:Xml):Array<String>
	{
		var output:Array<String> = [];
		var stream:String = "";
		
		for (i in 0...node.nodeValue.length)
		{
			var char:String = node.nodeValue.charAt(i);
			if (char != " ")
				if (char != ",")
					stream += char;
				else
				{
					output.push(stream);
					stream = "";
				}
		}
	}
	
	private static function fromFile(path:String):Xml
	{
		var file:String = File.getContent("C:\\Users\\mitmi\\Documents\\GitHub\\Fractured-Unity\\src\\" + path);
		
		return Xml.parse(file);
	}
	
}