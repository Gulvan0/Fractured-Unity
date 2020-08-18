package graphic.components.battle;

import openfl.text.TextFormatAlign;
import openfl.events.Event;
import openfl.text.TextFormat;
import graphic.Shapes.LineStyle;
import hxassert.Assert;
import openfl.text.TextField;
import openfl.display.Sprite;
using graphic.SpriteExtension;

class PatternChooseBtn extends Sprite
{
    public static var RECT_W:Int = 14;
    public static var RECT_H:Int = 27;
    private var INACTIVE_RECT:Sprite;
    private var ACTIVE_RECT:Sprite;
    private var INACTIVE_NUM_FORMAT:TextFormat;
    private var ACTIVE_NUM_FORMAT:TextFormat;

    private var rect:Sprite;
    private var num:TextField;
    
    public var selected:Bool;

    public function select() 
    {
        if (selected)
            return;
        selected = true;
        rect.removeChild(INACTIVE_RECT);
        rect.addChild(ACTIVE_RECT);
        num.setTextFormat(ACTIVE_NUM_FORMAT);
    }

    public function deselect()
    {
        if (!selected)
            return;
        selected = false;
        rect.removeChild(ACTIVE_RECT);
        rect.addChild(INACTIVE_RECT);
        num.setTextFormat(INACTIVE_NUM_FORMAT);
    }

    public function new(pos:Int) 
    {
        super();    
        Assert.assert(pos > 0 && pos < 4);

        selected = false;

        INACTIVE_RECT = Shapes.rect(RECT_W, RECT_H, 0x444444, 1, LineStyle.Square, 0x999999);
        ACTIVE_RECT = Shapes.rect(RECT_W, RECT_H, 0xFFCC00, 1, LineStyle.Square, 0xFFFF99);
        INACTIVE_NUM_FORMAT = new TextFormat(Fonts.SEGOE, 25, 0x000000, null, null, null, null, null, TextFormatAlign.CENTER);
        ACTIVE_NUM_FORMAT = new TextFormat(Fonts.SEGOE, 25, 0xFF9900, null, null, null, null, null, TextFormatAlign.CENTER);
        rect = new Sprite();
        rect.addChild(INACTIVE_RECT);

        num = new TextField();
        num.selectable = false;
        num.text = '$pos';
        num.setTextFormat(INACTIVE_NUM_FORMAT);
        num.width = 17.5;
        num.height = num.textHeight + 5;

        addChild(rect);
        this.add(num, -2, -6);
    }
}