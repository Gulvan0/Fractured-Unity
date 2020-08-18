package;

import openfl.filters.GlowFilter;
import openfl.filters.DropShadowFilter;
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
		var tf:TextField = new TextField();
		tf.text = "Testtest";
		tf.x = tf.y = 100;
	}
}
