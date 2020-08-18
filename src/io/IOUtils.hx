package io;
import ConnectionManager.BHParameterUnit;
import ConnectionManager.BHParameterDetails;
import sys.FileSystem;
import sys.io.File;

using StringTools;

/**
 * @author Gulvan
 */
class IOUtils 
{
	
	public static function retrieveIntVariant(prop:Dynamic, level:Int):Null<Int>
    {
        if (Std.is(prop, Int))
            return prop;
        else if (Std.is(prop, Array))
            return prop[level-1];
        else 
            return null;
    }

    public static function retrieveFloatVariant(prop:Dynamic, level:Int):Null<Float>
    {
        if (Std.is(prop, Float))
            return prop;
        else if (Std.is(prop, Array))
            return prop[level-1];
        else 
            return null;
    }

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

	public static function drain(s:String):String
    {
        var i:Int = 0;
        var ignore:Bool = false;
        while (i < s.length)
        {
            if (s.charAt(i) == "\"")
                ignore = !ignore;
            else if (s.isSpace(i) && !ignore)
            {
                s = s.substring(0, i) + s.substring(i+1, s.length);
                continue;
            }
            i++;
        }
        return s;
    }
	
}