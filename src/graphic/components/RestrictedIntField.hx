package graphic.components;

import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.events.Event;
import openfl.events.FocusEvent;

class RestrictedIntField extends TextField
{

    public var from:Int;
    public var to:Int;

    private function outHandler(e:FocusEvent)
    {
        if (text == "")
            return;
        var v:Int = Std.parseInt(text);
        if (v > to)
            text = "" + to;
        else if (v < from)
            text = "" + from;
    }

    private function terminate(e)
    {
        removeEventListener(FocusEvent.FOCUS_OUT, outHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        addEventListener(FocusEvent.FOCUS_OUT, outHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new(from:Int, to:Int)
    {
        super();
        this.from = from;
        this.to = to;
        this.restrict = "0-9";
        this.type = TextFieldType.INPUT;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}