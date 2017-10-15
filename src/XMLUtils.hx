package;
import haxe.xml.Parser;
import hxassert.Assert;
import roaming.ProgressCoords;
import roaming.TreeAbility;
import roaming.Unit;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function getGlobal(node:String, attribute:String):String
	{
		var xml:Xml = fromFile("data\\Globals.xml");
		var iterator:Iterator<Xml> = xml.elementsNamed(node);
		
		Assert.assert(iterator.hasNext());
		var attribute:String = xml.elementsNamed(node).next().get(attribute);
		Assert.assert(attribute != null);
		
		return attribute;
	}
	
	public static function parseTree(element:Element):Array<Array<TreeAbility>>
	{
		var xml:Xml;
		var tree:Array<Array<TreeAbility>> = new Array<Array<TreeAbility>>();
		
		switch (element)
		{
			case Element.Lightning:
				xml = fromFile("data\\LightningTree.xml");
			default:
				return tree;
		}
		
		//...........
		
		return tree;
	}
	
	public static function parseTreePaths(element:Element):Array<Array<Array<Int>>>
	{
		var xml:Xml;
		var requirements:Array<Array<Array<Int>>> = new Array<Array<Array<Int>>>();
		
		switch (element)
		{
			case Element.Lightning:
				xml = fromFile("data\\LightningTree.xml");
			default:
				return requirements;
		}
		
		//...........
		
		return requirements;
	}
	
	private static function fromFile(path:String):Xml
	{
		var xml:Xml = Xml.createDocument();
		var file:String = File.getContent("C:\\Users\\mitmi\\Documents\\GitHub\\Fractured-Unity\\src\\" + path);
		trace(file);
		try
		{
			xml = Xml.parse(file);
		}
		catch (e: XmlParserException)
		{
			trace(e.message);
			trace(e.xml);
			trace(e.position);
		}
		trace("a");
		return xml;
	}
	
}