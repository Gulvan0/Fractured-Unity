package graphic.components;

import flash.display.CapsStyle;
import flash.display.InteractiveObject;
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
	public static var GREEN_TO_RED:Int = -1;
	
	private var barWidth:Float;
    private var barHeight:Float;
	private var fillColour:Int;
	private var borderColour:Int;
	private var emptyColour:Int;
	private var lineThickness:Float;
	
	public var capacity(default, null):Float;
    public var progress(get, set):Float;
	private var _progress:Float;
    
    public function new(width:Float, height:Float, ?colour:Int = -1, ?thickness:Float = 0.5, ?initialProgress:Float = 1, ?borderColour:Int = -1, ?emptyColour:Int = -1, ?capacity:Float = 1) 
	{
		super();
        barWidth = width;
        barHeight = height;
		fillColour = colour;
		this.emptyColour = emptyColour;
		this.borderColour = borderColour;
		lineThickness = thickness;
        progress = initialProgress;
		if (capacity != 1)
			this.capacity = capacity;
    }
	
	public function setAbsolute(value:Float)
	{
		progress = value / capacity;
	}
    
    private function set_progress(value:Float):Float 
	{
        var fillWidth:Float = barWidth * value;
		var colour:Int = (fillColour != ProgressBar.GREEN_TO_RED)? fillColour : get_colour(value);
		var border:Int = (borderColour != -1)? borderColour : darken(colour);
        _progress = value;
        
        graphics.clear();
		graphics.lineStyle(lineThickness, border, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.MITER, 3);
		graphics.beginFill(border);
        graphics.drawRect(0, 0, barWidth, barHeight);
		graphics.endFill();
		
		if (emptyColour != -1)
		{
			graphics.beginFill(emptyColour);
			graphics.drawRect(lineThickness/2, lineThickness/2, barWidth - 3, barHeight - 3);
			graphics.endFill();
		}
		
        graphics.beginFill(colour);
		graphics.drawRect(lineThickness/2, lineThickness/2, fillWidth - 3 * value, barHeight - 3);
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