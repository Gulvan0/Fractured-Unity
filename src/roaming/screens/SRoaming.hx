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
		
		var zone:Int = Main.progress.zone;
		
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
	
	private static inline function bgX(zone:Int):Float
	{
		if (zone == 0)
			return -25.35;
		else
			return -1;
	}
	
	private static inline function bgY(zone:Int):Float
	{
		if (zone == 0)
			return -21.45;
		else
			return -1;
	}
	
	private static inline function arrowX(zone:Int):Float
	{
		if (zone == 0)
			return 436.35;
		else
			return -1;
	}
	
	private static inline function arrowY(zone:Int):Float
	{
		if (zone == 0)
			return 398.15;
		else
			return -1;
	}
	
}