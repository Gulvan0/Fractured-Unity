package battle;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
using graphic.SpriteExtension;

/**
 * ...
 * @author gulvan
 */
class TurnTimer extends Sprite
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
		removeChild(circle);
		removeChild(skipTurn);
		circle.graphics.clear();
		draw(ready);
	}
	
	private function draw(ready:Bool)
	{
		circle.graphics.lineStyle(3, 0x014754);
		circle.graphics.beginFill(ready? 0x00CCFF : 0xFF6600);
		circle.graphics.drawCircle(0, 0, 40);
		addChild(circle);
		this.add(skipTurn, 0, 0);
	}
	
}