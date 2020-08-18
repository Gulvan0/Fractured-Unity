package graphic.components.mainmenu.quickbar;

import graphic.components.mainmenu.quickbar.QuickBarItem.QuickBarStyle;
import openfl.display.Sprite;
import graphic.Shapes.LinearGradientDirection;
import openfl.display.CapsStyle;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import graphic.components.mainmenu.quickbar.QuickBarItem.ItemName;
import engine.Listeners;
using graphic.SpriteExtension;

class QuickBar extends Sprite
{

    private var barHeight:Float = 42;
    private var elementWidth:Float = 140;

    private var items:Map<ItemName, QuickBarItem> = [];
    private var onClickCallbacks:Map<ItemName, Void->Void>;

    private function onAdded(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        for (item in items.keys())
        {
            var it = items[item];
            var stagePos = localToGlobal(new Point(it.x, it.y));
            Listeners.addCursorAreaListener("qb/" + item.getName(), new Rectangle(stagePos.x, stagePos.y, it.width, barHeight), it.onHover, it.onOut, onClick.bind(item));
        } 
        addEventListener(Event.REMOVED_FROM_STAGE, onAdded);  
    }

    private function onRemoved(e)
    {
        addEventListener(Event.REMOVED_FROM_STAGE, onAdded);
        for (item in items.keys())
            Listeners.removeCursorAreaListener("qb/" + item.getName());
    }

    private function onClick(item:ItemName, e) 
    {
        var correspondingStyle:QuickBarStyle = switch item {
            case MainScreen: QuickBarStyle.MainScreen;
            case Character: QuickBarStyle.Character;
        }
        changeStyle(correspondingStyle);
        onClickCallbacks[item]();
    }

    private function changeStyle(newStyle:QuickBarStyle) 
    {
        for (it in items)
            it.changeStyle(newStyle);
    }

    public function new(startStyle:QuickBarStyle, onClickCallbacks:Map<ItemName, Void->Void>)
    {
        super();
        this.onClickCallbacks = onClickCallbacks;
        addChild(Shapes.gradRect(Main.screenW, barHeight, 0x4F4F4F, 2, Shapes.LineStyle.Square, 0x5c5c5c, 0x707070, LinearGradientDirection.Up));
        var merge:Float = 0;
        for (item in ItemName.createAll())
        {
            var it:QuickBarItem = new QuickBarItem(item, elementWidth, startStyle);
            items[item] = it;
            this.add(it, 75 + merge, 0);
            merge += elementWidth;
        }
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }
}