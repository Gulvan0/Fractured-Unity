package battle;

import graphic.components.hints.BasicHint;
import graphic.RichString;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.display.Sprite;
using graphic.SpriteExtension;

class SpecialButtons extends Sprite 
{
    private var pass:Pass;
    private var offerDraw:OfferDraw;
    private var leaveBattle:LeaveBattle;

    private final X_OFFSET:Float = 10;
    private final FIRST_Y:Float = 160;
    private final Y_INTERVAL:Float = 5;

    public function terminate(e)
    {
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
        pass.removeEventListener(MouseEvent.CLICK, ConnectionManager.skipTurn);
        //offerDraw.removeEventListener(MouseEvent.CLICK, ConnectionManager.offerDraw);
        leaveBattle.removeEventListener(MouseEvent.CLICK, ConnectionManager.abandon);
        pass.disableHint();
        //offerDraw.disableHint();
        leaveBattle.disableHint();
    }

    public function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        pass.addEventListener(MouseEvent.CLICK, ConnectionManager.skipTurn);
        //offerDraw.addEventListener(MouseEvent.CLICK, ConnectionManager.offerDraw);
        leaveBattle.addEventListener(MouseEvent.CLICK, ConnectionManager.abandon);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new()
    {
        super();

        pass = new Pass();
        offerDraw = new OfferDraw();
        leaveBattle = new LeaveBattle();

        pass.buttonMode = true;
        offerDraw.buttonMode = true;
        leaveBattle.buttonMode = true;

        pass.setHint(new BasicHint(new RichString("Pass"), new RichString("Skip the current turn")));
        //offerDraw.setHint(new BasicHint(new RichString("Offer Draw"), new RichString("Offer Draw to an opponent")));
        leaveBattle.setHint(new BasicHint(new RichString("Concede"), new RichString("Resign and quit")));

        var rightX = Main.screenW - X_OFFSET - offerDraw.width;
        this.add(pass, X_OFFSET, FIRST_Y);
        this.add(leaveBattle, rightX, FIRST_Y);
        /*this.add(offerDraw, rightX, FIRST_Y);
        this.add(leaveBattle, rightX, FIRST_Y + offerDraw.height + Y_INTERVAL);*/

        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}