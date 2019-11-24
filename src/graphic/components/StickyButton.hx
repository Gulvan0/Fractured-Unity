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

    public function generateComboState(state:DisplayObject, l:Sprite):Sprite
    {
        var s:Sprite = new Sprite();
        s.addChild(state);
        s.addChild(l);
        return s;
    }

    public function init(e)
    {
        button.removeEventListener(Event.ADDED_TO_STAGE, init);
        button.addEventListener(MouseEvent.CLICK, pushIn);
    }

    public function new(btn:SimpleButton, pushCallback:Void->Void, ?additionalLayer:Array<Sprite>)
    {
        super();
        button = btn;
        if (additionalLayer != null)
        {
            button.upState = generateComboState(button.upState, additionalLayer[0]);
            button.overState = generateComboState(button.overState, additionalLayer[1]);
            button.downState = generateComboState(button.downState, additionalLayer[2]);
        }
        upState = btn.upState;
        overState = btn.overState;
        pushInCallback = pushCallback;
        addChild(button);
        button.addEventListener(Event.ADDED_TO_STAGE, init);
    }
}