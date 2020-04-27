package bh;

import motion.easing.IEasing;

class Trajectories
{

    ///Get static trajectory at (0; 0)
    public static function getStatic():ITrajectory
    {
        return new bh.trajectories.Static(0, 0);
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

    public static function getEmitterTraj(id:ID.AbilityID, ?params:Map<String, BHParameter>, ?easing:IEasing):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Emitter movement not found: $id';
        }
    }
}