package graphic.components.abilityscreen;
import graphic.components.hints.BasicHint;
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
	private var respecButton:ReSpec;
	
	public function new() 
	{
		super();
		abPoints = createTF();
		attrPoints = createTF();
		respecButton = new ReSpec();
		
		this.add(abPoints, 870, 312);
		this.add(attrPoints, 1100, 312);
		this.add(respecButton, respecCoords.x, respecCoords.y);
		this.add(TextFields.respecLabel(), 928, 230);

		respecButton.setHint(new BasicHint(new RichString("Re-spec"), new RichString("Unlearn all the abilities and reset attribute values back to default. You get all the ability and attribute points spent back")));
		updateValues();
	}
	
	private function createTF():TextField
	{
		var tf = new TextField();
		tf.width = 200;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.ERAS, 18));
		return tf;
	}
	
	public function updateValues()
	{
		abPoints.text = "Ability points: " + Main.player.character.abp;
		attrPoints.text = "Attribute points: " + Main.player.character.attp;
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

	public function spendAttp(amount:Int) 
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(attrPoints.text);
		attrPoints.text = ereg.replace(attrPoints.text, (Std.parseInt(ereg.matched(0)) - amount) + "");
	}

	public function hasABP():Bool
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(abPoints.text);
		return ereg.matched(0) != "0";
	}

	public function hasATTP(amount:Int):Bool
	{
		var ereg:EReg = ~/[0-9]+/;
		ereg.match(attrPoints.text);
		return Std.parseInt(ereg.matched(0)) >= amount;
	}
	
	private var respecCoords:Point = new Point(970, 185);
	
}