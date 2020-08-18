package bh.dispensers;

import motion.easing.IEasing;
import engine.MathUtils;
import engine.Vect;
import bh.enums.DispenserType;
import bh.trajectories.ITrajectory;
import openfl.display.Sprite;

class Obstacle extends Sprite implements IDispenser
{
    private var ab:ID.AbilityID;
    private var particleTraj:ITrajectory;
    private var prtGenerated:Bool;

    public function tick():Array<Particle>
    {
        if (!prtGenerated)
        {
            prtGenerated = true;
            particleTraj.rotate(MathUtils.degreeToRadian(rotation));
            particleTraj.move(new Vect(x, y));
            var prt:Particle = new Particle(Assets.getParticle(ab), particleTraj);
            prt.x = x;
            prt.y = y;
            prt.rotation = rotation;
            return [prt];
        }
        else
            return [];
    }

    public function getType():DispenserType
    {
        return DispenserType.Obstacle;
    }

    public function new(ability:ID.AbilityID, ownParams:Map<String, BHParameter>, emitterEasing:IEasing)
    {
        super();
        ab = ability;
        prtGenerated = false;
        particleTraj = Trajectories.getParticleNormal(ability, ownParams, emitterEasing);
    }
}