package graphic.components.mainmenu;

import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import io.AbilityParser;
import ID.AbilityID;
import openfl.display.Sprite;
using graphic.SpriteExtension;

class MainScreen extends Sprite
{

    private function drawBG() 
    {
        var bg = Assets.mainScreenBG();
        var bgscale = Math.max(Main.screenW / bg.width, Main.screenH / bg.height);
        bg.scaleX = bg.scaleY = bgscale;
        addChild(bg);
    }

    public function new() 
    {
        super();
        var ch = Main.player.character;
        var wheel = ch.wheel.map(AbilityID.createByName.bind(_, null));
        var whLevels = [];
        for (id in wheel)
        {
            var pos = AbilityParser.treePositions.get(id);
            whLevels.push(ch.tree[pos.i][pos.j]);
        }
        var unrankedBox:Sprite = PlayerInfobox.unranked(ch.name, Element.createByName(ch.element), ch.level, ch.xp, GameRules.xpToLvlup(ch.level), wheel, whLevels);
        var rankedBox:Sprite = PlayerInfobox.ranked(ch.name, Main.player.rating, []); //TODO: Send/recieve/maintain record data
        var buttonTextFormat = new TextFormat(Fonts.ERAS, 22, 0x000000, null, null, null, null, null, TextFormatAlign.CENTER);
        var playUnranked:GradButton = new GradButton(0x333333, 2, 0x7f7f7f, 0x333333, "Play Unranked", buttonTextFormat, unrankedBox.width, 41);
        var playRanked:GradButton = new GradButton(0x333333, 2, 0x7f7f7f, 0x333333, "Play Ranked", buttonTextFormat, rankedBox.width, 41);

        drawBG();
        this.add(unrankedBox, 264, 118);
        this.add(rankedBox, 782, 118);
        this.add(playUnranked, unrankedBox.x, 610);
        this.add(playRanked, rankedBox.x, 610); //TODO: Listeners - initBattle & popup
    }
}