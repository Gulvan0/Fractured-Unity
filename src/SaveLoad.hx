package;
import haxe.crypto.Md5;
import haxe.xml.Printer;
import roaming.Player;
import roaming.Unit.RoamUnitParameters;
import roaming.enums.Attribute;
import sys.FileSystem;
import sys.io.File;

/**
 * Utilities for working with savefile
 * @author Gulvan
 */
class SaveLoad 
{

	public static function save(progress:Progress, player:Player)
	{
		var xml:Xml = Xml.createDocument();
		xml.addChild(createProgressNode(progress));
		xml.addChild(createPlayerNode(player));
		
		var checkSum:Xml = Xml.createElement("checksum");
		checkSum.addChild(Xml.createPCData(generateMD5(xml)));
		xml.addChild(checkSum);
		
		File.saveContent(exefolder() + "\\savefile.xml", Printer.print(xml, true));
	}
	
	private static function createProgressNode(progress:Progress):Xml
	{
		var prog:Xml = Xml.createElement("progress");
		for (key in progress.progress.keys())
		{
			var el:Xml = Xml.createElement("zone");
			el.set("id", key.getName());
			el.addChild(Xml.createPCData("" + progress.progress[key].value));
			prog.addChild(el);
		}
		var curr:Xml = Xml.createElement("current");
		curr.addChild(Xml.createPCData(progress.currentZone.getName()));
		prog.addChild(curr);
		
		return prog;
	}
	
	private static function createPlayerNode(player:Player):Xml
	{
		var pl:Xml = Xml.createElement("player");
		var elements:Map<String, String> = [
			"name"=>player.name,
			"element"=>player.element.getName(),
			"xp"=>"" + player.xp.value,
			"level"=>"" + player.level,
			"abp"=>"" + player.abilityPoints,
			"attp"=>"" + player.attributePoints,
			"st"=>"" + player.attribs[Attribute.Strength],
			"fl"=>"" + player.attribs[Attribute.Flow],
			"in"=>"" + player.attribs[Attribute.Intellect]
		];
		
		for (key in elements.keys())
		{
			var el:Xml = Xml.createElement(key);
			el.addChild(Xml.createPCData(elements[key]));
			pl.addChild(el);
		}
		
		return pl;
	}
	
	public static function loadProgress():Progress
	{
		var xml:Null<Xml> = getXml();
		var outputMap:Map<Zone, Int> = new Map<Zone, Int>();
		var currentZone:Zone = Zone.NullSpace;
		
		if (xml == null)
			new Progress([Zone.NullSpace => 1], Zone.NullSpace);
		
		for (p in xml.elementsNamed("progress"))
		{
			for (z in p.elementsNamed("zone"))
			{
				var zoneName:Zone = Type.createEnum(Zone, z.get("id"));
				var zoneStage:Int = Std.parseInt(z.firstChild().nodeValue);
				outputMap[zoneName] = zoneStage;
			}
			for (c in p.elementsNamed("current"))
				currentZone = Type.createEnum(Zone, c.firstChild().nodeValue);
		}
		
		return new Progress(outputMap, currentZone);
	}
	
	public static function loadPlayer():Player
	{
		var xml:Null<Xml> = getXml();
		var name:String;
		var element:Element;
		var params:RoamUnitParameters = new RoamUnitParameters();
		
		if (xml == null)
			return new Player(Element.Lightning, "Zealon");
		
		for (p in xml.elementsNamed("player"))
		{
			for (n in p.elementsNamed("name"))
				name = n.firstChild().nodeValue;
			for (n in p.elementsNamed("element"))
				element = Type.createEnum(Element, n.firstChild().nodeValue);
			for (n in p.elementsNamed("xp"))
				params.xp = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("level"))
				params.level = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("abp"))
				params.abilityPoints = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("attp"))
				params.attributePoints = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("st"))
				params.strength = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("fl"))
				params.flow = Std.parseInt(n.firstChild().nodeValue);
			for (n in p.elementsNamed("in"))
				params.intellect = Std.parseInt(n.firstChild().nodeValue);
		}
		
		return new Player(element, name, params);
	}
	
	private static function getXml():Null<Xml>
	{
		var path:String = exefolder() + "\\savefile.xml";
		if (!FileSystem.exists(path))
			return null;
		
		var xml:Xml = Xml.parse(File.getContent(path));
		if (!checkMD5(xml))
			throw "Corrupted file";
			
		return xml;
	}
	
	private static function generateMD5(xml:Xml):String
	{
		var toEncode:String = "";
		var playerFields:Array<String> = ["name", "element", "xp", "level", "abp", "attp", "st", "fl", "in"];
		for (p in xml.elementsNamed("progress"))
		{
			for (z in p.elementsNamed("zone"))
				toEncode += z.get("id") + "_" + z.firstChild().nodeValue + "-";
			for (c in p.elementsNamed("current"))
				toEncode += c.firstChild().nodeValue + "-";
		}
		for (p in xml.elementsNamed("player"))
			for (fieldName in playerFields)
				for (x in p.elementsNamed(fieldName))
					toEncode += x.firstChild().nodeValue + "-";
		return Md5.encode(toEncode);
	}
	
	private static function checkMD5(xml:Xml):Bool
	{
		for (c in xml.elementsNamed("checksum"))
			if (c.firstChild().nodeValue == generateMD5(xml))
				return true;
		return false;
	}
	
	private static function exefolder():String
	{
		var exepath:String = Sys.programPath();
		return exepath.substring(0, exepath.lastIndexOf("\\"));
	}
	
}