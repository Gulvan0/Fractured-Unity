package;
import haxe.crypto.Md5;
import haxe.xml.Printer;
import Player;
import roaming.Unit.RoamUnitParameters;
import roaming.enums.Attribute;
import sys.FileSystem;
import sys.io.File;
using StringTools;

/**
 * Utilities for working with savefile
 * @author Gulvan
 */
class SaveLoad 
{

	private static var playerFields:Array<String> = ["name", "element", "xp", "level", "abp", "attp", "st", "fl", "in"];
	
	public static function loadRating(xml:Xml):Int
	{
		for (r in xml.elementsNamed("rating"))
			return Std.parseInt(r.firstChild().nodeValue);
		throw "Rating not found";
	}

	public static function loadProgress(xml:Xml):Progress
	{
		var outputMap:Map<Zone, Int> = new Map<Zone, Int>();
		var currentZone:Zone = Zone.NullSpace;
		
		for (p in xml.elementsNamed("progress"))
		{
			for (z in p.elementsNamed("zone"))
			{
				var zoneName:Zone = Type.createEnum(Zone, z.get("id"));
				var zoneStage:Int = Std.parseInt(z.firstChild().nodeValue);
				outputMap[zoneName] = zoneStage;
			}
			for (c in p.elementsNamed("current"))
				currentZone = Type.createEnum(Zone, strip(c.firstChild().nodeValue));
		}
		
		return new Progress(outputMap, currentZone);
	}
	
	public static function loadPlayer(login:String, xml:Xml):Player
	{	
		var name:String;
		var element:Element;
		var params:RoamUnitParameters = new RoamUnitParameters();
		
		for (p in xml.elementsNamed("player"))
		{
			for (n in p.elementsNamed("name"))
				name = strip(n.firstChild().nodeValue);
			for (n in p.elementsNamed("element"))
				element = Type.createEnum(Element, strip(n.firstChild().nodeValue));
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
		
		return new Player(element, login, name, params);
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
	
}