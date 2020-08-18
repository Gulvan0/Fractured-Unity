package graphic.components;

import engine.Listeners.AreaHandler;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
using graphic.Utils;

class VBox extends Sprite
{
    private var components:Array<DisplayObject> = [];
    public var w(default, null):Float;
    public var h(default, null):Float = 0;
    public var interval(default, null):Null<Float>;
    private var compHeights:Array<Float> = [];
    private var totalHeight:Float = 0;

    public function addComponent(comp:DisplayObject, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {
        var compHeight:Float = overridenHeight == null? comp.height : overridenHeight;
        compHeights.push(compHeight);
        totalHeight += compHeight;
        if (align == null)
            align = Align.Left;

        components.push(comp);
        comp.disposeAlignedH(w, align, 0, overridenWidth);
        if (interval != null)
        {
            comp.y = h;
            h += compHeight + interval;
        }
        else if (components.length > 1)
        {
            var calcInterval:Float = (h - totalHeight)/(components.length - 1);
            var offset:Float = 0;
            for (i in 0...components.length)
            {
                components[i].y = offset;
                offset += compHeights[i] + calcInterval;
            }
        }
        else
            comp.y = 0;
        addChild(comp);
    }

    /*public function addComponentAt(comp:DisplayObject, pos:Int, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {

    }

    public function removeComponentAt(pos:Int)
    {
        
    }*/

    public function new(w:Float, ?h:Float, ?interval:Float = 5) 
    {
        super();
        this.w = w;
        if (h != null)
            this.h = h;
        else
            this.interval = interval;
    }
}