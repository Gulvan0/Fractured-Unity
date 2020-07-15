package io;

import hxassert.Assert;
import struct.Attribute;
import struct.Element;
import struct.Utils;
import ID.AbilityID;
using StringTools;

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

    public static function getAbilityDescription(ab:AbilityID):Map<String, String>
    {
        var reader:AdvancedJSONReader = targetAbility(ab);
        reader.considerProperty("description");
        var properties = reader.getProperties();
        Assert.require(properties.exists("main"));
        return properties;
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