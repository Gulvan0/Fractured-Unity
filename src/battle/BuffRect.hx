package battle;
import graphic.Shapes;
import graphic.components.abilityscreen.SAbility;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
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
	private var icon:Sprite;
	private var veil:Sprite;
	private var durationText:TextField;
	
	private var duration:Countdown;
	
	public function tickAndIsOver():Bool
	{
		if (--duration.value == 0)
			return true;
		durationText.text = "" + duration.value;
		return false;
	}

	public function onKeyPressed(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.ALTERNATE)
		{
			veil.visible = false;
			durationText.visible = false;
		}
	}

	public function onKeyReleased(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.ALTERNATE)
		{
			veil.visible = true;
			durationText.visible = true;
		}
	}

	public function onAdded(e)
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
	}

	public function onRemoved(e)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
	}
	
	public function new(buff:Buff) 
	{
		super();
		var buff = AbilityParser.buffs.get(buff.id);
		icon = Assets.getBuffIcon(buff.id);
		veil = Shapes.round(SAbility.ABILITY_RADIUS * 0.5, 0, 1, 0, 0x000000, 0.5);
		duration = new Countdown(buff.duration, buff.duration);
		durationText = createTF(duration.value);
		
		this.add(icon, 0, 0);
		this.add(veil, 0, 0);
		this.add(durationText, -SAbility.ABILITY_RADIUS, -16.6);
		this.add(new AbSlotContour(), 0, 0);
		this.setHint(new BasicHint(new RichString(buff.name), new RichString(buff.rawDesc)));
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function createTF(dur:Int):TextField
	{
		var tf:TextField = new TextField();
		tf.text = "" + duration.value;
		tf.width = SAbility.ABILITY_RADIUS * 2;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.SEGOE, 20, 0xffffff, null, null, null, null, TextFormatAlign.CENTER));
		return tf;
	}
	
}