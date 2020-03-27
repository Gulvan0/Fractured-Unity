package bh;

class EmitTrajectories
{
    ///Get trajectory of a particle that starts from (0; 0), oriented top
    public static function getNormal(id:ID, ?props:PropObj):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Trajectory not found: $id';
        }
    }
}