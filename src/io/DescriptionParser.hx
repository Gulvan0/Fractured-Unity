package io;

import io.AdvancedJSONReader.PropertyType;
import hxassert.Assert;
import struct.Attribute;
import struct.Element;
import struct.Utils;
import ID.AbilityID;
using StringTools;
using engine.StringUtils;

class DescriptionParser 
{
    public static function convertAbilityDescription(desc:Map<String, String>, ?level:Int, ?hideOtherLevels:Bool = false):Map<String, String>
    {
        var converted:Map<String, String> = [];
        if (level != null)
        {
            Assert.require(level > 0);
            for (k => v in desc.keyValueIterator())
                converted.set(k, highlightNumbers(v, level, hideOtherLevels));
            return converted;
        }
        else
            return desc.copy();
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
}