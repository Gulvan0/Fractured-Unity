package;
import graphic.Fonts;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

typedef Screen = {map:Map<String, DisplayObject>, cont:DisplayObjectContainer};

/**
 * Parser for screen layouts
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
	public function get(path:String, ?strict:Bool = true):Null<String>
	{
		if (path.charAt(path.length - 1) == "/")
			throw "Invalid attribute, unexpected / at the end of a path";
			
		var splitPath:Array<String> = path.split("/");
		var x:Xml = xml;
		for (p in currentPath.concat(splitPath))
		{
			if (!x.elementsNamed(p).hasNext())
				if (strict)
					throw 'Invalid path: $path - $p not found';
				else
					return null;
			x = x.elementsNamed(p).next();
		}
		
		return x.firstChild().nodeValue;
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
		var source:Xml = xml;
		for (p in path)
		{
			xml = xml.elementsNamed(p).next();
			if (xml.elementsNamed(prop).hasNext())
				r += Std.parseFloat(xml.elementsNamed(prop).next().firstChild().nodeValue);
		}
		xml = source;
		//trace(path, prop, r);
		return r;
	}
	
	public function dispose(element:DisplayObject, path:String, ?nestingLevel:Int = 1):DisplayObject
	{
		var dataPath:Array<String> = currentPath.concat(path.split("/"));
		element.x = sumThrough(dataPath, "x") - sumThrough(dataPath.slice(0, -nestingLevel), "x");
		element.y = sumThrough(dataPath, "y") - sumThrough(dataPath.slice(0, -nestingLevel), "y");
		trace(path + ' disposed at ${element.x}, ${element.y}');
		return element;
	}
	
	public function createTF(path:String):TextField
	{
		var tf:TextField = new TextField();
		var argPath:Array<String> = path.split("/");
		var dataPath:Array<String> = currentPath.concat(argPath);
		
		goto(path + "/");
		tf.setTextFormat(new TextFormat(Fonts.get(get("font")), Std.parseInt(get("size")), Std.parseInt(get("color", false))));
		for (i in 0...argPath.length) goto("./");
		
		return tf;
	}
	
	public function generate(map:Map<String, DisplayObject>):Screen
	{
		return f(xml, map, "");
	}
	
	private function f(xml:Xml, map:Map<String, DisplayObject>, dirPath:String):Screen
	{
		var s:Sprite = new Sprite();
		var newMap:Map<String, DisplayObject> = new Map();
		
		for (x in xml.elements())
		{
			if (!x.exists("instance"))
				continue;
				
			var path:String = (dirPath == ""? "" : dirPath + "/") + x.nodeName;
			trace(path);
			var inst:String = x.get("instance");
			var element:DisplayObject = new Sprite();
			switch (inst)
			{
				case "container":
					var scr:Screen = f(x, map, path);
					for (k in scr.map.keys())
						newMap[k] = scr.map[k];
					element = scr.cont;
				case "textfield":
					element = createTF(path);
				case "progressbar":
					trace("Not implemented");
				default:
					if (inst.substring(0, 2) == "m:")
						element = map[inst.substring(2)];
					else
						element = openfl.Assets.getMovieClip("mainlib:" + inst);
			}
			
			s.addChild(dispose(element, path));
			newMap[path] = element;
		}
		
		return {cont: s, map: newMap};
	}
	
	public function new(file:String) 
	{
		xml = XMLUtils.fromFile(file);
		currentPath = [];
	}
	
}