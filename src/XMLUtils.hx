package;
import roaming.Ability;
import sys.FileSystem;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function getGlobal(rule:String):Dynamic
	{
		var xml:Xml = findNode(fromFile("data\\Globals.xml"), rule);
		var value:String = xml.firstChild().nodeValue;
		var type:String = xml.get("type");
		
		return switch (type)
		{
			case "Int": Std.parseInt(value);
			default: null;
		}
	}
	
	public static function parseTree(element:Element):Array<Array<Ability>>
	{
		var xml:Xml = getTree(element);
		var abilityGrid:Array<Array<Ability>> = [];
		
		if (xml == null)
			return abilityGrid;
		
		for (row in xml.elementsNamed("row"))
		{
			var abilityRow:Array<Ability> = [];
			
			for (ability in row.elementsNamed("ability"))
			{
				var id:ID = ID.createByName(ability.get("id"));
				var maxlvl:Int = Std.parseInt(ability.get("maxlvl"));
				
				abilityRow.push(new Ability(id, maxlvl));
			}
			
			abilityGrid.push(abilityRow);
		}	
		
		return abilityGrid;
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
	
	public static function parseStage(zone:Zone, stage:Int):Array<ID>
	{
		var output:Array<ID> = [];
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNode(xml, "zone", "id", zone.getName());
		xml = findNode(xml, "stage", "number", "" + stage);
		xml = xml.firstChild();
			
		for (enemyID in parseValueArray(xml))
			output.push(Type.createEnum(ID, enemyID));
		
		return output;
	}
	
	public static function nextZones(zone:Zone):Array<Zone>
	{
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNode(xml, "zone", "id", zone.getName());
		xml = findNode(xml, "unlocks");
		xml = xml.firstChild();
			
		return [for (id in parseValueArray(xml)) Type.createEnum(Zone, id)];
	}
	
	public static function stageCount(zone:Zone):Int
	{
		var count:Int = 0;
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNode(xml, "zone", "id", zone.getName());
		for (node in xml.elementsNamed("stage"))
			count++;
			
		return count;
	}
	
	public static function parseAbility<T>(ability:ID, param:String, paramType:Class<T>):T
	{
		var xml:Xml = fromFile("data\\Abilities.xml");
		xml = findNode(xml, "ability", "id", ability.getName());
		xml = findNode(xml, param);
		xml = xml.firstChild();
		
		return castClass(xml.nodeValue, paramType);
	}
	
	public static function parseBuff<T>(buff:ID, param:String, paramType:Class<T>):T
	{
		var xml:Xml = fromFile("data\\Buffs.xml");
		xml = findNode(xml, "buff", "id", buff.getName());
		xml = findNode(xml, param);
		xml = xml.firstChild();
			
		return castClass(xml.nodeValue, paramType);
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
	
	private static function castClass<T>(value:String, type:Class<T>):T
	{ 
		switch (Type.getClassName(type))
		{
			case "String": return cast value;
			case "Int": return cast Std.parseInt(value);
			case "Bool": return cast value == "true";
			case "Float": return cast Std.parseFloat(value);
			default: throw "Node casting error: Unknown node type";
		}
	}
	
	private static function findNode(xml:Xml, nodeName:String, ?keyAtt:String = "", ?keyAttValue:String = ""):Xml
	{
		for (node in xml.elementsNamed(nodeName))
			if (keyAtt == "" || node.get(keyAtt) == keyAttValue)
				return node;
			
		if (keyAtt == "")
			throw "Node not found: " + nodeName;
		else
			throw "Node not found: " + nodeName + " with key attribute " + keyAtt + " = " + keyAttValue;
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
		
		if (stream != "")
			output.push(stream);
		
		return output;
	}
	
	public static function fromFile(path:String):Xml
	{
		var srcPath:String = Main.exePath() + "data\\";
		
		if (FileSystem.exists(srcPath + path))
			return Xml.parse(File.getContent(srcPath + path));
		else
			throw "Invalid path";
	}
	
}