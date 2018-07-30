package graphic;

import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import openfl.display.Shape;
using MathUtils;

/**
 * ...
 * @author Gulvan
 */
class ProgressBar extends Shape 
{
	private var barWidth:Float;
    private var barHeight:Float;
	private var fillColour:Int;
	private var lineThickness:Float;
	
    public var progress(get, set):Float;
	private var _progress:Float;
    
    public function new(width:Float, height:Float, ?colour:Int = -1, ?thickness:Float = 0.5, ?initialProgress:Float = 1) 
	{
		super();
        barWidth = width;
        barHeight = height;
		fillColour = colour;
		lineThickness = thickness;
        progress = initialProgress;
    }
    
    private function set_progress(value:Float):Float 
	{
        var fillWidth:Float = barWidth * value;
		var colour:Int = (fillColour != -1)? fillColour : get_colour(value);
        _progress = value;
        
        graphics.clear();
		graphics.lineStyle(3, darken(colour), 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.MITER, 3);
		graphics.beginFill(darken(colour));
        graphics.drawRect(0, 0, barWidth, barHeight);
		graphics.endFill();
		
        graphics.beginFill(colour);
		graphics.drawRect(1.5, 1.5, fillWidth - 3, barHeight - 3);
        graphics.endFill();
        
        return progress;
    }
	
	private function get_colour(prog:Float):Int
	{
		var rp:Int = Math.round(0xFF * (1 - prog));
		var gp:Int = Math.round(0xCC * prog);
		var diff:Int = Math.round(Math.min(0xFF - rp, 0xCC - gp));
		rp += diff;
		gp += diff;
		return rp * 16 * 16 * 16 * 16 + gp * 16 * 16;
	}
	
	private function darken(color:Int):Int
	{
		var red:Int = Math.floor(color / Math.pow(16, 4));
		var blue:Int = Math.round(color % Math.pow(16, 2));
		var green:Int = Math.round((color - red * Math.pow(16, 4) - blue) / Math.pow(16, 2));
		red -= Math.ceil(red * 0.6);
		green -= Math.ceil(green * 0.6);
		blue -= Math.ceil(blue * 0.6);
		if (fillColour == -1) blue = Math.round((red + green) / 6);
		return Math.round(red * Math.pow(16, 4) + green * Math.pow(16, 2) + blue);
	}
	
	private function get_progress():Float 
	{
		return _progress;
	}
	
}