package bh;

import bh.enums.DispenserType;
import engine.Vect;
import motion.easing.IEasing;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class Sequential extends Sprite implements IDispenser
{
    private var ab:ID.AbilityID;
    private var properties:PropObj;
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
        var trj:ITrajectory = EmitTrajectories.getNormal(ab, properties);
        trj.rotate(engine.MathUtils.degreeToRadian(rotation));
        trj.move(new Vect(x, y));
        var prt:Particle = new Particle(Assets.getParticle(ab), trj);
        prt.x = x;
        prt.y = y;
        return [prt];
    }

    public function new(ability:ID.AbilityID, properties:PropObj, order:Int)
    {
        super();
        ab = ability;
        this.properties = properties;
        localTime = 0;
        fireAt = order * DanmakuUtils.secondsToTicks(properties.interval);
    }
}