package roaming.components;
import flash.geom.Point;
import openfl.display.Sprite;

/**
 * ...
 * @author Gulvan
 */
class PlayerBar extends SSprite 
{
	
	private var BG:Point = new Point(0, 0);
	private var INVENTORY_BUTTON:Point = new Point(321, 41);
	private var ABILITY_BUTTON:Point = new Point(440, 41);
	private var MAP_BUTTON:Point = new Point(590, 37);
	private var SETTINGS_BUTTON:Point = new Point(670, 37);
	private var PROGRESS_BAR:Point = new Point(38, 205);
	private var PROGRESS_BAR_W:Float = 195;
	private var PROGRESS_BAR_H:Float = 16;
	private var PLAYER_NAME:Point = new Point(139, 54);
	private var PLAYER_INFO:Point = new Point(140, 78);
	private var XP_BAR:Point = new Point(140, 108);
	private var XP_TEXT:Point = new Point(140, 108);
	private var ICON:Point = new Point(41, 54);
	private var ICON_WINDOW:Point = new Point(0, 0);
	private var ICON_MASK:Point = new Point(-9.6, 94);
	private var ICON_PORTRAIT:Point = new Point(13, 15);
	
	private var icon:SSprite;
	
	private function ZONE_TEXT(size:Int):Point
	{
		return new Point(PROGRESS_BAR.x + PROGRESS_BAR_W, PROGRESS_BAR.y - size - 5);
	}
	
	private function STAGE_TEXT(size:Int):Point
	{
		return new Point(PROGRESS_BAR.x + 8, PROGRESS_BAR.y + PROGRESS_BAR_H);
	}
	
	private function createIcon()
	{
		icon = new SSprite();
		//icon.add(new 
	}
	
	public function new() 
	{
		super();
		
	}
	
}