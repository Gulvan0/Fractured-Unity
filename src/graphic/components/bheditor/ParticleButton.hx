package graphic.components.bheditor;

import openfl.text.TextFormat;
import graphic.Utils.Axis;
import hxassert.Assert;
import openfl.text.TextField;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class ParticleButton extends Sprite
{

    private var button:StickyButton;
    private var xText:TextField;
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

    public function pushIn()
    {   
        button.pushIn();
    }

    public function pushOut()
    {
        button.pushOut();
    }

    public function new(id:ID, count:Int, onPush:Void->Void)
    {
        super();
        this.count = count;
        var layer:Array<Sprite> = [];
        for (i in 0...3)
        {
            var icon = Assets.getParticle(id);
            Utils.centre(icon, new BHParticleButton(), null, true);
            layer.push(icon);
        }
        button = new StickyButton(new BHParticleButton(), onPush, layer);
        xText = new TextField();
        xText.defaultTextFormat = new TextFormat(Fonts.NONAME, Math.floor(button.height) - 5, 0xFFFFFF);
        xText.text = "x";
        xText.selectable = false;
        countText = new TextField();
        countText.defaultTextFormat = new TextFormat(Fonts.NONAME, Math.floor(button.height) - 5, 0xFFFFFF);
        setCount(count);
        countText.selectable = false;

        xText.x = button.x + button.width + 8;
        countText.x = xText.x + xText.textWidth + 5;
        Utils.centre(countText, button, Axis.Y);
        countText.y -= 3;
        xText.y = countText.y - 3;
        addChild(button);
        addChild(xText);
        addChild(countText);
    }
}