package graphic;

import openfl.display.Shape;

/**
 * ...
 * @author Gulvan
 */
class ProgressBar extends Shape 
{
	private var barWidth:Float;
    private var barHeight:Float;
	private var fillColour:Int;
	
    public var progress(get, set):Float;
	private var _progress:Float;
    
    public function new(width:Float, height:Float, ?colour:Int = -1, ?initialProgress:Float = 1) 
	{
		super();
        barWidth = width;
        barHeight = height;
		fillColour = colour;
        progress = initialProgress;
    }
    
    private function set_progress(value:Float):Float 
	{
        var roundness:Float = 0;
        var fillWidth:Float = barWidth * value;
		var colour:Int = (fillColour != -1)? fillColour : get_colour(value);
        _progress = value;
        
        graphics.clear();
        graphics.beginFill(colour);
		graphics.drawRoundRect(0, 0, fillWidth, barHeight, roundness);
        graphics.endFill();
        
        graphics.lineStyle(0.5, darken(0xFFFF00));
        graphics.drawRoundRect(0, 0, barWidth, barHeight, roundness);
        
        return progress;
    }
	
	private function get_colour(prog:Float):Int
	{
		var rp:Int = Math.round(255 * (1 - prog));
		var gp:Int = Math.round(255 * prog);
		var diff:Int = Math.round(Math.min(255 - rp, 255 - gp));
		rp += diff;
		gp += diff;
		return rp * 16 * 16 * 16 * 16 + gp * 16 * 16;
	}
	
	private function darken(color:Int):Int
	{
		var red:Int = Math.floor(color / Math.pow(16, 4));
		var blue:Int = Math.round(color % Math.pow(16, 2));
		var green:Int = Math.round((color - red * Math.pow(16, 4) - blue) / Math.pow(16, 2));
		red -= 200;
		green -= 200;
		blue -= 200;
		if (red < 0) red = 0;
		if (green < 0) green = 0;
		if (blue < 0) blue = 0;
		return Math.round(red * Math.pow(16, 4) + green * Math.pow(16, 2) + blue);
	}
	
	private function get_progress():Float 
	{
		return _progress;
	}
	
}