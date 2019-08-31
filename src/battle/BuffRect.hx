package battle;
import openfl.system.Capabilities;
import graphic.Fonts;
import battle.struct.Countdown;
import flash.events.Event;
import flash.filters.DropShadowFilter;
import graphic.components.HintTextfield;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using MathUtils;

/**
 * Represents a buff icon on the unit state bar
 * @author Gulvan
 */
class BuffRect extends SSprite 
{

	private var BG_WIDTH:Float = 18;
	private var BG_HEIGHT:Float = 30;
	
	private var bg:Sprite;
	private var symbol:Sprite;
	private var durationText:TextField;
	private var hint:HintTextfield;
	
	private var duration:Countdown;
	
	public function tickAndIsOver():Bool
	{
		if (--duration.value == 0)
			return true;
		durationText.text = duration.value;
		return false;
	}
	
	private function moveHandler(e:MouseEvent)
	{
		if (e.stageX.inRange(x, x + BG_WIDTH) && e.stageY.inRange(y, y + BG_HEIGHT))
		{
			if (!stage.contains(hint))
				stage.addChild(hint);
				
			hint.x = stage.mouseX + 10;
			hint.y = stage.mouseY;
		}
		else if (stage.contains(hint))
			stage.removeChild(hint);
	}
	
	public function terminate(e:Event)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveHandler, true);
		if (stage.contains(hint))
			stage.removeChild(hint);
		if (hint != null)
			hint.terminate();
	}
	
	private function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(Event.REMOVED_FROM_STAGE, terminate);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, moveHandler, true);
	}
	
	public function new(buff:Buff) 
	{
		super();
		bg = Assets.getBuffBox(buff.element);
		symbol = Assets.getBuffMark(buff.id);
		duration = new Countdown(buff.duration, buff.duration);
		durationText = createTF(duration.value);
		durationText.filters = [new DropShadowFilter(2, 45, 0, 1, 0, 0)];
		hint = new HintTextfield(buff.name, buff.description);
		
		add(bg, 0, 0);
		add(symbol, 0, 0);
		add(durationText, 0, 10);
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function createTF(dur:Int):TextField
	{
		var tf:TextField = new TextField();
		tf.text = duration.value;
		tf.width = BG_WIDTH;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.BUFF, 16, 0xffffff, true, null, null, null, null, TextFormatAlign.CENTER));
		return tf;
	}
	
}