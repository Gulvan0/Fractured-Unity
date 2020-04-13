package bh;

import haxe.Timer;
import openfl.display.Sprite;
import struct.Element;

class Soul extends Sprite
{
    private var model:Sprite;

    public function blink() 
    {
        var timer:Timer;
        var t:Int = 0;
        function tick()
        {
            model.alpha = t % 2 == 0? 0.3 : 1;
            if (t == 3)
                timer.stop();
            else 
                t++;
        }
        timer = new Timer(80);
        timer.run = tick;
    }

    public function new(element:Element) 
    {
        super();
        model = Assets.getSoul(element);
        addChild(model);
    }
}