package graphic.components.mainmenu;

import openfl.display.Sprite;
import openfl.text.TextField;
using graphic.SpriteExtension;

class PlayerXPBar extends Sprite
{
    public function new(level:Int, xp:Int, totalLevelXP:Int) 
    {
        super();

        var roundRadius:Float = 33;

        var levelRound:Sprite = Shapes.round(roundRadius, 0xB68D02, 3, 1, 0xE0AD00, 1);
        var levelText:TextField = TextFields.xpbarLevel('$level');
        var xpProgress:ProgressBar = new ProgressBar(230, 30, 0xF2D269, 2, xp/totalLevelXP, 0xB68D02, 0xE0AD00);
        var xpText:TextField = TextFields.roamXPValue('$xp/$totalLevelXP xp');

        this.add(levelRound, roundRadius, roundRadius);
        this.add(levelText, 0, roundRadius - levelText.textHeight/2 - 4);
        this.add(xpProgress, 58, 18);
        this.add(xpText, xpProgress.x, xpProgress.y);
    }    
}