package graphic.components.bheditor;

import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.text.TextField;
import hxassert.Assert;
import openfl.display.Sprite;
using Lambda;
using graphic.SpriteExtension;

class OptionSelector extends Sprite
{
    private var options:Array<String>;
    private var current:Int;
    private var updateCallback:String->Void;

    private var left:BHLeftArrow;
    private var optionTF:TextField;
    private var right:BHRightArrow;

    private var maxTextWidth:Float;

    private var TEXT_TO_BUTTON_DISTANCE:Float = 5;

    public function new(options:Array<String>, updateCallback:String->Void, ?currentOption:String) 
    {
        super();
        Assert.require(!options.empty());
        this.options = options;
        this.updateCallback = updateCallback;
        this.current = 0;
        if (currentOption != null)
            for (i in 0...options.length)
                if (currentOption == options[i])
                {
                    this.current = i;
                    break;
                }

        maxTextWidth = 0;
        for (opt in options)
        {
            optionTF = TextFields.editorOptionSelector(opt);
            if (optionTF.textWidth > maxTextWidth)
                maxTextWidth = optionTF.textWidth;
        }            
        create();
    }

    private function update() 
    {
        current %= options.length;
        var newValue:String = options[current];
        optionTF.text = newValue;
        repostionRightArrow();
        updateCallback(newValue);
    }

    private function leftHandler(?e) 
    {
        current--;
        update();
    }

    private function rightHandler(?e) 
    {
        current++;
        update();
    }

    private function init(?e) 
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        left.addEventListener(MouseEvent.CLICK, leftHandler);
        right.addEventListener(MouseEvent.CLICK, rightHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function terminate(?e) 
    {
        left.removeEventListener(MouseEvent.CLICK, leftHandler);
        right.removeEventListener(MouseEvent.CLICK, rightHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function repostionRightArrow() 
    {
        right.x = left.width + TEXT_TO_BUTTON_DISTANCE + maxTextWidth + TEXT_TO_BUTTON_DISTANCE;
    }

    private function create() 
    {
        left = new BHLeftArrow();
        right = new BHRightArrow();
        optionTF = TextFields.editorOptionSelector(options[current]);

        this.add(left, 0, 0);
        repostionRightArrow();
        this.add(right, right.x, 0);
        this.add(optionTF, (right.x + left.rightX() - maxTextWidth)/2, (left.height - optionTF.textHeight)/2 - 3);

        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}