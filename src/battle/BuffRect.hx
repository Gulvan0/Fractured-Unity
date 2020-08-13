package battle;
import hxassert.Assert;
import ID.AbilityID;
import io.AbilityParser;
import graphic.RichString;
import graphic.components.hints.BasicHint;
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

enum RectType
{
	Buff;
	DelayedPattern;
}

/**
 * Represents a buff icon on the unit state bar
 * @author Gulvan
 */
class BuffRect extends Sprite 
{
	public static var SCALE:Float = 0.5;

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
	
	public function new(type:RectType, ?buff:Buff, ?patternOf:AbilityID) 
	{
		Assert.assert((type == Buff) == (buff != null));
		Assert.assert((type == DelayedPattern) == (patternOf != null));
		super();
		var dur;
		if (type == Buff)
		{
			dur = buff.duration;
			icon = Assets.getBuffIcon(buff.id);
			veil = Shapes.round(Assets.INNER_ABILITY_RADIUS, 0, 1, 0, 0x000000, SCALE);
		}
		else
		{
			dur = GameRules.defaultDelayedPatternDuration;
			icon = Assets.getRhombusAbility(patternOf);
			veil = Shapes.rotatedSquare(Assets.INNER_ABILITY_RADIUS, 0x000000, 0x333333, 5, SCALE);
		}

		icon.scaleX = icon.scaleY = veil.scaleX = veil.scaleY = SCALE;

		duration = new Countdown(dur, dur);
		durationText = createTF(duration.value);
		
		this.add(icon, 0, 0);
		this.add(veil, 0, 0);
		this.add(durationText, -Assets.INNER_ABILITY_RADIUS / 2, -16.6);
		if (type == Buff)
		{
			var contour = new AbSlotContour();
			contour.scaleX = contour.scaleY = SCALE;
			this.add(contour, 0, 0);
			this.setHint(new BasicHint(new RichString(buff.name), new RichString(buff.description)));
		}
		else
			this.setHint(new BasicHint(new RichString("Delayed pattern"), new RichString("Ability: " + AbilityParser.abilities.get(patternOf).name)));
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function createTF(dur:Int):TextField
	{
		var tf:TextField = new TextField();
		tf.text = "" + duration.value;
		tf.width = Assets.INNER_ABILITY_RADIUS;
		tf.height = tf.textHeight + 7;
		tf.selectable = false;
		tf.setTextFormat(new TextFormat(Fonts.SEGOE, 20, 0xffffff, null, null, null, null, null, TextFormatAlign.CENTER));
		return tf;
	}
	
}