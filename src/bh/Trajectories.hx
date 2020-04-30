package bh;

import motion.easing.IEasing;
import bh.trajectories.*;

class Trajectories
{

    ///Get static trajectory at (0; 0)
    public static function getStatic():ITrajectory
    {
        return new Static(0, 0);
    }

    ///Get trajectory of a particle that starts from (0; 0), oriented top
    public static function getParticleNormal(id:ID.AbilityID, ?params:Map<String, BHParameter>, ?easing:IEasing):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Trajectory not found: $id';
        }
    }

    ///Get trajectory of a dispenser that starts from (0; 0), oriented top
    public static function getDispenserTraj(id:ID.AbilityID, ?params:Map<String, BHParameter>, ?easing:IEasing):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Dispenser movement not found: $id';
        }
    }
}