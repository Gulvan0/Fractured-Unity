package bh;

import haxe.Timer;
import openfl.display.Sprite;
import struct.Element;

class Soul extends Sprite
{
    private var model:Sprite;
    private var blinkTimer:Null<Timer>;
    private var blinkTick:Int = 0;

    private static var BLINKING_DURATION:Int = 3;

    public function blink() 
    {
        if (blinkTimer != null)
            finishBlinking();

        blinkTimer = new Timer(80);
        blinkTimer.run = tickBlinking;
    }

    private function tickBlinking()
    {
        model.alpha = blinkTick % 2 == 0? 0.2 : 1;
        if (blinkTick == BLINKING_DURATION)
            finishBlinking();
        else 
            blinkTick++;
    }

    private function finishBlinking() 
    {
        blinkTimer.stop();
        blinkTimer = null;
        blinkTick = 0;
    }

    public function new(?element:Element) 
    {
        super();
        model = Assets.getSoul(element);
        addChild(model);
    }
}