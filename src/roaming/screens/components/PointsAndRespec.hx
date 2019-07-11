package roaming.screens.components;
import graphic.Fonts;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using MathUtils;

/**
 * ...
 * @author Gulvan
 */
class PointsAndRespec extends SSprite
{
	private var abPoints:TextField;
	private var attrPoints:TextField;
	
	public function new() 
	{
		super();
		abPoints = createTF();
		attrPoints = createTF();
		
		add(abPoints, 870, 268);
		add(attrPoints, 1100, 268);
		add(new ReSpec(), respecCoords.x, respecCoords.y);
		updateAbpValue();
		updateAttpValue();
	}
	
	private function createTF():TextField
	{
		var tf = new TextField();
		tf.width = 200;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.ERAS, 18));
		return tf;
	}
	
	public function updateAbpValue()
	{
		abPoints.text = "Ability points: " + Main.player.abilityPoints;
	}
	
	public function updateAttpValue()
	{
		attrPoints.text = "Attribute points: " + Main.player.attributePoints;
	}
	
	public function isRespecButton(stageX:Float, stageY:Float):Bool
	{
		if (new Point(stageX - x, stageY - y).distance(respecCoords) <= 33)
			return true;
		return false;
	}
	
	private var respecCoords:Point = new Point(945, 193);
	
}