package graphic.components.hints;

import graphic.Shapes.LineStyle;
import openfl.display.Sprite;
import openfl.text.TextField;
using graphic.SpriteExtension;

class BasicHint extends Sprite
{

    private var bg:Sprite;
    private var headertf:TextField;
    private var bodytf:TextField;
    private var delimiter:Sprite;

    private static var XOFFSET:Float = 5;
    private static var YOFFSET:Float = 3.5;
    private static var YINTERVAL:Float = 6;
    private static var DELIMITER_THICKNESS:Int = 3;
    
    public function new(header:RichString, text:RichString, ?boxWidth:Float = 200) 
    {
        super();
        headertf = header.format(TextFields.defaultHintHeaderSize, boxWidth, 0xCCCCCC);
        bodytf = text.format(TextFields.defaultHintTextSize, boxWidth, 0xCCCCCC);
        headertf.height = headertf.textHeight + 5;
        bodytf.height = bodytf.textHeight + 5;
        bg = Shapes.rect(boxWidth + 2 * XOFFSET, YOFFSET + headertf.textHeight + YINTERVAL + bodytf.textHeight + YOFFSET, 0x333333, 3, LineStyle.Square, 0x000000, 0.7);
        delimiter = Shapes.line(boxWidth, 0, 0xCCCCCC, DELIMITER_THICKNESS);
        this.add(bg, 0, 0);
        this.add(delimiter, XOFFSET, headertf.y + headertf.textHeight + YINTERVAL);
        this.add(headertf, XOFFSET, YOFFSET);
        this.add(bodytf, XOFFSET, headertf.y + headertf.textHeight + YINTERVAL);
    }
}