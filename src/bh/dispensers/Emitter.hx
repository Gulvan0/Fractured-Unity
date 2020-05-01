package bh.dispensers;

import bh.trajectories.ITrajectory;
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
    private var normalParticleTraj:ITrajectory;
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
        for (d in EmitDirections.get(ab))
        {
            var trj:ITrajectory = normalParticleTraj.copy();
            trj.rotate(d.angle + MathUtils.degreeToRadian(rotation));
            trj.move(d.plus(new Vect(x, y)));
            var prt:Particle = new Particle(Assets.getParticle(ab), trj);
            prt.x = x + d.dx;
            prt.y = y + d.dy;
            //prt.rotateModel(MathUtils.radianToDegree(d.angle));
            emitted.push(prt);
        }
        return emitted;
    }

    public function dispose(x:Float, y:Float)
    {
        this.x = x;
        this.y = y;
        movementTraj.move(new Vect(x, y));
    }

    public function new(ability:ID.AbilityID, interval:Float, ownParams:Map<String, BHParameter>, emitterEasing:IEasing)
    {
        super();
        ab = ability;
        model = Assets.getDispenser(ab);
        localTime = 0;
        emitInterval = DanmakuUtils.secondsToTicks(interval);
        movementTraj = Trajectories.getDispenserTraj(ability, ownParams, emitterEasing);
        normalParticleTraj = Trajectories.getParticleNormal(ability, ownParams, emitterEasing);
        addChild(this.model);
    }
}