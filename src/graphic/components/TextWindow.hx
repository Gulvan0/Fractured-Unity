package graphic.components;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.text.TextFormatAlign;
import openfl.geom.Point;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

using engine.Listeners;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * ...
 * @author gulvan
 */
class TextWindow extends Sprite 
{
	
	private var tf:TextField;
	private var cross:TextField;
	private var bg:Sprite;

	private var closeHandler:Void->Void;
	
	public function new(text:String, ?closeHandler:Null<Void->Void>) 
	{
		super();
		tf = new TextField();
		tf.wordWrap = true;
		tf.width = 400;
		tf.selectable = false;
		tf.text = text;
		tf.setTextFormat(new TextFormat(null, 30, null, null, null, null, null, null, TextFormatAlign.CENTER));
		bg = new Sprite();
		bg.graphics.lineStyle(4, 0x0B6482, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
		bg.graphics.beginFill(0x6297CC);
		bg.graphics.drawRect(0, 0, tf.width, tf.height);
		bg.graphics.endFill();
		addChild(bg);
		this.add(tf, 0, (bg.height - tf.textHeight) / 2);
		if (closeHandler != null)
		{
			this.closeHandler = closeHandler;
			createCross();
		}
	}

	private function createCross()
	{	
		cross = new TextField();
		cross.selectable = false;
		cross.text = "X";
		cross.setTextFormat(new TextFormat(null, 20, 0xFF0000, true));
		cross.width = cross.textWidth + 5;
		this.add(cross, tf.width - cross.width, -5);
		addEventListener(Event.ADDED_TO_STAGE, onStage);
	}

	private function onStage(e)
	{
		removeEventListener(Event.ADDED_TO_STAGE, onStage);
		addEventListener(MouseEvent.CLICK, h);
	}

	private function h(e:MouseEvent)
	{
		if (new Point(e.stageX, e.stageY).inside(cross.getBounds(stage)))
		{
			removeEventListener(MouseEvent.CLICK, h);
			Sounds.CLICK.play();
			closeHandler();
		}
	}
	
}