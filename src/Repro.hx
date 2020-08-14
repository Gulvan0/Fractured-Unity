package;

import openfl.display.Sprite;
import openfl.text.TextFormat;
import openfl.text.TextField;

/**
 * @author Gulvan
 */
class Repro extends Sprite
{

	public function new() 
	{
		super();
		var tf1:TextField = new TextField();
		var tf2:TextField = new TextField();
		var baseFormat:TextFormat = new TextFormat(null, 25, 0x000000);
		var specFormat:TextFormat = new TextFormat(null, 25, 0xFF0000);
		tf1.text = tf2.text = "Testtesttest";
		tf1.setTextFormat(baseFormat);
		tf2.setTextFormat(baseFormat);
		tf2.setTextFormat(specFormat, 3, 5);
		tf1.x = tf1.y = tf2.x = 100;
		tf2.y = 200;
		addChild(tf1);
		addChild(tf2);
	}
}
