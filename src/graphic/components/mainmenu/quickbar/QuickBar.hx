package graphic.components.mainmenu.quickbar;

import openfl.events.MouseEvent;
import graphic.components.TextWindow.CloseMode;
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
using graphic.Utils;

class QuickBar extends Sprite
{

    private var barHeight:Float = 42;
    private var elementWidth:Float = 140;

    private var items:Map<ItemName, QuickBarItem> = [];
    private var closeBtn:QuickBarClose;
    private var quitConfirmation:TextWindow;
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
        addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);  
        closeBtn.addEventListener(MouseEvent.CLICK, quitRequest);
    }

    private function onRemoved(e)
    {
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
        closeBtn.removeEventListener(MouseEvent.CLICK, quitRequest);
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

    private function quitRequest()
    {
        closeBtn.removeEventListener(MouseEvent.CLICK, quitRequest);
        quitConfirmation = new TextWindow(new RichString("Are you sure you want to quit?"), PopUpMessage, [Decide(quit, cancelQuit, "Quit", "Cancel")]);
        addChild(quitConfirmation);
    }

    private function cancelQuit()
    {
        removeChild(quitConfirmation);
        closeBtn.addEventListener(MouseEvent.CLICK, quitRequest);
    }

    private function quit()
    {
        Sys.exit(0);
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

        closeBtn = new QuickBarClose();
        this.add(closeBtn, width - closeBtn.width, 0);
        
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }
}