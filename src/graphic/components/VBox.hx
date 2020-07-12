package graphic.components;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
using graphic.Utils;

class VBox extends Sprite
{
    private var components:Array<DisplayObject> = [];
    public var w(default, null):Float;
    public var h(default, null):Float = 0;
    public var interval(default, null):Float;

    public function addComponent(comp:DisplayObject, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {
        var compHeight:Float = overridenHeight == null? comp.height : overridenHeight;

        components.push(comp);
        comp.disposeAlignedH(w, align, 0, overridenWidth);
        comp.y = h;
        h += compHeight + interval;
    }

    /*public function addComponentAt(comp:DisplayObject, pos:Int, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {

    }

    public function removeComponentAt(pos:Int)
    {
        
    }*/

    public function new(w:Float, ?interval:Float = 5) 
    {
        super();
        this.w = w;
        this.interval = interval;
    }
}