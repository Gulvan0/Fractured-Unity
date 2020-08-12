package graphic.components;

import flash.display.CapsStyle;
import flash.display.InteractiveObject;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import openfl.display.Shape;
import engine.Color;
using engine.MathUtils;

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
	private var borderThickness:Float;
	private var hasBorder:Bool;
	
	public var capacity(default, null):Float;
    public var progress(get, set):Float;
	private var _progress:Float;
    
    public function new(width:Float, height:Float, ?colour:Int = -1, ?borderThickness:Float = 0.5, ?initialProgress:Float = 1, ?borderColour:Int = -1, ?emptyColour:Int = -1, ?capacity:Float = 1, ?hasBorder:Bool = true) 
	{
		super();
        barWidth = width;
        barHeight = height;
		fillColour = colour;
		this.emptyColour = emptyColour;
		this.borderColour = borderColour;
		this.borderThickness = borderThickness;
		progress = initialProgress;
		this.hasBorder = hasBorder;
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
		var calculatedBorderColour:Int = (borderColour != -1)? borderColour : Color.darken(colour, fillColour == -1);
        _progress = value;
        
		graphics.clear();
		if (hasBorder)
		{
			graphics.lineStyle(borderThickness, calculatedBorderColour, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.MITER, 3);
			graphics.beginFill(calculatedBorderColour);
        	graphics.drawRect(0, 0, barWidth, barHeight);
			graphics.endFill();
		}
		
		if (emptyColour != -1)
		{
			var offset = hasBorder? borderThickness/2 : 0;
			graphics.beginFill(emptyColour);
			graphics.drawRect(offset, offset, barWidth - 3, barHeight - 3);
			graphics.endFill();
		}
		
        graphics.beginFill(colour);
		graphics.drawRect(borderThickness/2, borderThickness/2, fillWidth - 3 * value, barHeight - 3);
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
	
	private function get_progress():Float 
	{
		return _progress;
	}
	
}