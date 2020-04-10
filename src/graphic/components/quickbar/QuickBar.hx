package graphic.components.quickbar;

import graphic.Shapes.LinearGradientDirection;
import openfl.display.CapsStyle;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import graphic.components.quickbar.QuickBarItem.ItemName;
import engine.Listeners;

class QuickBar extends SSprite
{

    private var barHeight:Float = 42;
    private var elementWidth:Float = 132;

    private var items:Map<ItemName, QuickBarItem> = [];

    private function onAdded(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        for (item in items.keys())
        {
            var it = items[item];
            var stagePos = localToGlobal(new Point(it.x, it.y));
            Listeners.addCursorAreaListener("qb/" + item.getName(), new Rectangle(stagePos.x, stagePos.y, it.width, barHeight), it.onHover, it.onOut);
        } 
        addEventListener(Event.REMOVED_FROM_STAGE, onAdded);  
    }

    private function onRemoved(e)
    {
        addEventListener(Event.REMOVED_FROM_STAGE, onAdded);
        for (item in items.keys())
            Listeners.removeCursorAreaListener("qb/" + item.getName());
    }

    public function new()
    {
        super();
        addChild(Shapes.gradRect(Main.screenW, barHeight, 0x00424F, 2, Shapes.LineStyle.Square, 0x13505C, 0x035F70, LinearGradientDirection.Up));
        var merge:Float = 0;
        for (item in ItemName.createAll())
        {
            var it:QuickBarItem = new QuickBarItem(item, elementWidth);
            items[item] = it;
            add(it, 286 + merge, 0);
            merge += elementWidth;
        }
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }
}