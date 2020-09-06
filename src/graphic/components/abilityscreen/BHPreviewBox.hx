package graphic.components.abilityscreen;

import ID.AbilityID;
import io.AbilityParser;
import openfl.geom.Point;
import haxe.Json;
import openfl.display.Sprite;
using graphic.SpriteExtension;
using graphic.Utils;

class BHPreviewBox extends Sprite
{
    private var w:Float;
    private var h:Float;
    private var bg:Sprite;
    private var preview:Sprite;

    private var BORDER_THICKNESS:Int = 5;

    private function drawEmpty() 
    {
        preview.add(Assets.getSoul(), w/2, h/2);
        addChild(preview);
    }

    public function redraw(pattern:String, ability:AbilityID)
    {
        removeChild(preview);
        preview = new Sprite();

        if (pattern == "")
        {
            drawEmpty();
            return;
        }

        var pos:Array<Dynamic> = Json.parse(pattern);
        
        if (Lambda.empty(pos))
        {
            drawEmpty();
            return;
        }

        var particleBased:Bool = AbilityParser.isParticleBased(ability);
            
        var min:Point = new Point(GameRules.bhSoulX, GameRules.bhSoulY);
        var max:Point = new Point(GameRules.bhSoulX, GameRules.bhSoulY);
        for (p in pos)
        {
            if (p.x < min.x)
                min.x = p.x;
            else if (p.x > max.x)
                max.x = p.x;
            if (p.y < min.y)
                min.y = p.y;
            else if (p.y > max.y)
                max.y = p.y;
        }
        
        var sampleObject = particleBased? Assets.getParticle(ability) : Assets.getDispenser(ability);
        var offsetDueToBorder = BORDER_THICKNESS/2;
        var xOffset = -min.x + sampleObject.width/2 + offsetDueToBorder;
        var yOffset = -min.y + sampleObject.height/2 + offsetDueToBorder;
        preview.add(Assets.getSoul(), GameRules.bhSoulX + xOffset, GameRules.bhSoulY + yOffset);
        for (p in pos)
        {
            var obj = particleBased? Assets.getParticle(ability) : Assets.getDispenser(ability);
            preview.add(obj, p.x + xOffset, p.y + yOffset);
        }

        var visibleWidth:Float = w - BORDER_THICKNESS - sampleObject.width;
        var visibleHeight:Float = h - BORDER_THICKNESS - sampleObject.height;
        var prefScaleX = (max.x - min.x) > visibleWidth? visibleWidth/(max.x - min.x) : 1;
        var prefScaleY = (max.y - min.y) > visibleHeight? visibleHeight/(max.y - min.y) : 1;
        preview.scaleX = Math.min(prefScaleX, prefScaleY);
        preview.scaleY = preview.scaleX;
        preview.centre(bg);
        addChild(preview);
    }

    public function new(w:Float, h:Float)
    {
        super();
        this.w = w;
        this.h = h;
        this.bg = Shapes.rect(w, h, 0x001519, BORDER_THICKNESS, Square, 0x1e1e1e);
        this.preview = new Sprite();

        addChild(bg);
    }
}