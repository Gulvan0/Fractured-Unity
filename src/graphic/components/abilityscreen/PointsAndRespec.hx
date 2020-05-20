package graphic.components.abilityscreen;
import openfl.display.Sprite;
import graphic.Fonts;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * ...
 * @author Gulvan
 */
class PointsAndRespec extends Sprite
{
	private var abPoints:TextField;
	private var attrPoints:TextField;
	
	public function new() 
	{
		super();
		abPoints = createTF();
		attrPoints = createTF();
		
		this.add(abPoints, 870, 268);
		this.add(attrPoints, 1100, 268);
		this.add(new ReSpec(), respecCoords.x, respecCoords.y);
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

	public function decrementAbp() 
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(abPoints.text);
		abPoints.text = ereg.replace(abPoints.text, (Std.parseInt(ereg.matched(0)) - 1) + "");
	}

	public function decrementAttp() 
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(attrPoints.text);
		attrPoints.text = ereg.replace(attrPoints.text, (Std.parseInt(ereg.matched(0)) - 1) + "");
	}

	public function hasABP():Bool
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(abPoints.text);
		return ereg.matched(0) != "0";
	}

	public function hasATTP():Bool
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(attrPoints.text);
		return ereg.matched(0) != "0";
	}
	
	private var respecCoords:Point = new Point(945, 193);
	
}