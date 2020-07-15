package io;

import hxassert.Assert;
import struct.Attribute;
import struct.Element;
import struct.Utils;
import ID.AbilityID;
using StringTools;
using engine.StringUtils;

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

    public static function getAbilityName(ab:AbilityID):String
    {
        var reader:AdvancedJSONReader = targetAbility(ab);
        if (reader.hasProperty("name"))
            return reader.parseAsString("name");
        else
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
    }

    public static function getAbilityDescription(ab:AbilityID, ?level:Int):Map<String, String>
    {
        var reader:AdvancedJSONReader = targetAbility(ab);
        reader.considerProperty("description");
        var properties = reader.getProperties();
        Assert.require(properties.exists("main"));

        if (level != null)
        {
            Assert.require(level > 0);
            for (k in properties.keys())
                properties.set(k, highlightNumbers(properties[k], level));
        }

        return properties;
    }

    private static function highlightNumbers(s:String, level:Int):String
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