package io;

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