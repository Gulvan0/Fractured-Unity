package graphic.components;

import haxe.ui.core.MouseEvent;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import haxe.ui.components.TextField.TextFieldDefaultPasswordBehaviour;
import openfl.text.TextFormatAlign;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;
using Listeners;

class BattleResults extends SSprite
{
    public var blockWidth:Float = Main.screenW * 0.5;
    public var blockHeight:Float = Main.screenH * 0.75;
    private var LOGIN_TF_WIDTH:Float = 200;
    private var BLINE_HEIGHT:Float = 200;
    private var REWARD_INFO_OFFSET:Float = 50;

    public var winLossHeader:Sprite = new WinHeader();
    private var allyTextfields:Array<TextField> = [];
    private var enemyTextfields:Array<TextField> = [];
    private var versusSign:VersusSign = new VersusSign();
    private var ratingSign:RatingRewardSign = new RatingRewardSign();
    private var xpSign:XPRewardSign = new XPRewardSign();
    private var ratingRewardTF:TextField = new TextField();
    private var xpRewardTF:TextField = new TextField();
    private var continueButton:ContinueButton = new ContinueButton();

    public var aLine:SSprite = new SSprite();
    public var bLine:SSprite = new SSprite();
    public var cLine:SSprite = new SSprite();
    public var dLine:SSprite = new SSprite();

    public function new(win:Null<Bool>, allies:Array<String>, enemies:Array<String>, xpReward:Int, ratingReward:Int, continueHandler:Void->Void) 
    {
        super();
        winLossHeader = switch (win) {
            case true: new WinHeader();
            case false: new LossHeader();
            case null: new DrawHeader();
        }

        for (a in allies)
        {
            var tf:TextField = new TextField();
            tf.text = a;
            tf.width = LOGIN_TF_WIDTH;
            tf.wordWrap = false;
            tf.selectable = false;
            tf.setTextFormat(new openfl.text.TextFormat(Fonts.TREBUCHETBOLD, 35, 0x999999, null, true, null, null, null, TextFormatAlign.RIGHT));
            tf.height = tf.textHeight + 5;
            allyTextfields.push(tf);
        }
        for (e in enemies)
        {
            var tf:TextField = new TextField();
            tf.text = e;
            tf.width = LOGIN_TF_WIDTH;
            tf.wordWrap = false;
            tf.selectable = false;
            tf.setTextFormat(new openfl.text.TextFormat(Fonts.TREBUCHETBOLD, 35, 0x999999, null, true, null, null, null, TextFormatAlign.LEFT));
            tf.height = tf.textHeight + 5;
            enemyTextfields.push(tf);
        }

        ratingRewardTF.text = ratingReward + "";
        ratingRewardTF.setTextFormat(new openfl.text.TextFormat(Fonts.BUFF, 20, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.CENTER));
        ratingRewardTF.filters = [new DropShadowFilter(3, 35, 0, 1, 0, 0)];
        ratingRewardTF.selectable = false;
        xpRewardTF.text = xpReward + "";
        xpRewardTF.setTextFormat(new openfl.text.TextFormat(Fonts.BUFF, 20, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.CENTER));
        xpRewardTF.filters = [new DropShadowFilter(3, 35, 0, 1, 0, 0)];
        xpRewardTF.selectable = false;

        winLossHeader.x = (blockWidth - winLossHeader.width) / 2;
        aLine.addChild(winLossHeader);

        bLine.addChild(generateRect(blockWidth, BLINE_HEIGHT));
        Utils.justifyTF(allyTextfields, 0, BLINE_HEIGHT, false, true);
        for (tf in allyTextfields) 
            bLine.add(tf, 0, tf.y);
        Utils.justifyTF(enemyTextfields, 0, BLINE_HEIGHT, false, true);
        for (tf in enemyTextfields)
            bLine.add(tf, blockWidth - LOGIN_TF_WIDTH, tf.y);
        Utils.centre(versusSign, generateRect(blockWidth - 2 * LOGIN_TF_WIDTH, BLINE_HEIGHT, LOGIN_TF_WIDTH, 0));
        bLine.addChild(versusSign);

        var rewardSideOffset:Float = (blockWidth - ratingSign.width - xpSign.width - REWARD_INFO_OFFSET)/2;
        cLine.add(ratingSign, rewardSideOffset, Math.max(0, xpSign.height - ratingSign.height));
        cLine.add(xpSign, blockWidth - rewardSideOffset - xpSign.width, Math.max(0, ratingSign.height - xpSign.height));

        ratingRewardTF.width = ratingSign.width;
        ratingRewardTF.height = ratingRewardTF.textHeight + 5;
        xpRewardTF.width = xpSign.width;
        xpRewardTF.height = xpRewardTF.textHeight + 5;
        var rewardTextY:Float = Math.max(ratingSign.y + ratingSign.height + 5, xpSign.y + xpSign.height + 5);
        cLine.add(ratingRewardTF, ratingSign.x, rewardTextY);
        cLine.add(xpRewardTF, xpSign.x, rewardTextY);
        
        continueButton.x = (blockWidth - continueButton.width) / 2;
        dLine.addChild(continueButton);

        Utils.justify([aLine, bLine, cLine, dLine], 0, blockHeight, false);
        addChild(aLine);
        addChild(bLine);
        addChild(cLine);
        addChild(dLine);
        
        var f:MouseEvent->Void;
        f = function (e)
        {
            continueButton.removeVocalListener(MouseEvent.CLICK, 1);
            continueHandler();
        }
        continueButton.addVocalListener(MouseEvent.CLICK, f, 1);
    }

    private function generateRect(width:Float, height:Float, ?x:Float = 0, ?y:Float = 0, ?visible:Bool = false):Sprite
    {
        var rect:Sprite = new Sprite();
        if (visible) rect.graphics.lineStyle(2);
        rect.graphics.drawRect(0, 0, width, height);
        rect.x = x;
        rect.y = y;
        rect.visible = visible;
        return rect;
    }
}