package graphic.components;

import openfl.events.Event;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.display.DisplayObject;
import openfl.display.SimpleButton;

class StickyButton extends Sprite
{

    private var button:SimpleButton;
    private var pushInCallback:Void->Void;
    private var pushed:Bool;

    public function pushIn(?e)
    {
        if (pushed)
            return;
        button.removeEventListener(MouseEvent.CLICK, pushIn);
        removeChild(button);
        addChild(button.downState);
        pushed = true;
        pushInCallback();
    }

    public function pushOut()
    {
        if (!pushed)
            return;
        removeChild(button.downState);
        addChild(button);
        pushed = false;
        button.addEventListener(MouseEvent.CLICK, pushIn);
    }

    private function terminate(e)
    {
        button.removeEventListener(MouseEvent.CLICK, pushIn);
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        button.addEventListener(MouseEvent.CLICK, pushIn);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new(btn:SimpleButton, pushCallback:Void->Void, ?pushed:Bool = false, ?additionalLayer:Array<DisplayObject>)
    {
        super();
        this.pushInCallback = pushCallback;
        this.pushed = pushed;
        if (additionalLayer != null)
            button = new GlyphButton(btn, additionalLayer);
        else
            button = btn;
        if (pushed)
            addChild(button.downState);
        else
        {
            addChild(button);
            addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
    }
}