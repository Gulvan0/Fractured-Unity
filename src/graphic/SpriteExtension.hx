package graphic;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

class SpriteExtension 
{
    public static function add(container:Sprite, object:DisplayObject, x:Float, y:Float)
    {
        object.x = x;
        object.y = y;
        container.addChild(object);
    }    
}