package graphic.components.bheditor;

import haxe.Timer;
import openfl.display.MovieClip;

abstract TogglingAnimation(MovieClip) from MovieClip to MovieClip
{
    public function toggle()
    {
        if (this.currentFrame == this.totalFrames)
            playBackward();
        else
            playForward();
    }

    public function playForward()
    {
        var t:Timer = new Timer(1000/Main.FPS);
        t.run = function () 
        {
            if (this.currentFrame == this.totalFrames)
                t.stop();
            this.nextFrame();
        }
    }

    public function playBackward()
    {
        var t:Timer = new Timer(1000/Main.FPS);
        t.run = function () 
        {
            if (this.currentFrame == 1)
                t.stop();
            this.prevFrame();
        }
    }

    inline function new(m:MovieClip) 
    {
        m.stop();
        this = m;
    }
}