package roaming.screens;
import openfl.display.MovieClip;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import roaming.screens.Canvas.ICanvas;
import roaming.screens.Canvas.Screen;

/**
 * Main roaming screen
 * @author Gulvan
 */
class SRoaming extends SSprite implements IScreen
{
	
	private var canvas:ICanvas;
	
	private var background:MovieClip;
	private var nextBattle:MovieClip;
	private var abilityScreenBtn:MovieClip;
	
	private function abScreenRequest(e:MouseEvent)
	{
		abilityScreenBtn.removeEventListener(MouseEvent.CLICK, abScreenRequest);
		canvas.switchTo(Screen.Ability);
	}
	
	public function new(canvas:ICanvas) 
	{
		super();
		this.canvas = canvas;
		
		var zone:Zone = Main.progress.currentZone;
		
		background = Assets.getRoamingBG(zone);
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