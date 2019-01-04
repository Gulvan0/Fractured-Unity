package roaming.screens;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import roaming.screens.components.PlayerBar;

/**
 * Main roaming screen
 * @author Gulvan
 */
class SRoaming extends SSprite
{
	private var UPPER_BAR:Point = new Point(0, 0);
	private var DND:Point = new Point(1193, -70);
	private var DND_DELTA_Y:Float = 65;
	private var EXIT_CROSS:Point = new Point(1315, 5);
	private var NEXT_BATTLE:Map<Zone, Point> = [
		Zone.NullSpace => new Point(833, 538),
	];
	
	private var upperBar:PlayerBar;
	private var nextBattle:Sprite;
	private var dndButton:Sprite;
	private var exitCross:Sprite;
	
	private function abScreenRequest(e:MouseEvent)
	{
		abilityScreenBtn.removeEventListener(MouseEvent.CLICK, abScreenRequest);
		
	}
	
	public function new() 
	{
		super();
		var zone:Zone = Main.progress.currentZone;
		
		var background = Assets.getRoamingBG(zone);
		nextBattle = new NextBattle();
		abilityScreenBtn = new AbilityScreenButton();
		
		add(background, bgX(zone), bgY(zone));
		add(nextBattle, arrowX(zone), arrowY(zone));
		add(abilityScreenBtn, abScrBtn.x, abScrBtn.y);
	}
	
	public function init()
	{
		abilityScreenBtn.addEventListener(MouseEvent.CLICK, abScreenRequest);
	}
	
	//================================================================================
	
	private static var abScrBtn:Point = new Point(68.45, -21);
	
	private static inline function bgX(zone:Zone):Float
	{
		if (zone == Zone.NullSpace)
			return -25.35;
		else
			return -1;
	}
	
	private static inline function bgY(zone:Zone):Float
	{
		if (zone == Zone.NullSpace)
			return -21.45;
		else
			return -1;
	}
	
	private static inline function arrowX(zone:Zone):Float
	{
		if (zone == Zone.NullSpace)
			return 436.35;
		else
			return -1;
	}
	
	private static inline function arrowY(zone:Zone):Float
	{
		if (zone == Zone.NullSpace)
			return 398.15;
		else
			return -1;
	}
	
}