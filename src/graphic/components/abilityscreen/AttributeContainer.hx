package graphic.components.abilityscreen;
import struct.Element;
import graphic.components.hints.UnnamedHint;
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
		var bonuses = GameRules.attributeLvlupBonus(Element.createByName(Main.player.character.element));
		var hintTexts:Map<Attribute, RichString> = [
			Strength => new RichString("Each point in strength(St) provides you `val` hp\n\nYou gain `am` St per level", null, ["val" => ""+GameRules.hpPerSt, "am" => ""+bonuses[Strength]]),
			Flow => new RichString("Flow (Fl) converts to the speed. The more the ratio between yours and your opponent's speed is, the more often you'll attack\n\nYou gain `am` Fl per level", null, ["am" => ""+bonuses[Flow]]),
			Intellect => new RichString("The more the ratio between yours and your opponent's intellect (In) is, the bigger the chances you'll dodge the opponent's attack\n\nYou gain `am` In per level", null, ["am" => ""+bonuses[Intellect]]),
		];
		
		addChild(Shapes.rect(250, 145, 0x27484F, 1, LineStyle.Square, 0x37555C));
		for (a in Type.allEnums(Attribute))
		{
			var name = TextFields.attName(a);
			name.setHint(new UnnamedHint(hintTexts[a]));
			values[a] = createValueTF();
			addButtons[a].buttonMode = true;
			this.add(name, 10, valueY(a));
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

	public function addAttributes(att:Attribute, amount:Int)
	{
		values[att].text = (Std.parseInt(values[att].text) + amount) + "";
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