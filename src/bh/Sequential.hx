package bh;

import engine.Vect;
import motion.easing.IEasing;
import openfl.display.MovieClip;
import openfl.display.Sprite;

class Sequential extends Sprite
{
    private var ab:ID;
    public var fireOffInterval:Int;
    public var order:Int;
    
    private var localTime:Int;

    public function tick():Array<Particle>
    {
        if(localTime == order * fireOffInterval)
            return emit();
        localTime++;
        return [];
    }

    public function emit():Array<Particle>
    {
        var trj:ITrajectory = EmitTrajectories.getNormal(ab);
        trj.rotate(engine.MathUtils.degreeToRadian(rotation));
        trj.move(new Vect(x, y));
        var prt:Particle = new Particle(Assets.getParticle(ab), trj);
        prt.x = x;
        prt.y = y;
        return [prt];
    }

    public function new(ability:ID, interval:Int, order:Int)
    {
        super();
        ab = ability;
        localTime = 0;
        emitInterval = interval;
        this.order = order;
    }
}