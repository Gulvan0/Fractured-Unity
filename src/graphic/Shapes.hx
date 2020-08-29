package graphic;

import openfl.text.TextField;
import openfl.display.DisplayObject;
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

    public static function gradFillOnlyRect(width:Float, height:Float, fillColour1:Int, fillColour2:Int, dir:LinearGradientDirection, ?alpha1:Float = 1, ?alpha2:Float = 1):Sprite
    {
        var s:Sprite = new Sprite();
        var m:Matrix = new Matrix();
        m.createGradientBox(width, height, gradRotation(dir));
        s.graphics.beginGradientFill(GradientType.LINEAR, [fillColour1, fillColour2], [alpha1, alpha2], [0, 255], m);
        s.graphics.drawRect(0, 0, width, height);
        return s;
    }

    public static function rect(width:Float, height:Float, borderColor:Int, borderThickness:Int, borderStyle:LineStyle, fillColour:Int, ?fillAlpha:Float):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.lineStyle(borderThickness, borderColor, 1, false, LineScaleMode.NORMAL, caps(borderStyle), joints(borderStyle));
        s.graphics.beginFill(fillColour, fillAlpha);
        s.graphics.drawRect(0, 0, width, height);
        return s;
    }

    public static function fillOnlyRect(width:Float, height:Float, fillColour:Int, ?xOffset:Float = 0, ?yOffset:Float = 0, ?fillAlpha:Float):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.beginFill(fillColour, fillAlpha);
        s.graphics.drawRect(xOffset, yOffset, width, height);
        return s;
    }

    public static function noFillRect(width:Float, height:Float, borderColor:Int, borderThickness:Int, borderStyle:LineStyle):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.lineStyle(borderThickness, borderColor, 1, false, LineScaleMode.NORMAL, caps(borderStyle), joints(borderStyle));
        s.graphics.drawRect(0, 0, width, height);
        return s;
    }

    public static function round(radius:Float, borderColor:Int, borderThickness:Int, borderAlpha:Float, fillColour:Int, fillAlpha:Float):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.lineStyle(borderThickness, borderColor, borderAlpha);
        s.graphics.beginFill(fillColour, fillAlpha);
        s.graphics.drawCircle(0, 0, radius);
        return s;
    }

    public static function line(toX:Float, toY:Float, color:Int, thickness:Float, ?fromX:Float = 0, ?fromY:Float = 0):Sprite
    {
        var s:Sprite = new Sprite();
        s.graphics.moveTo(fromX, fromY);
        s.graphics.lineStyle(thickness, color);
        s.graphics.lineTo(toX, toY);
        return s;
    }

    public static function cross(color:Int, width:Float, thickness:Float):Sprite
    {
        var s:Sprite = new Sprite();
        s.addChild(line(width/2, width/2, color, thickness, -width/2, -width/2));
        s.addChild(line(-width/2, width/2, color, thickness, width/2, -width/2));
        return s;
    }

    public static function rotatedSquare(radius:Float, fillColour:Int, ?borderColor:Int, ?borderThickness:Int, ?fillAlpha:Float = 1):Sprite
    {
        var s:Sprite = new Sprite();
        if (borderThickness != null)
            s.graphics.lineStyle(borderThickness, borderColor);
        s.graphics.beginFill(fillColour, fillAlpha);
        s.graphics.moveTo(0, -radius);
        s.graphics.lineTo(radius, 0);
        s.graphics.lineTo(0, radius);
        s.graphics.lineTo(-radius, 0);
        s.graphics.lineTo(0, -radius);
        s.graphics.endFill();
        return s;
    }

    public static function hoverHighlighter(objW:Float, objH:Float):Sprite
    {
        var s:Sprite = Shapes.gradFillOnlyRect(objW, objH/2, 0xFFFFFF, 0xFFFFFF, Down, 0.8, 0);
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