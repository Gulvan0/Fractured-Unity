package struct;

class Utils
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

    public static function getAttributeAbbreviation(att:Attribute):String
    {
        return switch att {
            case Strength: "St";
            case Flow: "Fl";
            case Intellect: "In";
        }
    }    
}