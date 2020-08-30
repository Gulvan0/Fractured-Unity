package graphic.components.abilityscreen;

import openfl.display.Sprite;
using graphic.SpriteExtension;

class BHPreviewBox extends Sprite
{
    private var w:Float;
    private var h:Float;
    private var bg:Sprite;
    private var preview:Sprite;

    private var BORDER_THICKNESS:Int = 5;

    public function redraw(pattern:String)
    {
        removeChild(preview);
        preview = new Sprite();

        if (str == "")
            return;

        var pos:Array<Dynamic> = Json.parse(str);
        
        if (Lambda.empty(pos))
            return;

        var particleBased:Bool = AbilityParser.isParticleBased(ability);
            
        var min:Point = new Point(GameRules.bhSoulX, GameRules.bhSoulY);
        var max:Point = new Point(GameRules.bhSoulX, GameRules.bhSoulY);
        var sampleObject = particleBased? Assets.getParticle(ability) : Assets.getDispenser(ability);
        preview.add(Assets.getSoul(), GameRules.bhSoulX, GameRules.bhSoulY);
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
        for (p in pos)
        {
            var obj = particleBased? Assets.getParticle(ability) : Assets.getDispenser(ability);
            preview.add(obj, p.x-min.x+(5+sampleObject.width)/2, p.y-min.y+(5+sampleObject.height)/2);
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
        this.w = w;
        this.h = h;
        this.bg = Shapes.rect(w, h, 0x001519, BORDER_THICKNESS, Square, 0x1e1e1e);
        this.preview = new Sprite();
    }
}