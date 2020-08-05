package graphic.components;

import openfl.display.Sprite;
import openfl.display.DisplayObject;
using graphic.Utils;

class HBox extends Sprite
{
    private var components:Array<DisplayObject> = [];
    public var w(default, null):Float = 0;
    public var h(default, null):Float;
    public var interval(default, null):Null<Float>;
    private var compWidths:Array<Float> = [];
    private var totalWidth:Float = 0;

    public function addComponent(comp:DisplayObject, ?align:Align, ?overridenWidth:Float, ?overridenHeight:Float)
    {
        var compWidth:Float = overridenWidth == null? comp.width : overridenWidth;
        compWidths.push(compWidth);
        totalWidth += compWidth;
        if (align == null)
            align = Align.Left;
        
        components.push(comp);
        comp.disposeAlignedV(h, align, 0, overridenHeight);
        if (interval != null)
        {
            comp.x = w;
            w += compWidth + interval;
        }
        else if (components.length > 1)
        {
            var calcInterval:Float = (w - totalWidth)/(components.length - 1);
            var offset:Float = 0;
            for (i in 0...components.length)
            {
                components[i].x = offset;
                offset += compWidths[i] + calcInterval;
            }
        }
        else
            comp.x = 0;
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