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
        if (align == null)
            align = Align.Left;

        components.push(comp);
        comp.disposeAlignedH(w, align, 0, overridenWidth);
        disposeComponentY(comp, compHeight);
        addChild(comp);
    }

    private function disposeComponentY(comp:DisplayObject, compHeight:Float)
    {
        totalHeight += compHeight;
        if (interval != null)
        {
            comp.y = h;
            h += compHeight + interval;
        }
        else if (components.length > 1) //then h != null
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
    }

    /*public function addComponentAt(comp:DisplayObject, pos:Int, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {

    }*/

    public function removeComponentAt(pos:Int)
    {
        removeChild(components[pos]);
        components.splice(pos, 1);
        compHeights.splice(pos, 1);

        totalHeight = 0;
        for (i in 0...pos)
            totalHeight += compHeights[i];
        if (interval != null)
            h = totalHeight + interval * pos;

        for (i in pos...components.length)
            disposeComponentY(components[i], compHeights[i]);
    }

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