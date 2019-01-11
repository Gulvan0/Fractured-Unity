package;
import graphic.Fonts;
import openfl.display.DisplayObject;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * ...
 * @author gulvan
 */
class LayoutReader 
{
	
	public var xml:Xml;
	public var currentPath:Array<String>;
	
	/**
	 * Should not end with "/" as the attribute element
	 * Only descension avialable; to ascend, use _goto_ before
	 */
	public function get(path:String):Null<String>
	{
		if (path.charAt(path.length - 1) == "/")
			throw "Invalid attribute, unexpected / at the end of a path";
			
		var splitPath:Array<String> = path.split("/");
		
		for (p in currentPath.concat(splitPath))
		{
			if (xml.elementsNamed(p).hasNext())
				return null;
			xml = xml.elementsNamed(p).next();
		}
			
		return xml.firstChild().nodeValue;
	}
	
	/**
	 * ./ - parent element
	 * ../ - root element
	 * Should end with "/" as the container element
	 */
	public function goto(path:String)
	{
		if (path.charAt(path.length - 1) != "/")
			throw "Invalid container, expected / at the end of a path";
		
		path = path.substring(0, path.length - 1);
		var newFullPath:Array<String> = currentPath.copy();
		var p:Array<String> = path.split("/");
		
		if (p[0] == "..")
		{
			newFullPath = [];
			p.splice(0, 1);
		}
		
		while (p[0] == ".")
		{
			if (newFullPath.length == 0)
				throw "Invalid path, attempt to ascend from the root";
			
			p.splice(0, 1);
			newFullPath.pop();
		}
		
		if (Lambda.exists(p, function(a){return a.charAt(0) == "."; }))
			throw "Invalid path, ascension right after descension, reduce the path";
		
		currentPath = newFullPath.concat(p);
	}
	
	public function sumThrough(path:Array<String>, prop:String):Float
	{
		var r:Float = 0;
		
		for (p in path)
		{
			xml = xml.elementsNamed(p).next();
			if (xml.elementsNamed(prop).hasNext())
				r += Std.parseFloat(xml.elementsNamed(prop).next().nodeValue);
		}
		
		return r;
	}
	
	public function dispose(element:DisplayObject, path:String)
	{
		var dataPath:Array<String> = currentPath.concat(path.split("/"));
		element.x = sumThrough(dataPath, "x");
		element.x = sumThrough(dataPath, "y");
	}
	
	public function styleAndDispose(tf:TextField, path:String)
	{
		var argPath:Array<String> = path.split("/");
		var dataPath:Array<String> = currentPath.concat(argPath);
		tf.x = sumThrough(dataPath, "x");
		tf.y = sumThrough(dataPath, "y");
		
		goto(path);
		tf.setTextFormat(new TextFormat(Fonts.get(get("font")), Std.parseInt(get("size")), Std.parseInt(get("color"))));
		for (i in 0...argPath.length) goto("./");
	}
	
	public function new(file:String) 
	{
		xml = XMLUtils.fromFile(file);
	}
	
}