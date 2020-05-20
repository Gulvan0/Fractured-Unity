package graphic.components.bheditor;

import openfl.geom.Rectangle;
import openfl.display.DisplayObject;
import openfl.text.TextFormat;
import graphic.Utils.Axis;
import hxassert.Assert;
import openfl.text.TextField;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class ParticleButton extends Sprite
{

    private var button:StickyButton;
    private var countText:TextField;

    private var count:Int;

    public function setCount(c:Int) 
    {
        Assert.require(c >= 0);
        count = c;
        countText.text = "" + count;
    }

    public function decrementCount() 
    {
        count--;
        countText.text = "" + count;
    }

    public function incrementCount() 
    {
        count++;
        countText.text = "" + count;
    }

    public function pushOut()
    {
        button.pushOut();
    }

    public function new(objects:Array<MovieClip>, count:Int, onPush:Void->Void, ?pushed:Bool = false)
    {
        super();
        Assert.assert(objects.length == 3);
        var btn = new BHParticleButton();
        var iconSpace:Rectangle = new Rectangle(2, 2, 55, 40);
        this.count = count;
        for (o in objects)
        {
            o.stop();
            Utils.resizeAccordingly(o, iconSpace.width, iconSpace.height);
            Utils.centreRect(o, iconSpace);
            var offset = Utils.getOffset(o);
            o.x -= offset.x * o.scaleX;
            o.y -= offset.y * o.scaleY;
        }
        button = new StickyButton(btn, onPush, pushed, cast objects);
        countText = new TextField();
        countText.defaultTextFormat = new TextFormat(Fonts.ERAS, 30, 0xFFFFFF);
        countText.defaultTextFormat.letterSpacing = -4;
        setCount(count);
        countText.selectable = false;

        countText.x = button.x + 41;
        countText.y = button.y + 33;
        addChild(button);
        addChild(countText);
    }
}