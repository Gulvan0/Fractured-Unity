package bh;

class EmitTrajectories
{

    ///Get static trajectory at (0; 0)
    public static function getStatic():ITrajectory
    {
        return new bh.trajectories.Static(0, 0);
    }

    ///Get trajectory of a particle that starts from (0; 0), oriented top
    public static function getNormal(id:ID.AbilityID, ?props:PropObj):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Trajectory not found: $id';
        }
    }
}