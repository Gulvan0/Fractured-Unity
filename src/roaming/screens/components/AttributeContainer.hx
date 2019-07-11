package roaming.screens.components;
import hxassert.Assert;
import graphic.Fonts;
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
	
	public function new()
	{
		super();
		addChild(new AttributeNames());
		for (a in Type.allEnums(Attribute))
		{
			values[a] = createValueTF();
			add(values[a], valueX, valueY(a));
			add(addButtons[a], plusX, plusY(a));
		}
		updateValues();
	}
	
	private function createValueTF():TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(Fonts.ERAS, 21);
		format.align = TextFormatAlign.RIGHT;
		t.width = 75;
		t.setTextFormat(format); //CHECK
		return t;
	}
	
	public function updateValues()
	{
		for (key in Type.allEnums(Attribute)) 
			values[key].text = Main.player.attribs[key] + "";
	}
	
	private function identifyAttribute(stageX:Float, stageY:Float):Null<Attribute>
	{
		Assert.require(stage != null);
		for (a in Type.allEnums(Attribute))
			if (new Point(stageX, stageY).inside(addButtons[a].getRect(stage)))
				return a;
		return null;
	}
	
	//---------------------------------------------------------------------------------------------
	
	private var valueX:Float = 130;
	private var plusX:Float = 220;
	
	private function valueY(a:Attribute):Float
	{
		return switch (a)
		{
			case Attribute.Strength: 0;
			case Attribute.Flow: 47;
			case Attribute.Intellect: 97;
		}
	}

	private function plusY(a:Attribute):Float
	{
		return valueY(a) + 5;
	}
	
}