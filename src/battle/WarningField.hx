package battle;

import graphic.TextFields;
import openfl.display.GradientType;
import openfl.geom.Matrix;
import openfl.text.TextField;
import haxe.Timer;
import openfl.display.Sprite;

class WarningField extends Sprite
{
    private var tf:TextField;
    private var showTimer:Null<Timer>;

    public function appear(text:String) 
    {
        if (showTimer != null)
            showTimer.stop();
        
        tf.text = text;
        visible = true;
        showTimer = new Timer(3000);
		showTimer.run = function () 
		{
			visible = false; 
			showTimer.stop();
			showTimer = null;
		}
    }

    public function new(?text:String = "") 
    {
        super();
        tf = TextFields.battleWarn(text);

        var box:Sprite = new Sprite();
        var m:Matrix = new Matrix();
        m.createGradientBox(Main.screenW, 30, 0);
        box.graphics.beginGradientFill(GradientType.LINEAR, [0xE81E1E, 0xE81E1E, 0xE81E1E], [0.25, 1, 0.25], [0, 127, 255], m);
        box.graphics.drawRect(0, 0, Main.screenW, 30);

        addChild(box);
        addChild(tf);
        visible = false;
    }
}