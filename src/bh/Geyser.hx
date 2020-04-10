package bh;

import engine.MathUtils;
import engine.Vect;
import motion.easing.IEasing;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class Geyser
{
    private var ab:ID.AbilityID;
    public var interval:Int;
    public var count:Int;
    
    private var localTime:Int;

    public function tick():Array<Particle>
    {
        if(localTime % interval == 0)
            return emit();
        localTime++;
        return [];
    }

    public function emit():Array<Particle>
    {
        var emitted:Array<Particle> = [];
        var staticTrj:ITrajectory = EmitTrajectories.getStatic();
        for (i in 0...count)
        {
            var posX:Float = MathUtils.randomFloat(0, GameRules.bhRectW);//fill
            var posY:Float = MathUtils.randomFloat(0, GameRules.bhRectH);//fill
            var trj:ITrajectory = staticTrj.copy();
            trj.move(new Vect(posX, posY));
            var prt:Particle = new Particle(Assets.getParticle(ab), trj);
            prt.x = posX;
            prt.y = posY;
            emitted.push(prt);
        }
        return emitted;
    }

    public function new(ability:ID.AbilityID, interval:Int, count:Int)
    {
        ab = ability;
        localTime = 0;
        this.interval = interval;
        this.count = count;
    }
}