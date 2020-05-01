package io;

import struct.Element;
import ID.AbilityID;
using StringTools;

typedef DanmakuVarJSON =
{
    name:String,
    ?lb:Float,
    ?rb:Float,
    ?intConstr:Bool
}

typedef DanmakuPropsJSON =
{
    type:String,
    dispenser:String,
    count:Int,
    ?interval:Float,
    ?easing:String,
    ?vars:Array<DanmakuVarJSON>
}

typedef AbilityJSON =
{
    ?name:String,
    description:Dynamic,
    type:String,
    ?target:String,
    ?manacost:Dynamic,
    ?cooldown: Dynamic,
    maxlvl: Int,
    ?flags:Array<String>,
    ?danmakuProps:DanmakuPropsJSON
}

class AbilityJSONParser 
{
    public static function getElementAbbreviation(el:Element):String
    {
        return switch el {
            case Physical: "Ph";
            case Shadow: "Sh";
            case Lightning: "Lg";
            case Terra: "Tr";
            case Poison: "Po";
            case Fire: "Fi";
            case Frost: "Fr";
        }
    }

    public static function getElementByAbbreviation(abb:String):Null<Element>
    {
        return switch abb {
            case "Ph": Physical;
            case "Sh": Shadow;
            case "Lg": Lightning;
            case "Tr": Terra;
            case "Po": Poison;
            case "Fi": Fire;
            case "Fr": Frost;
            default: null;
        }
    }

    public static function getAbilityElement(ab:AbilityID):Element
    {
        return getElementByAbbreviation(retrieveAbbreviation(ab));
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