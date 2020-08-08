package graphic.components.abilityscreen;
import graphic.Shapes.LineStyle;
import openfl.display.Sprite;
import hxassert.Assert;
import graphic.Fonts;
import openfl.display.MovieClip;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import struct.Attribute;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * Attribute list
 * @author Gulvan
 */
class AttributeContainer extends Sprite 
{

	private var values:Map<Attribute, TextField> = new Map<Attribute, TextField>();
	private var addButtons:Map<Attribute, MovieClip> = [Attribute.Strength => new AddStrength(), Attribute.Flow => new AddFlow(), Attribute.Intellect => new AddIntellect()];
	
	public function new()
	{
		super();
		addChild(Shapes.rect(250, 145, 0x27484F, 1, LineStyle.Square, 0x37555C));
		this.add(new AttributeNames(), 10, 10);
		for (a in Type.allEnums(Attribute))
		{
			values[a] = createValueTF();
			this.add(values[a], valueX, valueY(a));
			this.add(addButtons[a], plusX, plusY(a));
		}
		updateValues();
	}
	
	private function createValueTF():TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(Fonts.ERAS, 21);
		format.align = TextFormatAlign.RIGHT;
		t.width = 75;
		t.selectable = false;
		t.setTextFormat(format);
		return t;
	}
	
	public function updateValues()
	{
		values[Strength].text = Main.player.character.s + "";
		values[Flow].text = Main.player.character.f + "";
		values[Intellect].text = Main.player.character.i + "";
	}
	
	public function identifyAttribute(stageX:Float, stageY:Float):Null<Attribute>
	{
		Assert.require(stage != null);
		for (a in Type.allEnums(Attribute))
			if (new Point(stageX, stageY).inside(addButtons[a].getRect(stage)))
				return a;
		return null;
	}

	public function incrementAttribute(att:Attribute)
	{
		values[att].text = (Std.parseInt(values[att].text) + 1) + "";
	}
	
	//---------------------------------------------------------------------------------------------
	
	private var valueX:Float = 130;
	private var plusX:Float = 220;
	
	private function valueY(a:Attribute):Float
	{
		return switch (a)
		{
			case Attribute.Strength: 10;
			case Attribute.Flow: 59;
			case Attribute.Intellect: 108;
		}
	}

	private function plusY(a:Attribute):Float
	{
		return valueY(a) + 5;
	}
	
}