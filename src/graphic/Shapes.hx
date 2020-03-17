package graphic;

import openfl.display.GradientType;
import openfl.display.LineScaleMode;
import openfl.geom.Matrix;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.display.Sprite;

enum LinearGradientDirection
{
    Up;
    Down;
    Left;
    Right;
}

enum LineStyle
{
    Square;
}

class Shapes
{

    public static function gradRect(width:Float, height:Float, borderColor:Int, borderThickness:Int, borderStyle:LineStyle, fillColour1:Int, fillColour2:Int, dir:LinearGradientDirection):Sprite
    {
        var s:Sprite = new Sprite();
        var m:Matrix = new Matrix();
        m.createGradientBox(width, height, gradRotation(dir));
        s.graphics.lineStyle(borderThickness, borderColor, 1, false, LineScaleMode.NORMAL, caps(borderStyle), joints(borderStyle));
        s.graphics.beginGradientFill(GradientType.LINEAR, [fillColour1, fillColour2], [1, 1], [0, 255], m);
        s.graphics.drawRect(0, 0, width, height);
        return s;
    }

    public static function line(toX:Float, toY:Float, color:Int, thickness:Int):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.lineStyle(thickness, color);
        s.graphics.lineTo(toX, toY);
        return s;
    }

    private static function gradRotation(dir:LinearGradientDirection):Float
    {
        return switch (dir)
        {
            case Up: 3*Math.PI/2;
            case Down: Math.PI/2;
            case Right: 0; 
            case Left: Math.PI;
        }
    }

    private static function caps(style:LineStyle):CapsStyle
    {
        return switch (style)
        {
            case Square: CapsStyle.SQUARE;
        }
    }

    private static function joints(style:LineStyle):JointStyle
    {
        return switch (style)
        {
            case Square: JointStyle.MITER;
        }
    }
}