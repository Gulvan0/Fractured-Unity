package graphic.components;

import haxe.ui.core.MouseEvent;
import openfl.display.Sprite;
import openfl.geom.Rectangle;
import haxe.ui.components.TextField.TextFieldDefaultPasswordBehaviour;
import openfl.text.TextFormatAlign;
import openfl.filters.DropShadowFilter;
import openfl.text.TextField;

class BattleResults extends SSprite
{
    public var blockWidth:Float = Main.screenW * 0.5;
    public var blockHeight:Float = Main.screenH * 0.9;
    private var LOGIN_TF_WIDTH:Float = 200;
    private var BLINE_HEIGHT:Float = 200;
    private var REWARD_INFO_OFFSET:Float = 50;

    private var winLossHeader:WinHeader = new WinHeader();
    private var allyTextfields:Array<TextField> = [];
    private var enemyTextfields:Array<TextField> = [];
    private var versusSign:VersusSign = new VersusSign();
    private var ratingSign:RatingRewardSign = new RatingRewardSign();
    private var xpSign:XPRewardSign = new XPRewardSign();
    private var ratingRewardTF:TextField = new TextField();
    private var xpRewardTF:TextField = new TextField();
    private var continueButton:ContinueButton = new ContinueButton();

    private var aLine:SSprite = new SSprite();
    private var bLine:SSprite = new SSprite();
    private var cLine:SSprite = new SSprite();
    private var dLine:SSprite = new SSprite();

    public function new(allies:Array<String>, enemies:Array<String>, xpReward:Int, ratingReward:Int, continueHandler:Void->Void) 
    {
        super();
        for (a in allies)
        {
            var tf:TextField = new TextField();
            tf.text = a;
            tf.width = LOGIN_TF_WIDTH;
            tf.wordWrap = false;
            tf.selectable = false;
            tf.setTextFormat(new openfl.text.TextFormat(Fonts.TREBUCHETBOLD, 22, 0x999999, null, true, null, null, null, TextFormatAlign.CENTER));
        }
        for (e in enemies)
        {
            var tf:TextField = new TextField();
            tf.text = e;
            tf.width = LOGIN_TF_WIDTH;
            tf.wordWrap = false;
            tf.selectable = false;
            tf.setTextFormat(new openfl.text.TextFormat(Fonts.TREBUCHETBOLD, 22, 0x999999, null, true, null, null, null, TextFormatAlign.CENTER));
        }

        ratingRewardTF.text = ratingReward + "";
        ratingRewardTF.setTextFormat(new openfl.text.TextFormat(Fonts.BUFF, 20, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.CENTER));
        ratingRewardTF.filters = [new DropShadowFilter(3, 35, 0, 1, 0, 0)];
        xpRewardTF.text = xpReward + "";
        xpRewardTF.setTextFormat(new openfl.text.TextFormat(Fonts.BUFF, 20, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.CENTER));
        xpRewardTF.filters = [new DropShadowFilter(3, 35, 0, 1, 0, 0)];

        winLossHeader.x = (blockWidth - winLossHeader.width) / 2;
        aLine.addChild(winLossHeader);

        bLine.width = blockWidth;
        bLine.height = BLINE_HEIGHT;
        Utils.justifyTF(allyTextfields, bLine, false);
        for (tf in allyTextfields) 
        {
            tf.x = 0;
            bLine.addChild(tf);
        }
        Utils.justifyTF(enemyTextfields, bLine, false);
        for (tf in enemyTextfields)
        {
            tf.x = bLine.width - LOGIN_TF_WIDTH;
            bLine.addChild(tf);
        }
        var freeSpace:Sprite = new Sprite();
        freeSpace.x = LOGIN_TF_WIDTH;
        freeSpace.y = 0;
        freeSpace.width = bLine.width - 2 * LOGIN_TF_WIDTH;
        freeSpace.height = bLine.height;
        Utils.centre(versusSign, freeSpace);
        bLine.addChild(versusSign);

        var rewardSideOffset:Float = (blockWidth - ratingSign.width - xpSign.width - REWARD_INFO_OFFSET)/2;
        ratingSign.x = rewardSideOffset;
        ratingSign.y = 0;
        xpSign.x = blockWidth - rewardSideOffset - xpSign.width;
        xpSign.y = 0;
        cLine.addChild(ratingSign);
        cLine.addChild(xpSign);

        ratingRewardTF.width = ratingSign.width;
        ratingRewardTF.x = ratingSign.x;
        ratingRewardTF.y = ratingSign.y + ratingSign.height + 5;
        xpRewardTF.width = xpSign.width;
        xpRewardTF.x = xpSign.x;
        xpRewardTF.y = xpSign.y + xpSign.height + 5;
        cLine.addChild(ratingRewardTF);
        cLine.addChild(xpRewardTF);
        
        continueButton.x = (blockWidth - continueButton.width) / 2;
        dLine.addChild(continueButton);

        this.width = blockWidth;
        this.height = blockHeight;
        Utils.justify([aLine, bLine, cLine, dLine], this, false);
        addChild(aLine);
        addChild(bLine);
        addChild(cLine);
        addChild(dLine);

        var f:MouseEvent->Void;
        f = function (e)
        {
            continueButton.removeEventListener(MouseEvent.CLICK, f);
            continueHandler();
        }
        continueButton.addEventListener(MouseEvent.CLICK, f);
    }
}