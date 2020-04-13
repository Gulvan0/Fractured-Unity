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
    private var properties:PropObj;
    public var emitInterval:Int;
    
    private var localTime:Int;

    public function tick():Array<Particle>
    {
        var emitted:Array<Particle> = (localTime % emitInterval == 0)? emit() : [];
        EmitterMovements.move(ab, this, properties);
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
        var normalTraj:ITrajectory = EmitTrajectories.getNormal(ab, properties);
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

    public function new(ability:ID.AbilityID, properties:PropObj)
    {
        super();
        ab = ability;
        this.properties = properties;
        model = Assets.getEmitter(ab);
        localTime = 0;
        emitInterval = DanmakuUtils.secondsToTicks(properties.interval);
        addChild(this.model);
    }
}