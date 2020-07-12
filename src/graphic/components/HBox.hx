package graphic.components;

import openfl.display.Sprite;
import openfl.display.DisplayObject;
using graphic.Utils;

class VBox extends Sprite
{
    private var components:Array<DisplayObject> = [];
    public var w(default, null):Float = 0;
    public var h(default, null):Float;
    public var interval(default, null):Null<Float>;

    public function addComponent(comp:DisplayObject, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {
        var compWidth:Float = overridenWidth == null? comp.width : overridenWidth;

        components.push(comp);
        comp.disposeAlignedV(h, align, 0, overridenHeight);
        if (interval != null)
        {
            comp.x = w;
            w += compWidth + interval;
        }
        else
        {
            var totalWidth:Float = 0;
            for (c in components)
                totalWidth += c.width;
            var calcInterval:Float = (w - totalWidth)/(components.length - 1);
            var offset:Float = 0;
            for (c in components)
            {
                c.x = offset;
                offset += c.width + calcInterval;
            }
        }
        addChild(comp);
    }

    /*public function addComponentAt(comp:DisplayObject, pos:Int, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {

    }

    public function removeComponentAt(pos:Int)
    {
        
    }*/

    public function new(h:Float, ?w:Float, ?interval:Float = 5) 
    {
        super();
        this.h = h;
        if (w != null)
            this.w = w;
        else
            this.interval = interval;
    }
}