package graphic.components;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

/**
 * Textfield for hints
 * @author Gulvan
 */
class HintTextfield extends SSprite
{

	private var headertf:TextField;
	private var headerbox:Sprite;
	private var tf:TextField;
	private var box:Sprite;
	
	public var textHeight(get, null):Float;
	
	public function new(header:String, text:String) 
	{
		super();
		
		drawBody(text);
		drawHeader(header);
		
		addChild(headerbox);
		addChild(headertf);
		add(box, 0, headerbox.height);
		add(tf, 0, headerbox.height);
	}
	
	private function drawHeader(header:String)
	{
		var format:TextFormat = new TextFormat();
		format.color = 0x000000;
		format.size = 14;
		format.bold = true;
		
		headertf = new TextField();
		headertf.textColor = 0x000000;
		headertf.width = (headertf.textWidth + 5 > 150)? headertf.textWidth + 5 : 150;
		headertf.selectable = false;
		headertf.defaultTextFormat = format;
		headertf.text = header;
		
		headerbox = new Sprite();
		headerbox.graphics.lineStyle(1, 0x999999, 0.8);
		headerbox.graphics.beginFill(0xB0B0B0);
		headerbox.graphics.drawRect(0, 0, headertf.width, headertf.textHeight + 5);
		headerbox.graphics.endFill();
	}
	
	private function drawBody(text:String)
	{
		var format:TextFormat = new TextFormat();
		format.color = 0xffffff;
		format.size = 12;
		format.bold = false;
		
		tf = new TextField();
		tf.textColor = 0xffffff;
		tf.width = (headertf != null)? headertf.width : 150;
		tf.selectable = false;
		tf.wordWrap = true;
		tf.setTextFormat(format);
		tf.text = text;
		
		box = new Sprite();
		box.graphics.lineStyle(1, 0x999999, 0.8);
		box.graphics.beginFill(0x000000, 0.7);
		box.graphics.drawRect(0, 0, tf.width, tf.textHeight + 5);
		box.graphics.endFill();
	}
	
	function get_textHeight():Float 
	{
		return tf.textHeight + headertf.textHeight + 10;
	}
	
}