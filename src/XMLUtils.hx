package;
import battle.Unit.ParameterList;
import battle.data.Passives.BattleEvent;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.enums.PassiveType;
import battle.enums.StrikeType;
import haxe.xml.Parser;
import hxassert.Assert;
import roaming.struct.Progress;
import roaming.Tree;
import roaming.Ability;
import roaming.Unit;
import sys.FileSystem;
import sys.io.File;

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
	
	public static function parseStage(zone:Int, stage:Int):Array<ID>
	{
		var output:Array<ID> = [];
		var xml:Xml = fromFile("data\\Stages.xml");
		
		xml = findNode(xml, "zone", "number", "" + zone);
		xml = findNode(xml, "stage", "number", "" + stage);
		xml = xml.firstChild();
			
		for (enemyID in parseValueArray(xml))
			output.push(Type.createEnum(ID, enemyID));
		
		return output;
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
		var xml:Xml = fromFile("data\\Abilities.xml");
		
		if (object.getName().substr(0, 4) == "Buff")
			xml = findNode(xml, "buff", "id", object.getName());
		else
			xml = findNode(xml, "ability", "id", object.getName());
		
		if (xml.elementsNamed("triggers") != [])
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
		else if (Std.is(type, StrikeType))
			return Type.createEnum(StrikeType, value);
		else if (Std.is(type, PassiveType))
			return Type.createEnum(PassiveType, value);
		else if (Std.is(type, Element))
			return Type.createEnum(Element, value);
			
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
		
		output.push(stream);
		
		return output;
	}
	
	private static function fromFile(path:String):Xml
	{
		var srcPath1:String = "C:\\Users\\mitmi\\Documents\\GitHub\\Fractured-Unity\\src\\";
		var srcPath2:String = "C:\\Users\\Алексей\\Documents\\GitHub\\Fractured-Unity\\src\\";
		
		if (FileSystem.exists(srcPath1))
			return Xml.parse(File.getContent(srcPath1 + path));
		else if (FileSystem.exists(srcPath2))
			return Xml.parse(File.getContent(srcPath2 + path));
		else
			throw "Invalid path";
	}
	
}