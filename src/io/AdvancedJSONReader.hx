package io;
import haxe.Json;
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

    private var cache:Map<String, String> = [];

    public function hasProperty(name:String):Bool
    {
        return getProperty(name) != "";
    }

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
        cache = [];
        currentFragment = getProperty(name);
    }

    public function considerArrayElement(index:Int)
    {
        cache = [];
        currentFragment = parseArray()[index];
    }

    public function considerFullInput()
    {
        cache = [];
        currentFragment = input;
    }

    public function cropToFragment() 
    {
        input = currentFragment;
    }

    public function parseAsFloat(?propertyName:String):Float
    {
        return Std.parseFloat(propertyName != null? getProperty(propertyName) : currentFragment);
    }

    public function parseAsInt(?propertyName:String):Int
    {
        return Std.parseInt(propertyName != null? getProperty(propertyName) : currentFragment);
    }

    public function parseAsBool(?propertyName:String):Bool
    {
        return (propertyName != null? getProperty(propertyName) : currentFragment) == "true";
    }

    public function parseAsIntArray(?propertyName:String):Array<Int>
    {
        return parseArray(propertyName).map(Std.parseInt);
    }

    public function parseAsFloatArray(?propertyName:String):Array<Float>
    {
        return parseArray(propertyName).map(Std.parseFloat);
    }

    public function parseAsStringArray(?propertyName:String):Array<String>
    {
        return parseArray(propertyName).map(StringTools.replace.bind(_, "\"", ""));
    }

    public function parseAsEnumName<T>(e:Enum<T>, ?propertyName:String):T
    {
        return e.createByName(parseAsString(propertyName));
    }

    public function parseAsString(?propertyName:String):String
    {
        return (propertyName != null? getProperty(propertyName) : currentFragment).replace("\"", "");
    }

    public function parseArray(?propertyName:String):Array<String>
    {
        var a:Array<String> = [""];
        var writingStarted:Bool = false;
        var listening:Bool = true;
        var closersAwaited:Int = 0;
        var frag = propertyName != null? getProperty(propertyName) : currentFragment;
        for (i in 0...frag.length)
        {
            var char:String = frag.charAt(i);
            if (!writingStarted)
            {
                if (char == "[")
                    writingStarted = true;
            }
            else
            {
                if (char == "\"")
                    listening = !listening;
                else if (listening)
                {
                    if (char == "[" || char == "{")
                        closersAwaited++;
                    else if (char == "}")
                        closersAwaited--;
                    else if (char == "]")
                        if (closersAwaited == 0)
                        {
                            if (a[a.length-1] == "")
                                a.splice(a.length-1, 1);
                            return a;
                        }
                        else 
                            closersAwaited--;
                    else if (char == ",")
                        if (closersAwaited == 0)
                        {
                            a.push("");
                            continue;
                        }
                }
                a[a.length-1] += char;
            }
        }

        throw "] not found to close the array";
    }

    public function getProperties():Map<String, String>
    {
        var map:Map<String, String> = [];
        var obj = Json.parse(currentFragment);
        for (prop in Reflect.fields(obj))
            map.set(prop, parseAsString(prop));
        return map;
    }

    private function getProperty(name:String):String
    {
        if (cache.exists(name))
            return cache[name];

        var ereg:EReg = new EReg('\"$name\":', "");
        var toAnalyze:String = IOUtils.drain(currentFragment);
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
            {
                cache[name] = extractProperty(toAnalyze, m.pos + m.len);
                return cache[name];
            }
            else 
                toAnalyze = ereg.matchedRight();
        }
        cache[name] = "";
        return "";
    }

    private function extractProperty(from:String, startPos:Int):String
    {
        var braceDiff:Int = 0;
        var squareBracketDiff:Int = 0;
        var ignore:Bool = false;
        for (i in startPos...from.length)
        {
            var char = from.charAt(i);
            if (char == "\"")
                ignore = !ignore;
            else if (ignore)
                continue;

            switch char
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
        }
        return "";
    }

    public function new(input:String) 
    {
        this.input = input;
        this.currentFragment = input;
    }
}