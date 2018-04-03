package roaming.screens;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * Attribute list
 * @author Gulvan
 */
class AttributeContainer extends SSprite 
{

	private var parentScreen:ISAbility;
	
	private var values:Array<TextField>;
	
	private var attribNames:Array<String> = ["Vitality", "Strength", "Flow", "Intellect"];
	private var attribColors:Array<Int> = [0x008000, 0xFF3300, 0xA0D80E, 0x6600CC];
	private var attribValues:Array<String> = ["--", Main.player.strength + "", Main.player.flow + "", Main.player.intellect + ""];
	private var addButtons:Array<MovieClip> = [new AddVitality(), new AddStrength(), new AddFlow(), new AddIntellect()];
	
	public function new(parent:ISAbility) 
	{
		super();
		this.parentScreen = parent;
		
		var unit:MovieClip = Assets.getUnit(Main.player.id);
		unit.width = unit.width * 233 / unit.height;
		unit.height = 233;
		add(unit, playerIcon.x, playerIcon.y); 
		
		for (i in 0...4)
		{
			add(createTF(attribNames[i], "Eras Demi ITC", 21, attribColors[i], 1), attributeX, lineY(i));
			values[i] = createTF(attribValues[i], "Eras Demi ITC", 21, 0x000000, 1);
			add(values[i], valueX, lineY(i));
			add(addButtons[i], plusX, lineY(i) + plusLineOffset);
		}
	}
	
	private function createTF(text:String, font:String, size:Int, ?color:Null<Int>, ?spacing:Null<Float>):TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.letterSpacing = spacing;
		t.text = text;
		t.setTextFormat(format);
		return t;
	}
	
	public function onClick(localPoint:Point):Void
	{
		
	}
	
	//---------------------------------------------------------------------------------------------
	
	private var playerIcon:Point = new Point(0, 0);
	private var attributeX:Float = 162;
	private var valueX:Float = 328;
	private var plusX:Float = 382;
	private var plusLineOffset:Float = 5.5;
	
	private function lineY(n:Int):Float
	{
		if (n == 0)
			return 33;
		else if (n == 1)
			return 79;
		else if (n == 2)
			return 125;
		else if (n == 3)
			return 171;
		else 
			return -1;
	}
	
}