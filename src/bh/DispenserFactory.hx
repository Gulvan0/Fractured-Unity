package bh;

import openfl.display.Sprite;

class DispenserFactory
{
    public static function buildDispensers(data:BehaviourData):Array<IDispenser> 
    {
        var dispenserType = data.abilityProperties.dispenser;
        if (dispenserType == Geyser)
            return [new Geyser(data.ability, data.abilityProperties.interval, data.abilityProperties.count)];
        if (dispenserType == Obstacle)
            //TODO: Create Obstacle class, fill following
            //disp = new Obstacle(data.ability, data.pattern, data.props);
            throw "Not Implemented";

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
                disp.x = obj.x;
                disp.y = obj.y;
                dispensers.push(disp);
            }
            else if (dispenserType == Sequential)
            {
                var disp = new Sequential(data.ability, data.abilityProperties.interval, obj.params, easing);
                disp.x = obj.x;
                disp.y = obj.y;
                dispensers.push(disp);
            }
        }
        return dispensers;
    }    
}