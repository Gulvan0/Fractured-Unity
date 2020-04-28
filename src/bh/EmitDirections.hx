package bh;

class EmitDirections 
{
    public static function get(id:ID.AbilityID):Array<Vect>
    {
        switch (id)
        {
            default:
                throw 'Directions not found: $id';
        }
    }    
}