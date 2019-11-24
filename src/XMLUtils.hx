package;
import sys.FileSystem;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function fromFile(path:String):Xml
	{
		var srcPath:String = Main.exePath() + "data\\";
		
		if (FileSystem.exists(srcPath + path))
			return Xml.parse(File.getContent(srcPath + path));
		else
			throw "Invalid path";
	}
	
}