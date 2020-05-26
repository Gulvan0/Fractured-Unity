package graphic;

import openfl.text.TextFormat;
import openfl.text.TextField;

using engine.MathUtils;

class RichString
{
    public var raw(default, null):String;
    public var substitutions:Map<String, String>;

    public function format(size:Int, maxWidth:Float, ?font:String, ?selectable:Bool = false):TextField
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
        var keyReadMode:Bool = false;
        var currentColor:String = "0x";

        for (i in 0...ftext.length)
        {
            var char:String = ftext.charAt(i);
            if (!keyReadMode)
                switch char
                {
                    case "&":
                        formats.push(new TextFormat(font, size));
                        formatBeginIndexes.push(realIndex);
                        formatEndIndexes.push(null);
                        keyReadMode = true;
                    case "]":
                        var formatPos:Int = formats.length-1;
                        while (formatEndIndexes[formatPos] != null)
                            formatPos--;
                        formatEndIndexes[formatPos] = realIndex;
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
        tf.setTextFormat(new TextFormat(font, size));
        for (i in 0...formats.length)
            tf.setTextFormat(formats[i], formatBeginIndexes[i], formatEndIndexes[i]);
        if (tf.textWidth + 5 > maxWidth)
        {
            tf.wordWrap = true;
            tf.width = maxWidth;
        }
        else
            tf.width = tf.textWidth + 5;
        return tf;
    }

    private function substitute(str:String):String
    {
        var ereg:EReg = ~/%(.+?)%/;
        while (ereg.match(str))
            str = ereg.replace(str, substitutions.get(ereg.matched(1)));
        return str;
    }

    public function new(raw:String, substitutions:Map<String, String>) 
    {
        this.raw = raw;
        this.substitutions = substitutions;
    }
}