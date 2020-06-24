package graphic;

import struct.Attribute;
import engine.Color;
import struct.Element;
import struct.Utils;
import openfl.text.TextFormat;
import openfl.text.TextField;

using engine.MathUtils;

class RichString
{
    public var raw(default, null):String;
    public var substitutions:Map<String, String>;

    public function format(size:Int, maxWidth:Float, ?defaultColor:Int, ?font:String, ?selectable:Bool = false):TextField
    {
        if (font == null)
            font = Fonts.ERAS;

        var tf:TextField = new TextField();
        var ftext:String = substitute(raw);
        var realIndex:Int = 0;
        var text:String = "";
        var formats:Array<TextFormat> = [];
        var formatBeginIndexes:Array<Int> = [];
        var formatEndIndexes:Array<Null<Int>> = [];
        var numberFormat:TextFormat = new TextFormat(font, Math.round(1.1 * size), 0xffdf00);
        var numformatBeginIndexes:Array<Int> = [];
        var numformatEndIndexes:Array<Int> = [];
        var keyReadMode:Bool = false;
        var currentColor:String = "0x";

        for (i in 0...ftext.length)
        {
            var char:String = ftext.charAt(i);
            if (!keyReadMode)
                switch char
                {
                    case "&":
                        formats.push(new TextFormat(font, size, defaultColor));
                        formatBeginIndexes.push(realIndex);
                        formatEndIndexes.push(null);
                        keyReadMode = true;
                    case "]":
                        var formatPos:Int = formats.length-1;
                        while (formatEndIndexes[formatPos] != null)
                            formatPos--;
                        formatEndIndexes[formatPos] = realIndex;
                    case "<":
                        numformatBeginIndexes.push(realIndex);
                    case ">":
                        numformatEndIndexes.push(realIndex);
                    default:
                        text += char;
                        realIndex++;
                }
            else
                switch char
                {
                    case "u":
                        formats[formats.length-1].underline = true;    
                    case "[":
                        if (currentColor.length == 8)
                            formats[formats.length-1].color = Std.parseInt(currentColor);
                        currentColor = "0x";
                        keyReadMode = false;
                    default:
                        var code = char.charCodeAt(0);
                        if (code.inRange(48, 57) || code.inRange(65, 70))
                            currentColor += char;
                }
        }

        tf.selectable = selectable;
        tf.text = text;

        tf.setTextFormat(new TextFormat(font, size, defaultColor));
        for (i in 0...formats.length)
            tf.setTextFormat(formats[i], formatBeginIndexes[i], formatEndIndexes[i]);
        for (i in 0...numformatBeginIndexes.length)
            tf.setTextFormat(numberFormat, numformatBeginIndexes[i], numformatEndIndexes[i]);

        colourKeywords(tf, font, size);

        if (tf.textWidth + 5 > maxWidth)
        {
            tf.wordWrap = true;
            tf.width = maxWidth;
        }
        else
            tf.width = tf.textWidth + 5;

        return tf;
    }

    private function colourKeywords(tf:TextField, font:String, size:Int)
    {
        for (e in Element.createAll())
        {
            var abb:String = Utils.getElementAbbreviation(e);
            var ereg:EReg = new EReg("\\b" + abb + "\\b", "");
            var lookupStr:String = tf.text;
            var charsToTheLeft:Int = 0;
            while (ereg.match(lookupStr)) 
            {
                var mp = ereg.matchedPos();
                var matched = ereg.matched(0);
                var leftIndex = charsToTheLeft + mp.pos;
                var rightIndex = leftIndex + mp.len - 1;
                tf.setTextFormat(new TextFormat(font, size, Color.elemental(e)), leftIndex, rightIndex);
                charsToTheLeft += lookupStr.length - ereg.matchedRight().length;
                lookupStr = ereg.matchedRight();
            }
        }

        for (a in Attribute.createAll())
        {
            var abb:String = Utils.getAttributeAbbreviation(a);
            var ereg:EReg = new EReg("\\b" + abb + "\\b", "");
            var lookupStr:String = tf.text;
            var charsToTheLeft:Int = 0;
            while (ereg.match(lookupStr)) 
            {
                var mp = ereg.matchedPos();
                var matched = ereg.matched(0);
                var leftIndex = charsToTheLeft + mp.pos;
                var rightIndex = leftIndex + mp.len;
                tf.setTextFormat(new TextFormat(font, size, Color.attribute(a)), leftIndex, rightIndex);
                charsToTheLeft += lookupStr.length - ereg.matchedRight().length;
                lookupStr = ereg.matchedRight();
            }
        }
    }

    private function substitute(str:String):String
    {
        var ereg:EReg = ~/%(.+?)%/;
        while (ereg.match(str))
            str = ereg.replace(str, substitutions.get(ereg.matched(1)));
        return str;
    }

    public function new(raw:String, ?substitutions:Map<String, String>) 
    {
        this.raw = raw;
        this.substitutions = substitutions == null? [] : substitutions;
    }
}