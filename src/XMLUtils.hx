package;
import ConnectionManager.BHParameterUnit;
import ConnectionManager.BHParameterDetails;
import sys.FileSystem;
import sys.io.File;

/**
 * Provides static functions that parse various types of XML used in game
 * @author Gulvan
 */
class XMLUtils 
{
	
	public static function getParameterDetails(id:ID):Array<BHParameterDetails>
    {
        var result:Array<BHParameterDetails> = [];

		var xml:Xml = fromFile("data\\Abilities.xml");
		xml = findNode(xml, "ability", "id", id.getName());
		xml = findNode(xml, "parameters");

        for (param in xml.elementsNamed("param"))
            if (param.get("type") == "a")
            {
                var unit:BHParameterUnit;
                for (u in param.elementsNamed("unit"))
                {
                    unit = BHParameterUnit.createByName(u.firstChild().nodeValue);
                    break;
                }
                var from:Float;
                for (f in param.elementsNamed("from"))
                {
                    from = Std.parseFloat(f.firstChild().nodeValue);
                    break;
                }
                var to:Float;
                for (t in param.elementsNamed("to"))
                {
                    to = Std.parseFloat(t.firstChild().nodeValue);
                    break;
                }
                result.push({name: param.get("name"), unit: unit, from: from, to: to});
            }
        return result;
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

	public static function fromFile(path:String):Xml
	{
		var srcPath:String = Main.exePath() + "data\\";
		
		if (FileSystem.exists(srcPath + path))
			return Xml.parse(File.getContent(srcPath + path));
		else
			throw "Invalid path";
	}
	
}