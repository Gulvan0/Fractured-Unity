package graphic;

import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

class SpriteExtension 
{
    private static var overHandlers:Map<DisplayObject, MouseEvent->Void> = [];
    private static var outHandlers:Map<DisplayObject, ?MouseEvent->Void> = [];
    private static var hints:Map<DisplayObject, Sprite> = [];

    public static function add(container:Sprite, object:DisplayObject, x:Float, y:Float)
    {
        object.x = x;
        object.y = y;
        container.addChild(object);
    }    

    public static inline function bottomY(s:DisplayObject):Float
    {
        return s.y + s.height;
    }

    public static inline function rightX(s:DisplayObject):Float
    {
        return s.x + s.width;
    }

    private static function enableHint(s:DisplayObject, hint:Sprite, blockChildren:Bool)
    {
        function onMove(e:MouseEvent)
        {
            hints[s].x = (e.stageX + hints[s].width < Main.screenW)? e.stageX : e.stageX - hints[s].width;
            hints[s].y = (e.stageY + hints[s].height < Main.screenH)? e.stageY : e.stageY - hints[s].height;
        }

        function onOver(e:MouseEvent)
        {
            onMove(e);
            s.stage.addChild(hints[s]);
            s.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
        }

        function onOut(?e:MouseEvent)
        {
            s.stage.removeChild(hints[s]);
            s.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
        }

        hints.set(s, hint);
        hints[s].mouseEnabled = false;
        if (blockChildren)
            hints[s].mouseChildren = false;
        s.addEventListener(MouseEvent.MOUSE_OVER, onOver);
        s.addEventListener(MouseEvent.MOUSE_OUT, onOut);
        overHandlers.set(s, onOver);
        outHandlers.set(s, onOut);
    }

    public static function setHint(s:DisplayObject, hint:Sprite, ?blockChildren:Bool = true)
    {
        var onAdded:Event->Void;
        onAdded = function (?e)
        {
            s.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
            enableHint(s, hint, blockChildren);
        }

        if (s.stage == null)
            s.addEventListener(Event.ADDED_TO_STAGE, onAdded);
        else
            enableHint(s, hint, blockChildren);
    }

    public static function disableHint(s:DisplayObject)
    {
        s.removeEventListener(MouseEvent.MOUSE_OVER, overHandlers[s]);
        s.removeEventListener(MouseEvent.MOUSE_OUT, outHandlers[s]);
        if (s.hasEventListener(MouseEvent.MOUSE_MOVE))
            outHandlers[s]();
        hints.remove(s);
        overHandlers.remove(s);
        outHandlers.remove(s);
    }
}