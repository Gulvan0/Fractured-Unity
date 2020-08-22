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
class TextWindow extends Sprite //TODO: [Improvements Patch] Improve size adjustment
{
	private static final CROSS_W:Int = 26;

	private var tf:TextField;
	private var cross:Sprite;
	private var bg:Sprite;

	private var closeHandler:Void->Void;
	
	public function new(text:RichString, ?type:TextWindowSize = PopUpMessage, ?closeHandler:Null<Void->Void>, ?replaceDefaultFont:Bool = true) 
	{
		super();

		var textSize:Int;
		var boxWidth:Int;
		var defaultFont:String;
		var textAlign:TextFormatAlign = TextFormatAlign.CENTER;
		switch (type)
		{
			case PopUpMessage:
				textSize = 30;
				boxWidth = 400;
				defaultFont = Fonts.ERAS;
			case Manual: 
				textSize = 16;
				boxWidth = 1000;
				textAlign = TextFormatAlign.LEFT;
				defaultFont = Fonts.ERASMEDIUM; 
		}
		if (replaceDefaultFont)
			text.fonts = [defaultFont].concat(text.fonts.slice(1));
		tf = text.format(textSize, boxWidth - CROSS_W * 2, 0xCCCCCC, textAlign);
		tf.height = tf.textHeight + 5;
		bg = Shapes.rect(tf.width, tf.height + CROSS_W, 0x333333, 4, LineStyle.Square, 0x000000, 0.9);
		addChild(bg);
		this.add(tf, CROSS_W, CROSS_W);
		if (closeHandler != null)
		{
			this.closeHandler = closeHandler;
			cross = Shapes.cross(0x990000, CROSS_W, 3);
			this.add(cross, boxWidth - CROSS_W, CROSS_W);
			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}
		Utils.centre(this);
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