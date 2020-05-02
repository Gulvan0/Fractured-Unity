package bh;

import engine.Vect;
import motion.easing.IEasing;
import bh.trajectories.*;

class Trajectories
{

    ///Get static trajectory at (0; 0)
    public static function getStatic():ITrajectory
    {
        return new Static(0, 0);
    }

    ///Get trajectory of a particle that starts from (0; 0)
    public static function getParticleNormal(id:ID.AbilityID, ?params:Map<String, BHParameter>, ?easing:IEasing):ITrajectory
    {
        switch (id)
        {
            case LgElectricalStorm:
                return new Linear(0, 0, new Vect(6, 0), motion.easing.Linear.easeNone);
            case LgAtomicOverload:
                return getStatic();
            case LgHighVoltage:
                return getStatic();
            case LgBallLightning:
                return new Linear(0, 0, new Vect(-4, 0), motion.easing.Expo.easeIn);
            default:
                throw 'Trajectory not found: $id';
        }
    }

    ///Get trajectory of a dispenser that starts from (0; 0)
    public static function getDispenserTraj(id:ID.AbilityID, ?params:Map<String, BHParameter>, ?easing:IEasing):ITrajectory
    {
        switch (id)
        {
            case LgElectricalStorm:
                return getStatic();
            default:
                throw 'Dispenser movement not found: $id';
        }
    }
}