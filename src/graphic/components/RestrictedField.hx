package graphic.components;

import openfl.events.KeyboardEvent;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.events.Event;
import openfl.events.FocusEvent;
using StringTools;
using engine.MathUtils;

class RestrictedField extends TextField
{
    public var from:Float;
    public var to:Float;
    public var onlyInt:Bool;

    private var prevText:String;
    private var onFilled:Float->Void;

    private function outHandler(?e:FocusEvent)
    {
        removeEventListener(FocusEvent.FOCUS_OUT, outHandler);
        removeEventListener(KeyboardEvent.KEY_DOWN, onKey);

        if (text == "" || (onlyInt && text.contains(".")))
        {
            text = prevText;
            return;
        }

        var value:Float;
        if (onlyInt)
            value = Math.round(Std.parseInt(text).fit(from, to));
        else
            value = Std.parseFloat(text).fit(from, to).roundTo(2);
        text = "" + value;
        prevText = text;
        addEventListener(FocusEvent.FOCUS_IN, focusIn);
        onFilled(value);
    }

    private function focusIn(?e) 
    {
        removeEventListener(FocusEvent.FOCUS_IN, focusIn);
        addEventListener(FocusEvent.FOCUS_OUT, outHandler);
        addEventListener(KeyboardEvent.KEY_DOWN, onKey);
    }

    private function onKey(e:KeyboardEvent) 
    {
        if (e.keyCode == 13)
        {
            stage.focus = null;
            outHandler();
        }
    }

    private function terminate(e)
    {
        if (hasEventListener(FocusEvent.FOCUS_OUT))
            removeEventListener(FocusEvent.FOCUS_OUT, outHandler);
        if (hasEventListener(FocusEvent.FOCUS_IN))
            removeEventListener(FocusEvent.FOCUS_IN, focusIn);
        if (hasEventListener(KeyboardEvent.KEY_DOWN))
            removeEventListener(KeyboardEvent.KEY_DOWN, onKey);
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        addEventListener(FocusEvent.FOCUS_IN, focusIn);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new(value:Float, from:Float, to:Float, intRestriction:Bool, onFilled:Float->Void)
    {
        super();
        this.from = from;
        this.to = to;
        this.onlyInt = intRestriction;
        this.restrict = "0-9.";
        this.type = TextFieldType.INPUT;
        this.onFilled = onFilled;
        this.text = "" + value;
        this.prevText = this.text;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}