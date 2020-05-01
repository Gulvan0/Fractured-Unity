package bh;

import engine.Vect;

class EmitDirections 
{
    public static function get(id:ID.AbilityID):Array<Vect>
    {
        switch (id)
        {
            case LgElectricalStorm:
                return equal(4, 8);
            default:
                throw 'Directions not found: $id';
        }
    }  
    
    private static function equal(distance:Float, amount:Int, ?startAngle:Float = null):Array<Vect>
    {
        if (startAngle == null)
            startAngle = Math.PI/2;
        var a:Array<Vect> = [];
        for (i in 0...amount)
            a.push(Vect.radial(distance, startAngle + Math.PI * 2 * i / amount));
        return a;
    }
}