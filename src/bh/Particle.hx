package bh;

import motion.easing.IEasing;
import openfl.display.Sprite;
import openfl.display.MovieClip;

class Particle extends Sprite
{
    private var mc:MovieClip;
    private var localTime:Int;
    private var traj:ITrajectory;

    public function tick()
    {
        var p = traj.nextPos(localTime);
        x = p.x;
        y = p.y;
        forward();
        localTime += 1;
    }

    private function forward()
    {
        if (mc.currentFrame == mc.totalFrames)
            mc.gotoAndStop(1);
        else 
            mc.nextFrame();
    }

    public function new(prt:MovieClip, traj:ITrajectory)
    {
        super();
        mc = prt;
        mc.stop();
        localTime = 0;
        this.traj = traj;
        addChild(mc);
    }
}