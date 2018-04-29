package roaming.screens.components;
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
	
	private var parentScreen:ISAbility;	
	
	private var abPoints:TextField;
	private var attrPoints:TextField;
	
	public function new(parent:ISAbility) 
	{
		super();
		this.parentScreen = parent;
		
		abPoints = createTF(false, Main.player.abilityPoints + "");
		attrPoints = createTF(false, Main.player.attributePoints + "");
		
		add(createTF(true, "ABILITY POINTS"), 0, 0);
		add(createTF(true, "ATTRIBUTE POINTS"), 300, 0);
		add(abPoints, 70, 40);
		add(attrPoints, 384, 40);
		
		add(new ReSpec(), respec.x, respec.y);
	}
	
	private function createTF(header:Bool, text:String):TextField
	{
		var tf = new TextField();
		var format = new TextFormat();
		
		format.size = 20;
		format.bold = header? false : true;
		format.italic = header? true : false;
		format.align = header? TextFormatAlign.LEFT : TextFormatAlign.CENTER;
		tf.width = header? 200 : 20;
		tf.height = 20;
		tf.text = text;
		tf.setTextFormat(format);
		return tf;
	}
	
	public function updateAbpValue()
	{
		abPoints.text = Main.player.abilityPoints + "";
	}
	
	public function updateAttpValue()
	{
		attrPoints.text = Main.player.attributePoints + "";
	}
	
	public function onClick(localPoint:Point) 
	{
		trace("Point textfields and re-spec button recieved click");
		if (localPoint.distance(respec) <= 20)
			parentScreen.respec();
	}
	
	private var respec:Point = new Point(235, 35);
	
}