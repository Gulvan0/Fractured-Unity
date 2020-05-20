package graphic.components;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.events.Event;
using graphic.SpriteExtension;

/**
 * Textfield for hints
 * @author Gulvan
 */
class HintTextfield extends Sprite
{
	public var id(default, null):Null<Dynamic>;
	public var header(default, set):String;
	public var text(default, set):String;
	
	private var headertf:TextField;
	private var headerbox:Sprite;
	private var tf:TextField;
	private var box:Sprite;
	
	public var textHeight(get, null):Float;
	
	public function new(header:String, text:String, ?id:Dynamic) 
	{
		super();
		this.header = header;
		this.text = text;
		this.id = id;

		addEventListener(Event.ADDED_TO_STAGE, draw);
		addEventListener(Event.REMOVED_FROM_STAGE, clear);
	}

	public function set_header(v:String):String
	{
		header = v;
		if (stage != null)
		{
			removeChild(headertf);
			removeChild(headerbox);
			drawHeader();
			this.add(headerbox, 0, 0);
			this.add(headertf, 0, 0);
		}
		return header;
	}

	public function set_text(v:String):String
	{
		text = v;
		if (stage != null)
		{
			removeChild(tf);
			removeChild(box);
			drawBody();
			this.add(box, 0, headerbox.height);
			this.add(tf, 0, headerbox.height);
		}
		return text;
	}
	
	public function terminate()
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, clear);
		removeEventListener(Event.ADDED_TO_STAGE, draw);
	}
	
	public function draw(e)
	{
		drawBody();
		drawHeader();
		this.add(headerbox, 0, 0);
		this.add(headertf, 0, 0);
		this.add(box, 0, headerbox.height);
		this.add(tf, 0, headerbox.height);
	}
	
	public function clear(e)
	{
		removeChild(headerbox);
		removeChild(headertf);
		removeChild(box);
		removeChild(tf);
	}
	
	private function drawHeader()
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
	
	private function drawBody()
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