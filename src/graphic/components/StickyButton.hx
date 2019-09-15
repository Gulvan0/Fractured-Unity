package graphic.components;

import openfl.events.Event;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.display.DisplayObject;
import openfl.display.SimpleButton;

class StickyButton extends Sprite
{

    private var button:SimpleButton;
    private var upState:DisplayObject;
    private var overState:DisplayObject;

    private var pushInCallback:Void->Void;

    public function pushIn(?e)
    {
        button.removeEventListener(MouseEvent.CLICK, pushIn);
        button.upState = button.downState;
        button.overState = button.downState;
        pushInCallback();
    }

    public function pushOut()
    {
        button.addEventListener(MouseEvent.CLICK, pushIn);
        button.upState = upState;
        button.overState = overState;
    }

    public function init(e)
    {
        button.removeEventListener(Event.ADDED_TO_STAGE, init);
        button.addEventListener(MouseEvent.CLICK, pushIn);
    }

    public function new(btn:SimpleButton, pushCallback:Void->Void, ?additionalLayer:Array<Sprite>)
    {
        super();
        if (additionalLayer != null)
            button = new GlyphButton(btn, additionalLayer);
        else
            button = btn;
        upState = btn.upState;
        overState = btn.overState;
        pushInCallback = pushCallback;
        addChild(button);
        button.addEventListener(Event.ADDED_TO_STAGE, init);
    }
}