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
    public var hasSideOffsets(default, null):Bool;
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
            var intervalCount:Int = hasSideOffsets? components.length + 1 : components.length - 1;
            var calculatedInterval:Float = (w - totalWidth)/intervalCount;
            var offset:Float = hasSideOffsets? calculatedInterval : 0;
            for (i in 0...components.length)
            {
                components[i].x = offset;
                offset += compWidths[i] + calculatedInterval;
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

    public function new(h:Float, ?w:Float, ?interval:Float = 5, ?hasSideOffsets:Bool = false) 
    {
        super();
        this.h = h;
        if (w != null)
            this.w = w;
        else
            this.interval = interval;
        this.hasSideOffsets = hasSideOffsets;
    }
}