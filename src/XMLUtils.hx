package;
import battle.Unit.ParameterList;
import battle.data.Passives.BattleEvent;
import haxe.xml.Printer;
import roaming.Ability;
import sys.FileSystem;
import sys.io.File;
using StringTools;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function getGlobal<T>(node:String, attribute:String, typeObj:T):Null<T>
	{
		var xml:Xml = fromFile("data\\Globals.xml");
		
		for (n in xml.elementsNamed(node))
			return castNode(n.get(attribute), typeObj);
		
		return null;
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
		var output:Array<ID> = [];
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNode(xml, "zone", "id", zone.getName());
		xml = findNode(xml, "unlocks");
		xml = xml.firstChild();
			
		return [for (id in parseValueArray(xml)) castNode(id, Zone)];
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
	
	public static function parseAbility<T>(ability:ID, param:String, paramType:T):Dynamic
	{
		var xml:Xml = fromFile("data\\Abilities.xml");
		xml = findNode(xml, "ability", "id", ability.getName());
		xml = findNode(xml, param);
		xml = xml.firstChild();
		
		return castNode(xml.nodeValue, paramType);
	}
	
	public static function parseTriggers(object:ID):Array<BattleEvent>
	{
		var output:Array<BattleEvent> = [];
		var xml:Xml;
		
		if (object.getName().substr(0, 4) == "Buff")
			xml = findNode(fromFile("data\\Buffs.xml"), "buff", "id", object.getName());
		else
			xml = findNode(fromFile("data\\Abilities.xml"), "ability", "id", object.getName());
		
		if (xml.elementsNamed("triggers").hasNext())
		{
			xml = findNode(xml, "triggers");
			xml = xml.firstChild();
			
			for (event in parseValueArray(xml))
				output.push(Type.createEnum(BattleEvent, event));
		}
		
		return output;
	}
	
	public static function parseBuff<T>(buff:ID, param:String, paramType:T):T
	{
		var xml:Xml = fromFile("data\\Buffs.xml");
		xml = findNode(xml, "buff", "id", buff.getName());
		xml = findNode(xml, param);
		xml = xml.firstChild();
			
		return castNode(xml.nodeValue, paramType);
	}
	
	public static function parseUnit(unit:ID):ParameterList
	{
		var xml:Xml = fromFile("data\\Units.xml");
		xml = findNode(xml, "unit", "id", unit.getName());
		
		var wheel:Array<ID> = [];
		for (id in parseValueArray(findNode(xml, "wheel").firstChild()))
			wheel.push(ID.createByName(id));
		
		return {
			name:castNode(findNode(xml, "name").firstChild().nodeValue, ""),
			hp:castNode(findNode(xml, "hp").firstChild().nodeValue, 1),
			mana:castNode(findNode(xml, "mana").firstChild().nodeValue, 1),
			strength:castNode(findNode(xml, "strength").firstChild().nodeValue, 1),
			flow:castNode(findNode(xml, "flow").firstChild().nodeValue, 1),
			intellect:castNode(findNode(xml, "intellect").firstChild().nodeValue, 1),
			wheel:wheel
		}
	}
	
	public static function print(xml:Xml):String
	{
		var s:String = Printer.print(xml, true);
		var line:Null<String> = null;
		
		var i:Int = 0;
		for (j in 0...s.length)
		{
			if (i >= s.length)
				break;
			if (s.charAt(i) == "\n")
				if (line == null)
					line = "";
				else
				{
					var newline:String = strip(line);
					i -= line.length - newline.length + 1;
					s = s.replace("\n" + line + "\n", newline);
					line = null;
				}
			else if (line != null)
				if (s.charAt(i) == "<")
					line = null;
				else
					line += s.charAt(i);
			i++;
		}
		while (s.indexOf("\t</") != -1)
			s = s.replace("\t</", "</");
		return s;
	}
	
	private static function strip(s:String):String
	{
		var j:Int = 0;
		for (i in 0...s.length)
		{
			if (j >= s.length)
				break;
			if (s.isSpace(j))
				s = s.substr(0, j) + s.substr(j + 1);
			else
				j++;
		}
		return s;
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
		else if (Std.is(type, Enum))
			return Type.createEnum(cast type, value);
			
		throw "Node casting error: Unknown node type";
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
	
	private static function fromFile(path:String):Xml
	{
		var srcPath:String = Sys.programPath().substring(0, Sys.programPath().indexOf("bin")) + "src\\";
		
		if (FileSystem.exists(srcPath))
			return Xml.parse(File.getContent(srcPath + path));
		else
			throw "Invalid path";
	}
	
}