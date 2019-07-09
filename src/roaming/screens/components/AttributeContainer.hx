package roaming.screens.components;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import roaming.enums.Attribute;
using MathUtils;

/**
 * Attribute list
 * @author Gulvan
 */
class AttributeContainer extends SSprite 
{

	private var values:Map<Attribute, TextField> = new Map<Attribute, TextField>();
	private var addButtons:Map<Attribute, MovieClip> = [Attribute.Strength => new AddStrength(), Attribute.Flow => new AddFlow(), Attribute.Intellect => new AddIntellect()];
	
	private var attribNames:Map<Attribute, String> = [Attribute.Strength => "Strength", Attribute.Flow => "Flow", Attribute.Intellect => "Intellect"];
	private var attribColors:Map<Attribute, Int> = [Attribute.Strength => 0xFF3300, Attribute.Flow => 0xA0D80E, Attribute.Intellect => 0x6600CC];
	private var attribValues:Map<Attribute, String> = [for (key in Type.allEnums(Attribute)) key => Main.player.attribs[key] + ""];
	
	public function new()
	{
		super();
		var unit:MovieClip = Assets.getUnit(Main.player.id);
		unit.width = unit.width * 233 / unit.height;
		unit.height = 233;
		add(unit, playerIcon.x, playerIcon.y); 
		
		for (a in Type.allEnums(Attribute))
		{
			add(createTF(attribNames[a], "Eras Demi ITC", 21, 100, attribColors[a], 1), attributeX, lineY(a));
			values[a] = createTF(attribValues[a], "Eras Demi ITC", 21, 35, 0x000000, 1);
			add(values[a], valueX, lineY(a));
			add(addButtons[a], plusX, lineY(a) + plusLineOffset);
		}
	}
	
	private function createTF(text:String, font:String, size:Int, width:Int, ?color:Null<Int>, ?spacing:Null<Float>):TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color);
		format.letterSpacing = spacing;
		t.width = width;
		t.text = text;
		t.setTextFormat(format);
		return t;
	}
	
	public function updateValue(attrib:Attribute)
	{
		values[attrib].text = Main.player.attribs[attrib] + "";
	}
	
	public function onClick(localPoint:Point)
	{
		// trace("Attributes recieved click");
		// var attrib:Null<Attribute> = identifyAttribute(localPoint);
		// if (attrib == null)
		// 	return;
		
		// if (Main.player.increment(attrib))
		// 	parentScreen.power(attrib);
		// else
		// 	trace("Not enough attribute points");
					
	}
	
	private function identifyAttribute(localClickPoint:Point):Null<Attribute>
	{
		if (localClickPoint.x.inRange(plusX, plusX + addButtons[Attribute.Strength].width))
			if (localClickPoint.y.inRange(lineY(Attribute.Strength), 2 * lineY(Attribute.Intellect) - lineY(Attribute.Flow)))
				for (attrib in Type.allEnums(Attribute))
					if (localClickPoint.inside(addButtons[attrib].getRect(this)))
						return attrib;
		return null;
	}
	
	//---------------------------------------------------------------------------------------------
	
	private var playerIcon:Point = new Point(0, 0);
	private var attributeX:Float = 162;
	private var valueX:Float = 328;
	private var plusX:Float = 382;
	private var plusLineOffset:Float = 5.5;
	
	private function lineY(a:Attribute):Float
	{
		return switch (a)
		{
			case Attribute.Strength: 33;
			case Attribute.Flow: 79;
			case Attribute.Intellect: 125;
		}
	}
	
}