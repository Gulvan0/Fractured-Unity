package io;
import ConnectionManager.BHParameterUnit;
import ConnectionManager.BHParameterDetails;
import sys.FileSystem;
import sys.io.File;

/**
 * @author Gulvan
 */
class IOUtils 
{
    
	public static function xmlFromFile(path:String):Xml
	{
		return Xml.parse(fileContent(path));
	}

	public static function jsonFromFile(path:String):Dynamic
	{
		return haxe.Json.parse(fileContent(path));
	}

	public static function fileContent(path:String):String
	{
		var p:String = Main.exePath() + "data\\" + path;
		if (FileSystem.exists(p))
			return File.getContent(p);
		else
			throw "Invalid path";
	}
	
}