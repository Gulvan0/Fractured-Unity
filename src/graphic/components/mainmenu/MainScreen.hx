package graphic.components.mainmenu;

import ConnectionManager.BattleData;
import openfl.events.Event;
import openfl.events.MouseEvent;
import graphic.components.TextWindow.TextWindowSize;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import io.AbilityParser;
import ID.AbilityID;
import openfl.display.Sprite;
using graphic.SpriteExtension;
using graphic.Utils;

class MainScreen extends Sprite
{
    private var playUnranked:GradButton;
    private var playRanked:GradButton;
    private var matchFoundCallback:BattleData->Void;

    private function drawBG() 
    {
        var bg = Assets.mainScreenBG();
        var bgscale = Math.max(Main.screenW / bg.width, Main.screenH / bg.height);
        bg.scaleX = bg.scaleY = bgscale;
        addChild(bg);
    }

    private function onUnrankedClick(?e)
    {
        removeListeners();
        ConnectionManager.findMatch(matchFoundCallback);
		var lfgwindow = new TextWindow(new RichString("Looking for a game..."));
		lfgwindow.centre();
		addChild(lfgwindow); //TODO: [Improvements Patch] Add close button on timeout
    }

    private function onRankedClick(?e)
    {
        var popup:TextWindow;

        function onClose()
        {
            removeChild(popup);
            addListeners();
        }

        removeListeners();
        popup = new TextWindow(new RichString("Ranked mode is sheduled for &008000[alpha 5.1]. For now, you can earn rating in unranked games"), PopUpMessage, onClose);
        popup.centre();
        addChild(popup);
    }

    private function removeListeners()
    {
        playUnranked.removeEventListener(MouseEvent.CLICK, onUnrankedClick);
        playRanked.removeEventListener(MouseEvent.CLICK, onRankedClick);
    }

    private function addListeners()
    {
        playUnranked.addEventListener(MouseEvent.CLICK, onUnrankedClick);
        playRanked.addEventListener(MouseEvent.CLICK, onRankedClick);
    }

    private function onAddedToStage(?e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addListeners();
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onRemovedFromStage(?e)
    {
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
        removeListeners();
    }

    public function new(matchFoundCallback:BattleData->Void) 
    {
        super();
        this.matchFoundCallback = matchFoundCallback;

        var ch = Main.player.character;
        var wheel = ch.wheel.map(AbilityID.createByName.bind(_, null));
        var whLevels = [];
        for (id in wheel)
            if (id != EmptyAbility)
            {
                var pos = AbilityParser.treePositions.get(id);
                whLevels.push(ch.tree[pos.i][pos.j]);
            }
            else
                whLevels.push(1);
        var unrankedBox:Sprite = PlayerInfobox.unranked(ch.name, Element.createByName(ch.element), ch.level, ch.xp, GameRules.xpToLvlup(ch.level), wheel, whLevels);
        var rankedBox:Sprite = PlayerInfobox.ranked(ch.name, Main.player.rating, Main.record);
        var buttonTextFormat = new TextFormat(Fonts.ERAS, 22, 0x000000, null, null, null, null, null, TextFormatAlign.CENTER);
        playUnranked = new GradButton(0x333333, 2, 0x7f7f7f, 0x333333, "Play Unranked", buttonTextFormat, unrankedBox.width, 41);
        playRanked = new GradButton(0x333333, 2, 0x7f7f7f, 0x333333, "Play Ranked", buttonTextFormat, rankedBox.width, 41);

        drawBG();
        this.add(unrankedBox, 264, 118);
        this.add(rankedBox, 782, 118);
        this.add(playUnranked, unrankedBox.x, 610);
        this.add(playRanked, rankedBox.x, 610);

        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
}