package graphic.components;
import graphic.Shapes.LineStyle;
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

enum TextWindowSize
{
	PopUpMessage;
	Manual;
}

/**
 * ...
 * @author gulvan
 */
class TextWindow extends Sprite //TODO: [Improvements Patch] Improve size adjustment; add better close button
{
	
	private var tf:TextField;
	private var cross:TextField;
	private var bg:Sprite;

	private var closeHandler:Void->Void;
	
	public function new(text:RichString, ?type:TextWindowSize = PopUpMessage, ?closeHandler:Null<Void->Void>) 
	{
		super();
		var textSize:Int = -1;
		var boxWidth:Int = -1;
		var textAlign:TextFormatAlign = TextFormatAlign.CENTER;
		switch (type)
		{
			case PopUpMessage:
				textSize = 30;
				boxWidth = 400;
				text.fonts = [Fonts.ERAS].concat(text.fonts); //? Unsafe and counter-intuitive (TODO consider)
			case Manual: 
				textSize = 16;
				boxWidth = 1000;
				textAlign = TextFormatAlign.LEFT;
				text.fonts = [Fonts.ERASMEDIUM].concat(text.fonts); //? Unsafe and counter-intuitive
		}
		tf = text.format(textSize, boxWidth, 0xCCCCCC, textAlign);
		tf.height = tf.textHeight + 5;
		bg = Shapes.rect(tf.width, tf.height, 0x333333, 4, LineStyle.Square, 0x000000, 0.9);
		addChild(bg);
		addChild(tf);
		if (closeHandler != null)
		{
			this.closeHandler = closeHandler;
			createCross();
		}
		Utils.centre(this);
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
		addEventListener(Event.REMOVED_FROM_STAGE, terminate);
	}

	private function terminate(e)
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
		removeEventListener(MouseEvent.CLICK, h);
	}

	private function h(e:MouseEvent)
	{
		if (MathUtils.insideC(e.stageX, e.stageY, cross.getBounds(stage)))
		{
			removeEventListener(MouseEvent.CLICK, h);
			Sounds.CLICK.play();
			closeHandler();
		}
	}
	
}