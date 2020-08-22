package graphic.components.bheditor;

import motion.Actuate;
import openfl.display.Sprite;

class ScalableBackground extends Sprite
{

    private var bg:Sprite;
    private var lines:Sprite;

    private var currentZoom:Float;

    public function zoomIn()
    {
        if (currentZoom < 1)
        {
            currentZoom += 0.125;
            redrawLines();
        }
    }

    public function zoomOut()
    {
        if (currentZoom > 0.125)
        {
            currentZoom -= 0.125;
            redrawLines();
        }
    }

    private function redrawLines()
    {
        lines.graphics.clear();
        lines.graphics.lineStyle(1, 0x333333);
        var i:Float = 64 * currentZoom;
        while (i < Main.screenW)
        {
            lines.graphics.moveTo(i, -1);
            lines.graphics.lineTo(i, Main.screenH + 1);
            i += 64 * currentZoom;
        }
        var j:Float = 64 * currentZoom;
        while (j < Main.screenH)
        {
            lines.graphics.moveTo(-1, j);
            lines.graphics.lineTo(Main.screenW + 1, j);
            j += 64 * currentZoom;
        }
    }

    public function unfoldAndInit(time:Float)
    {
        Actuate.tween(this, time, {x:-1, y:-1});
        Actuate.tween(bg, time, {scaleX: Main.screenW / width, scaleY: Main.screenH / height}).onComplete(redrawLines);
    }

    public function new ()
    {
        super();
        bg = new Sprite();
        lines = new Sprite();
        currentZoom = 1;
        bg.graphics.beginFill(0x999999);
        bg.graphics.drawRect(0, 0, 1, 1);
        bg.graphics.endFill();
        addChild(bg);
        addChild(lines);
    }
}