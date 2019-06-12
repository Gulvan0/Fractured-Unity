package;

import hxassert.Assert;
import graphic.Sounds;
import haxe.ui.core.MouseEvent;
import openfl.media.Sound;
import openfl.events.EventType;
import openfl.events.IEventDispatcher;

class Listeners 
{
    public static function addVocalListener<T>(object:IEventDispatcher, type:EventType<T>, listener:T->Void, ?sound:Sound)
    {
        Assert.require(sound != null || type == MouseEvent.CLICK);
        object.addEventListener(type, function (t:T) 
        {
            if (sound == null)
                if (type == MouseEvent.CLICK)
                    sound = Sounds.CLICK;
            sound.play();
            listener(t);
        });
    }
}