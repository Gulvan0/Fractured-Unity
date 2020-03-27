package;

import sys.io.File;

class WorldMap
{
    public static function stageCount(z:Zone):Int
    {
        for (e in Xml.parse(File.getContent(Main.exePath() + "data\\data\\ZoneMap.xml")).elementsNamed("zone"))
            if (e.get("id") == z.getName())
                for (el in e.elementsNamed("length"))
                    return Std.parseInt(el.firstChild().nodeValue);
        throw "Node 'length' not found in ZoneMap.xml, zone: " + z.getName();
    }

    public static function getRoads(z:Zone):Array<Zone>
    {
        var a:Array<Zone> = [];
        for (e in Xml.parse(File.getContent(Main.exePath() + "data\\data\\ZoneMap.xml")).elementsNamed("zone"))
            if (e.get("id") == z.getName())
                for (el in e.elementsNamed("road"))
                    a.push(Type.createEnum(Zone, el.firstChild().nodeValue));
        return a;
    }

    public static function hasRoad(a:Zone, b:Zone):Bool
    {
        for (e in Xml.parse(File.getContent(Main.exePath() + "data\\data\\ZoneMap.xml")).elementsNamed("zone"))
            if (e.get("id") == a.getName())
                for (el in e.elementsNamed("road"))
                    if (el.firstChild().nodeValue == b.getName())
                        return true;
        return false;
    }
}