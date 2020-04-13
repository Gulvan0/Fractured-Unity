package bh;

class DispenserFactory
{
    public static function buildDispensers(data:BehaviourData):Array<IDispenser> 
    {
        var dispensers:Array<IDispenser> = [];
        switch (data.props.dispenser)
        {
            case Emitter: 
                for (i in 0...data.pattern.length)
                {
                    var disp = new Emitter(data.ability, data.props);
                    disp.x = data.pattern[i].x;
                    disp.y = data.pattern[i].y;
                    dispensers.push(disp);
                }
            case Sequential:
                for (i in 0...data.pattern.length)
                {
                    var disp = new Sequential(data.ability, data.props, i);
                    disp.x = data.pattern[i].x;
                    disp.y = data.pattern[i].y;
                    dispensers.push(disp);
                }
            case Obstacle:
                //TODO: Create Obstacle class, fill following
                //disp = new Obstacle(data.ability, data.pattern, data.props);
                throw "Not Implemented";
            case Geyser:
                dispensers = [new Geyser(data.ability, data.props)];
        }
        return dispensers;
    }    
}