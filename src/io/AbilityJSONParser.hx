package io;

import io.AdvancedJSONReader.PropertyType;
import hxassert.Assert;
import struct.Attribute;
import struct.Element;
import struct.Utils;
import ID.AbilityID;
using StringTools;
using engine.StringUtils;

class ProtoAbility
{
    public var name:String;
    public var manacost:Null<Array<Int>>;
    public var cooldown:Null<Array<Int>>;
    public var element:Element;
    public var typeStr:String;
    public var targetStr:Null<String>;
    public var maxlvl:Int;

    public function new() 
    {
        
    }
}

class AbilityJSONParser 
{
    public static function getAbilityElement(ab:AbilityID):Element
    {
        return Utils.getElementByAbbreviation(retrieveAbbreviation(ab));
    }

    public static function retrieveAbbreviation(ab:AbilityID):String
    {
        return ab.getName().substr(0, 2);
    }

    public static function getProtoAbility(ab:AbilityID):ProtoAbility
    {
        var output:ProtoAbility = new ProtoAbility();
        var reader:AdvancedJSONReader = targetAbility(ab);

        if (reader.hasProperty("name"))
            output.name = reader.parseAsString("name");
        else
            output.name = retrieveImplicitName(ab);

        if (reader.hasProperty("cooldown"))
            if (reader.typeOf("cooldown") == PropertyType.Number)
                output.cooldown = [reader.parseAsInt("cooldown")];
            else
                output.cooldown = reader.parseAsIntArray("cooldown");
        if (reader.hasProperty("manacost"))
            if (reader.typeOf("manacost") == PropertyType.Number)
                output.manacost = [reader.parseAsInt("manacost")];
            else
                output.manacost = reader.parseAsIntArray("manacost");
        if (reader.hasProperty("target"))
            output.targetStr = reader.parseAsString("target");

        output.typeStr = reader.parseAsString("type");
        output.maxlvl = reader.parseAsInt("maxlvl");
        output.element = getAbilityElement(ab);

        return output;
    }

    ///If other properties are also needed, use getProtoAbility() instead
    public static function getAbilityName(ab:AbilityID):String
    {
        var reader:AdvancedJSONReader = targetAbility(ab);
        if (reader.hasProperty("name"))
            return reader.parseAsString("name");
        else
            return retrieveImplicitName(ab);
    }

    private static function retrieveImplicitName(ab:AbilityID):String
    {
        var contracted:String = ab.getName().substr(2);
        var full:String = "";
        for (i in 0...contracted.length)
        {
            var char:String = contracted.charAt(i);
            if (char.toUpperCase() == char && i > 0)
                full += " ";
            full += char;
        }
        return full;
    }

    public static function getAbilityDescription(ab:AbilityID, ?level:Int, ?hideOtherLevels:Bool = false):Map<String, String>
    {
        var reader:AdvancedJSONReader = targetAbility(ab);
        reader.considerProperty("description");
        var properties = reader.getProperties();
        Assert.require(properties.exists("main"));

        if (level != null)
        {
            Assert.require(level > 0);
            for (k in properties.keys())
                properties.set(k, highlightNumbers(properties[k], level, hideOtherLevels));
        }

        return properties;
    }

    public static function highlightNumbers(s:String, level:Int, hideOtherLevels:Bool):String
    {
        Assert.require(level > 0);
        var ereg:EReg = ~/<(.+\/.+)>/;
        while (ereg.match(s))
        {
            var chunk:String = ereg.matched(1);
            Assert.require(chunk.firstChar() != "/" && chunk.lastChar() != "/");

            var slashesCount:Int = chunk.countChars("/");
            if (level == 1)
                chunk = "<" + chunk.insert(chunk.indexOf("/"), ">");
            else if (level > slashesCount)
                chunk = chunk.insert(chunk.lastIndexOf("/") + 1, "<") + ">";
            else 
            {
                var slashesCounted:Int = 0;
                for (i in 0...chunk.length)
                    if (chunk.charAt(i) == "/")
                    {
                        slashesCounted++;
                        if (slashesCounted == level - 1)
                            chunk = chunk.insert(i+1, "<");
                        else if (slashesCounted == level)
                        {
                            chunk = chunk.insert(i, ">");
                            break;
                        }
                    }
            }

            if (hideOtherLevels)
            {
                var cutterEReg:EReg = ~/<.+>/;
                cutterEReg.match(chunk);
                chunk = cutterEReg.matched(0);
            }

            s = ereg.replace(s, chunk);
        }
        return s;
    }

    public static function targetAbility(ab:AbilityID):AdvancedJSONReader
    {
        var abb:String = retrieveAbbreviation(ab);
        var abilities:String = IOUtils.fileContent("classes\\" + abb + "\\abilities.json");
        var reader:AdvancedJSONReader = new AdvancedJSONReader(abilities);
        reader.considerProperty(ab.getName());
        reader.cropToFragment();
        return reader;
    }
}