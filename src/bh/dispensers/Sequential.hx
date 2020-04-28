package bh.dispensers;

import bh.enums.DispenserType;
import engine.Vect;
import motion.easing.IEasing;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class Sequential extends Sprite implements IDispenser
{
    private var ab:ID.AbilityID;
    private var ownParams:Map<String, BHParameter>;
    private var particleEasing:IEasing;
    public var fireAt:Int;
    
    private var localTime:Int;

    public function tick():Array<Particle>
    {
        if (localTime == fireAt)
            return emit();
        localTime++;
        return [];
    }

    public function getType():DispenserType
    {
        return DispenserType.Sequential;
    }

    public function emit():Array<Particle>
    {
        var trj:ITrajectory = Trajectories.getParticleNormal(ab, ownParams, particleEasing);
        trj.rotate(engine.MathUtils.degreeToRadian(rotation));
        trj.move(new Vect(x, y));
        var prt:Particle = new Particle(Assets.getParticle(ab), trj);
        prt.x = x;
        prt.y = y;
        return [prt];
    }

    public function new(ability:ID.AbilityID, interval:Float, ownParams:Map<String, BHParameter>, particleEasing:IEasing)
    {
        super();
        ab = ability;
        this.ownParams = ownParams;
        this.particleEasing = particleEasing;
        localTime = 0;
        fireAt = Math.round(ownParams["Order"].value) * DanmakuUtils.secondsToTicks(interval);
    }
}