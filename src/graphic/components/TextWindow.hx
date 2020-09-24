package graphic.components;
import engine.Color;
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

enum CloseMode
{
	Cross(onClose:Void->Void);
	Decide(onAccept:Void->Void, onDecline:Void->Void, acceptText:String, declineText:String);
}

/**
 * ...
 * @author gulvan
 */
class TextWindow extends Sprite
{
	private static final CROSS_W:Int = 18;
	private static final BORDER_THICKNESS:Int = 4;

	private var tf:TextField;
	private var cross:Null<Sprite>;
	private var acceptBtn:Null<TextField>;
	private var declineBtn:Null<TextField>;
	private var bg:Sprite;

	private var closeHandler:Void->Void;
	private var acceptHandler:Void->Void;
	private var declineHandler:Void->Void;
	
	public function new(text:RichString, ?type:TextWindowSize = PopUpMessage, closeModes:Array<CloseMode>, ?customWidth:Int, ?replaceDefaultFont:Bool = true) 
	{
		super();
		bg = new Sprite();
		addChild(bg);

		var textSize:Int;
		var boxWidth:Int;
		var defaultFont:String;
		var textAlign:TextFormatAlign;
		switch (type)
		{
			case PopUpMessage:
				textSize = 30;
				boxWidth = 450;
				textAlign = TextFormatAlign.CENTER;
				defaultFont = Fonts.ERAS;
			case Manual: 
				textSize = 16;
				boxWidth = 1000;
				textAlign = TextFormatAlign.LEFT;
				defaultFont = Fonts.ERASMEDIUM; 
		}
		if (customWidth != null)
			boxWidth = customWidth;
		if (replaceDefaultFont)
			text.fonts = [defaultFont].concat(text.fonts.slice(1));
		tf = text.format(textSize, boxWidth - CROSS_W * 2 - BORDER_THICKNESS*3, 0xCCCCCC, false, textAlign, true);
		tf.height = tf.textHeight + 5;
		this.add(tf, CROSS_W + 3*BORDER_THICKNESS/2, CROSS_W + 3*BORDER_THICKNESS/2);
		for (mode in closeModes)
			switch (mode)
			{
				case Cross(onClose): 
					closeHandler = onClose;
					cross = Shapes.cross(0x990000, CROSS_W, 5);
					cross.buttonMode = true;
					this.add(cross, boxWidth - CROSS_W/2 - BORDER_THICKNESS*2, CROSS_W/2 + BORDER_THICKNESS*2);
				case Decide(onAccept, onDecline, acceptText, declineText):
					acceptHandler = onAccept;
					declineHandler = onDecline;
					acceptBtn = TextFields.popupDecide(acceptText, Color.bool(true));
					declineBtn = TextFields.popupDecide(declineText, Color.bool(false));
					var hbox:HBox = new HBox(35, boxWidth, null, true);
					hbox.addComponent(acceptBtn);
					hbox.addComponent(declineBtn);
					hbox.buttonMode = true;
					this.add(hbox, 0, tf.height + CROSS_W *2);
			}
		var decideOffset:Float = acceptBtn == null? 0 : acceptBtn.height;
		bg.addChild(Shapes.rect(boxWidth, tf.height + CROSS_W *2 + decideOffset, 0x333333, 4, LineStyle.Square, 0x000000, 0.9));
		addEventListener(Event.ADDED_TO_STAGE, onStage);
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
		if (cross != null && MathUtils.insideC(e.stageX, e.stageY, cross.getBounds(stage)))
		{
			removeEventListener(MouseEvent.CLICK, h);
			Sounds.CLICK.play();
			closeHandler();
		}
		else if (acceptBtn != null && MathUtils.insideC(e.stageX, e.stageY, acceptBtn.getBounds(stage)))
		{
			removeEventListener(MouseEvent.CLICK, h);
			Sounds.CLICK.play();
			acceptHandler();
		}
		else if (declineBtn != null && MathUtils.insideC(e.stageX, e.stageY, declineBtn.getBounds(stage)))
		{
			removeEventListener(MouseEvent.CLICK, h);
			Sounds.CLICK.play();
			declineHandler();
		}
	}
	
}