package graphic.components.hints;

import graphic.Shapes.LineStyle;
import openfl.text.TextField;
import openfl.display.Sprite;
using graphic.SpriteExtension;

class UnnamedHint extends Sprite
{

    private var bg:Sprite;
    private var bodytf:TextField;

    private static var XOFFSET:Float = 5;
    private static var YOFFSET:Float = 3.5;
    
    public function new(text:RichString, ?boxWidth:Float = 200) 
    {
        super();
        bodytf = text.format(TextFields.defaultHintTextSize, boxWidth, 0xCCCCCC);
        bodytf.height = bodytf.textHeight + 5;
        bg = Shapes.rect(boxWidth + 2 * XOFFSET, YOFFSET + bodytf.textHeight + YOFFSET, 0x333333, 3, LineStyle.Square, 0x000000, 0.7);
        this.add(bg, 0, 0);
        this.add(bodytf, XOFFSET, YOFFSET);
    }
}