package graphic.components;

import openfl.display.Sprite;
import openfl.display.DisplayObject;
using graphic.Utils;

class VBox extends Sprite
{
    private var components:Array<DisplayObject> = [];
    public var w(default, null):Float = 0;
    public var h(default, null):Float;
    public var interval(default, null):Float;

    public function addComponent(comp:DisplayObject, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {
        var compWidth:Float = overridenWidth == null? comp.width : overridenWidth;

        components.push(comp);
        comp.disposeAlignedV(h, align, 0, overridenHeight);
        comp.x = w;
        w += compWidth + interval;
    }

    /*public function addComponentAt(comp:DisplayObject, pos:Int, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {

    }

    public function removeComponentAt(pos:Int)
    {
        
    }*/

    public function new(h:Float, ?interval:Float = 5) 
    {
        super();
        this.h = h;
        this.interval = interval;
    }
}