package graphic.components.battle;

import openfl.events.Event;
import openfl.text.TextFormat;
import graphic.Shapes.LineStyle;
import hxassert.Assert;
import openfl.text.TextField;
import openfl.display.Sprite;

class PatternChooseBtn extends Sprite
{
    private var RECT_W:Int = 14;
    private var RECT_H:Int = 27;
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
        removeChild(rect);
        rect = ACTIVE_RECT;
        addChild(rect);
        num.setTextFormat(ACTIVE_NUM_FORMAT);
    }

    public function deselect()
    {
        if (selected)
            return;
        selected = false;
        removeChild(rect);
        rect = INACTIVE_RECT;
        addChild(rect);
        num.setTextFormat(INACTIVE_NUM_FORMAT);
    }

    public function new(pos:Int) 
    {
        super();    
        Assert.assert(pos > 0 && pos < 4);

        INACTIVE_RECT = Shapes.rect(RECT_W, RECT_H, 0x444444, 1, LineStyle.Square, 0x999999);
        ACTIVE_RECT = Shapes.rect(RECT_W, RECT_H, 0x444444, 1, LineStyle.Square, 0x999999);
        INACTIVE_NUM_FORMAT = new TextFormat(Fonts.NARROW, RECT_H, 0x000000);
        ACTIVE_NUM_FORMAT = new TextFormat(Fonts.NARROW, RECT_H, 0xFF9900);
        rect = INACTIVE_RECT;

        num = new TextField();
        num.text = '$pos';
        num.setTextFormat(INACTIVE_NUM_FORMAT);

        addChild(rect);
        addChild(num);
    }
}