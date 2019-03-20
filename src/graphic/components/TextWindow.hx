package graphic.components;
import haxe.ui.util.Rectangle;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.Sprite;
import openfl.text.TextField;

/**
 * ...
 * @author gulvan
 */
class TextWindow extends SSprite 
{
	
	private var tf:TextField;
	private var bg:Sprite;
	
	public function new(text:String) 
	{
		super();
		tf = new TextField();
		tf.text = text;
		tf.defaultTextFormat.size = 20;
		bg = new Sprite();
		bg.graphics.lineStyle(4, 0x0B6482, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
		bg.graphics.beginFill(0x6297CC);
		bg.graphics.drawRect(0, 0, tf.width, tf.height);
		bg.graphics.endFill();
		addChild(bg);
		addChild(tf);
	}
	
}