package bh;

import openfl.display.Sprite;

class DispenserFactory
{
    public static function buildDispensers(data:BehaviourData):Array<IDispenser> 
    {
        var dispenserType = data.abilityProperties.dispenser;
        if (dispenserType == Geyser)
            return [new Geyser(data.ability, data.abilityProperties.interval, data.abilityProperties.count)];
        
        var dispensers:Array<IDispenser> = [];
        for (i in 0...data.pattern.objects.length)
        {
            var obj = data.pattern.objects[i];
            var easing = data.abilityProperties.presetEasing;
            if (easing == null)
                easing = obj.easing;
            
            if (dispenserType == Emitter)
            {
                var disp = new Emitter(data.ability, data.abilityProperties.interval, obj.params, easing);
                disp.dispose(obj.x, obj.y);
                dispensers.push(disp);
            }
            else if (dispenserType == Sequential)
            {
                var disp = new Sequential(data.ability, data.abilityProperties.interval, obj.params, easing);
                disp.x = obj.x;
                disp.y = obj.y;
                dispensers.push(disp);
            }
            else if (dispenserType == Obstacle)
            {
                var disp = new Obstacle(data.ability, obj.params, easing);
                disp.x = obj.x;
                disp.y = obj.y;
                dispensers.push(disp);
            }
            else
                throw "Not Implemented";
        }
        return dispensers;
    }    
}