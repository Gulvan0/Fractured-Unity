package battle;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author gulvan
 */
class TurnTimer extends SSprite
{
	
	private var skipTurn:DisplayObject;
	private var circle:Sprite;

	public function new() 
	{
		super();
		skipTurn = new SkipTurn();
		circle = new Sprite();
		draw(false);
	}
	
	public function redraw(ready:Bool)
	{
		remove(circle);
		remove(skipTurn);
		circle.graphics.clear();
		draw(ready);
	}
	
	private function draw(ready:Bool)
	{
		circle.graphics.lineStyle(3, 0x014754);
		circle.graphics.beginFill(ready? 0x00CCFF : 0xFF6600);
		circle.graphics.drawCircle(0, 0, 40);
		addChild(circle);
		add(skipTurn, 0, 0);
	}
	
}