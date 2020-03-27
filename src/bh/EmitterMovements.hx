package bh;

class EmitterMovements
{
    public static function move(id:ID, emitter:Emitter):ITrajectory
    {
        switch (id)
        {
            default:
                throw 'Emitter movement not found: $id';
        }
    }
}