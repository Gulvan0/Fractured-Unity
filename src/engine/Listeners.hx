package engine;

import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.display.Stage;
import openfl.events.MouseEvent;
import hxassert.Assert;
import graphic.Sounds;
import openfl.media.Sound;
import openfl.events.EventType;
import openfl.events.IEventDispatcher;

class AreaHandler
{
    private var active(default, null):Bool;
    private var area:Rectangle;

    public var inHandler:Null<MouseEvent->Void>;
    public var outHandler:Null<MouseEvent->Void>;
    public var clickHandler:Null<MouseEvent->Void>;

    public function onMove(e:MouseEvent)
    {
        var inside:Bool = engine.MathUtils.insideC(e.stageX, e.stageY, area);
        if (!active && inside)
            activate(e);
        else if (active && !inside)
            deactivate(e);
    }

    private function activate(cause:MouseEvent)
    {
        active = true;
        if (inHandler != null)
            inHandler(cause);
    }
    
    private function deactivate(cause:MouseEvent)
    {
        active = false;
        if (outHandler != null)
            outHandler(cause);
    }
    
    public function onClick(e:MouseEvent) 
    {
        if (active && clickHandler != null)
            clickHandler(e);
    }

    public function new(stage:Stage, area:Rectangle, inh:Null<MouseEvent->Void>, outh:Null<MouseEvent->Void>, clickh:Null<MouseEvent->Void>)
    {
        this.active = MathUtils.insideC(stage.mouseX, stage.mouseY, area);
        this.area = area;
        this.inHandler = inh;
        this.outHandler = outh;
        this.clickHandler = clickh;
    }
}

class Listeners 
{
    private static var handlers:Map<IEventDispatcher, Map<String, Dynamic->Void>> = [];

    private static var stage:Stage;
    private static var areaHandlers:Map<String, AreaHandler> = [];

    private static function vocalize<T>(handler:T->Void, sound:Sound):T->Void
    {
        return (arg:T) -> {
            sound.play();
            handler(arg);
        };
    }

    private static function add<T>(object:IEventDispatcher, id:String, type:EventType<T>, handler:T->Void)
    {
        if (!handlers.exists(object))
            handlers[object] = new Map();
        else
            Assert.require(!handlers[object].exists(id));

        handlers[object][id] = handler;
        object.addEventListener(type, handlers[object][id]);
    }

    public static function addComplexListener<T>(object:IEventDispatcher, id:String, type:EventType<T>, handlerMap:ConditionTree<T, T->Void>, ?sound:Sound) 
    {
        function handler(t:T)
        {
            var handler = handlerMap.retrieve(t);
            if (handler != null)
                if (sound != null)
                    vocalize(handler, sound)(t);
                else
                    handler(t);
        }
        add(object, id, type, handler);
    }

    public static function addVocalListener<T>(object:IEventDispatcher, id:String, type:EventType<T>, handler:T->Void, ?sound:Sound)
    {
        add(object, id, type, vocalize(handler, sound));
    }

    public static function addOneTimeListener<T>(object:IEventDispatcher, id:String, type:EventType<T>, handler:T->Void, ?sound:Sound)
    {
        function convertedHandler(t:T)
        {
            removeListener(object, id, type);
            if (sound != null)
                vocalize(handler, sound)(t);
            else 
                handler(t);
        }
        
        add(object, id, type, convertedHandler);
    }

    public static function removeListener<T>(object:IEventDispatcher, id:String, type:EventType<T>) 
    {
        if (handlers.exists(object))
            if (handlers[object].exists(id))
            {
                object.removeEventListener(type, handlers[object][id]);
                handlers[object].remove(id);
            }
    }

    public static function init(stageRef:Stage) 
    {
        stage = stageRef;
        stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler);
        stage.addEventListener(MouseEvent.CLICK, clickHandler);
    }

    public static function addCursorAreaListener(id:String, area:Rectangle, ?inHandler:MouseEvent->Void, ?outHandler:MouseEvent->Void, ?clickHandler:MouseEvent->Void)
    {
        areaHandlers[id] = new AreaHandler(stage, area, inHandler, outHandler, clickHandler);
    }

    public static function removeCursorAreaListener(id:String)
    {
        areaHandlers.remove(id);
    }

    private static function moveHandler(e:MouseEvent)
    {
        for (handler in areaHandlers)
            handler.onMove(e);
    }

    private static function clickHandler(e:MouseEvent)
    {
        for (handler in areaHandlers)
            handler.onClick(e);          
    }
}