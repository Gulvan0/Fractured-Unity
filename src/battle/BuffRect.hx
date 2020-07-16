package battle;
import openfl.system.Capabilities;
import graphic.Fonts;
import battle.struct.Countdown;
import flash.events.Event;
import flash.filters.DropShadowFilter;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * Represents a buff icon on the unit state bar
 * @author Gulvan
 */
class BuffRect extends Sprite 
{

	private var BG_WIDTH:Float = 18;
	private var BG_HEIGHT:Float = 30;
	
	private var bg:Sprite;
	private var symbol:Sprite;
	private var durationText:TextField;
	
	private var duration:Countdown;
	
	public function tickAndIsOver():Bool
	{
		if (--duration.value == 0)
			return true;
		durationText.text = "" + duration.value;
		return false;
	}

	//TODO: Entire class is to be rewritten
	
	public function new(buff:Buff) 
	{
		super();
		bg = Assets.getBuffBox(buff.element);
		symbol = Assets.getBuffMark(buff.id);
		duration = new Countdown(buff.duration, buff.duration);
		durationText = createTF(duration.value);
		durationText.filters = [new DropShadowFilter(2, 45, 0, 1, 0, 0)];
		
		this.add(bg, 0, 0);
		this.add(symbol, 0, 0);
		this.add(durationText, 0, 10);
	}
	
	private function createTF(dur:Int):TextField
	{
		var tf:TextField = new TextField();
		tf.text = "" + duration.value;
		tf.width = BG_WIDTH;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.BUFF, 16, 0xffffff, true, null, null, null, null, TextFormatAlign.CENTER));
		return tf;
	}
	
}