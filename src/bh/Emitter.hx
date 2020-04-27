package bh;

import bh.enums.DispenserType;
import engine.MathUtils;
import engine.Vect;
import motion.easing.IEasing;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class Emitter extends Sprite implements IDispenser
{
    private var model:MovieClip;

    private var ab:ID.AbilityID;
    private var movementTraj:ITrajectory;
    public var emitInterval:Int;
    
    private var localTime:Int;

    public function tick():Array<Particle>
    {
        var emitted:Array<Particle> = (localTime % emitInterval == 0)? emit() : [];
        var p = movementTraj.nextPos(localTime);
        x = p.x;
        y = p.y;
        localTime++;
        return emitted;
    }

    public function getType():DispenserType
    {
        return DispenserType.Emitter;
    }

    public function emit():Array<Particle>
    {
        var emitted:Array<Particle> = [];
        var positionDeltas:Array<Vect>;
        var normalTraj:ITrajectory = Trajectories.getParticleNormal(ab);
        normalTraj.rotate(MathUtils.degreeToRadian(rotation));
        normalTraj.move(new Vect(x, y));
        for (d in positionDeltas)
        {
            var trj:ITrajectory = normalTraj.copy();
            trj.rotate(d.angle);
            trj.move(d);
            var prt:Particle = new Particle(Assets.getParticle(ab), trj);
            prt.x = x + d.dx;
            prt.y = y + d.dy;
            emitted.push(prt);
        }
        return emitted;
    }

    public function new(ability:ID.AbilityID, interval:Float, ownParams:Map<String, BHParameter>, emitterEasing:IEasing)
    {
        super();
        ab = ability;
        model = Assets.getEmitter(ab);
        localTime = 0;
        emitInterval = DanmakuUtils.secondsToTicks(interval);
        movementTraj = Trajectories.getEmitterTraj(ability, ownParams, emitterEasing);
        addChild(this.model);
    }
}