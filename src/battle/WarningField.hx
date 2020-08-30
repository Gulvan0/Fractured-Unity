package battle;

import graphic.TextFields;
import openfl.display.GradientType;
import openfl.geom.Matrix;
import openfl.text.TextField;
import haxe.Timer;
import openfl.display.Sprite;

enum FieldType 
{
    Warn;
    Info;    
}

class WarningField extends Sprite
{
    private var warnBG:Sprite;
    private var infoBG:Sprite;
    private var tf:TextField;
    private var showTimer:Null<Timer>;

    public function appear(text:String, type:FieldType) 
    {
        if (showTimer != null)
            onTimeout();

        tf.text = text;
        tf.visible = true;
        if (type == Warn)
            warnBG.visible = true;
        else
            infoBG.visible = true;

        showTimer = new Timer(3000);
		showTimer.run = onTimeout;
    }

    public function disappear()
    {
        if (showTimer != null)
            onTimeout();
    }

    private function onTimeout() 
    {
        showTimer.stop();
		tf.visible = false; 
		warnBG.visible = false; 
		infoBG.visible = false; 
		showTimer = null;
    }

    private function createBG(color:Int):Sprite
    {
        var box:Sprite = new Sprite();
        var m:Matrix = new Matrix();
        m.createGradientBox(Main.screenW, 30, 0);
        box.graphics.beginGradientFill(GradientType.LINEAR, [color, color, color], [0.25, 1, 0.25], [0, 127, 255], m);
        box.graphics.drawRect(0, 0, Main.screenW, 30);
        return box;
    }

    public function new(?text:String = "") 
    {
        super();
        tf = TextFields.battleWarn(text);
        warnBG = createBG(0xE81E1E);
        infoBG = createBG(0x1E68E8);

        addChild(warnBG);
        addChild(infoBG);
        addChild(tf);
        warnBG.visible = infoBG.visible = false;
        tf.visible = false;
    }
}