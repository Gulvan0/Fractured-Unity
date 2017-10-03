package graphics;

import openfl.display.Shape;

/**
 * ...
 * @author Gulvan
 */
class ProgressBar extends Shape 
{
	private var barWidth:Float;
    private var barHeight:Float;
	
    public var progress(default, set):Float;
    
    public function new(width:Float, height:Float) 
	{
		super();
        barWidth = width;
        barHeight = height;
        progress = 0;
    }
    
    private function set_progress(value:Float):Float 
	{
        var roundness:Float = barHeight / 5;
        var fillWidth:Float = barWidth * progress;
        progress = value;
        
        graphics.clear();
        graphics.beginFill(0x00CA60);
        graphics.drawRoundRect(0, 0, fillWidth, barHeight, roundness);
        graphics.endFill();
        
        graphics.lineStyle(4, 0x002B2B);
        graphics.drawRoundRect(0, 0, barWidth, barHeight, roundness);
        
        return progress;
    }
	
}