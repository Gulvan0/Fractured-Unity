package;
import hxassert.Assert;
import roaming.ProgressCoords;
import roaming.Unit;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{

	public static function generateSaveFile(player:Unit, progress:Array<ProgressCoords>):Xml
	{
		
	}
	
	public static function parseSaveFile(xml:Xml) 
	{
		
	}
	
	public static function getGlobal(node:String, attribute:String):String
	{
		var xml:Xml = Xml.parse(File.getContent("data/Globals.xml"));
		var iterator:Iterator<Xml> = xml.elementsNamed(node);
		
		Assert.assert(iterator.hasNext());
		var attribute:String = xml.elementsNamed(node).next().get(attribute);
		Assert.assert(attribute != null);
		
		return attribute;
	}
	
}