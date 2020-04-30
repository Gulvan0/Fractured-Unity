package io;
using StringTools;

enum PropertyType
{
    Number;
    String;
    Array;
    Object;
}

class AdvancedJSONReader
{
    public var input:String;
    public var currentFragment:String;

    /*public function hasProperty(name:String, ?searchNested:Bool = true):Bool
    {
        var r:EReg = new EReg('\"$name\"[\\s]:', "");
        if (searchNested)
            return currentFragment.contains('\"$name\":');
    }*/

    public function typeOf(?propertyName:String):PropertyType
    {
        var frag:String = propertyName != null? getProperty(propertyName) : currentFragment;
        switch (frag.charAt(0))
        {
            case "{": return PropertyType.Object;
            case "[": return PropertyType.Array;
            case "\"": return PropertyType.String;
            default: return PropertyType.Number;
        }
    }

    public function considerProperty(name:String)
    {
        currentFragment = getProperty(name);
    }

    public function considerFullInput()
    {
        currentFragment = input;
    }

    public function parseAsFloat():Float
    {
        return Std.parseFloat(currentFragment);
    }

    public function parseAsInt():Int
    {
        return Std.parseInt(currentFragment);
    }

    public function parseAsIntArray():Array<Int>
    {
        return parseArray().map(Std.parseInt);
    }

    public function parseAsFloatArray():Array<Float>
    {
        return parseArray().map(Std.parseFloat);
    }

    public function parseAsStringArray():Array<String>
    {
        return parseArray().map(StringTools.replace.bind(_, "\"", ""));
    }

    public function parseAsString():String
    {
        return currentFragment.replace("\"", "");
    }

    public function parseArray():Array<String>
    {
        var a:Array<String> = [""];
        var writingStarted:Bool = false;
        for (i in 0...currentFragment.length)
        {
            var char:String = currentFragment.charAt(i);
            if (char == "]")
                return a;
            else if (char == "[")
                writingStarted = true;
            else if (!writingStarted)
                continue;
            else if (char == ",")
                a.push("");
            else 
                a[a.length-1] += char;
        }

        throw "] not found to close the array";
    }

    public function getProperty(name:String):String
    {
        var ereg:EReg = new EReg('\"$name\":', "");
        var toAnalyze:String = drain(currentFragment);
        var braceDiff:Int = 0;
        var squareBracketDiff:Int = 0;
        while (ereg.match(toAnalyze))
        {
            var m = ereg.matchedPos();
            for (i in 0...m.pos)
                switch toAnalyze.charAt(i) 
                {
                    case "{": braceDiff++;
                    case "}": braceDiff--;
                    case "[": squareBracketDiff++;
                    case "]": squareBracketDiff--;
                    default:
                }
            if (braceDiff < 2 && squareBracketDiff == 0) //Assuming we've got a valid JSON
                return extractProperty(toAnalyze, m.pos + m.len);
            else 
                toAnalyze = ereg.matchedRight();
        }
        return "";
    }

    private function extractProperty(from:String, startPos:Int):String
    {
        var braceDiff:Int = 0;
        var squareBracketDiff:Int = 0;
        for (i in startPos...from.length)
            switch from.charAt(i) 
            {
                case "{": 
                    braceDiff++;
                case "}": 
                    braceDiff--;
                    if (braceDiff == -1) //Object containing the property has ended
                        return from.substring(startPos, i);
                case "[": 
                    squareBracketDiff++;
                case "]": 
                    squareBracketDiff--;
                case ",": 
                    if (braceDiff == 0 && squareBracketDiff == 0) //Comma on the same nesting level as the property
                        return from.substring(startPos, i);
                default:
            }
        return "";
    }

    public function new(input:String) 
    {
        this.input = input;
        this.currentFragment = input;
    }

    private function drain(s:String):String
    {
        var ereg:EReg = ~/\s+/g;
        return ereg.replace(s, "");
    }
}