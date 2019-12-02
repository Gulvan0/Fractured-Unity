package;

import openfl.events.MouseEvent;
import hxassert.Assert;
import graphic.Sounds;
import openfl.media.Sound;
import openfl.events.EventType;
import openfl.events.IEventDispatcher;

class Listeners 
{
    private static var handlers:Map<IEventDispatcher, Map<Int, Dynamic->Void>> = [];

    public static function addVocalListener<T>(object:IEventDispatcher, type:EventType<T>, listener:T->Void, id:Int, ?sound:Sound)
    {
        Assert.require(sound != null || type == MouseEvent.CLICK);
        if (!handlers.exists(object))
            handlers[object] = new Map();
        else
            Assert.require(!handlers[object].exists(id));

        handlers[object][id] = function (t:T) 
        {
            if (sound == null)
                if (type == MouseEvent.CLICK)
                    sound = Sounds.CLICK;
            sound.play();
            listener(t);
        };
        object.addEventListener(type, handlers[object][id]);
    }

    public static function removeVocalListener<T>(object:IEventDispatcher, type:EventType<T>, id:Int) 
    {
        if (handlers.exists(object))
            if (handlers[object].exists(id))
            {
                object.removeEventListener(type, handlers[object][id]);
                handlers[object].remove(id);
            }
    }
}