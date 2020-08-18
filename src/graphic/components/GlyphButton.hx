package graphic.components;

import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.display.SimpleButton;

abstract GlyphButton(SimpleButton) to SimpleButton
{

    public function generateComboState(state:DisplayObject, l:DisplayObject):Sprite
    {
        var s:Sprite = new Sprite();
        s.addChild(state);
        s.addChild(l);
        return s;
    }

    public inline function new(btn:SimpleButton, additionalLayer:Array<DisplayObject>)
    {
        this = btn;
        this.upState = generateComboState(btn.upState, additionalLayer[0]);
        this.overState = generateComboState(btn.overState, additionalLayer[1]);
        this.downState = generateComboState(btn.downState, additionalLayer[2]);
    }
}