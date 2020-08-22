package graphic.components.startmenu;

import haxe.Timer;
import haxe.ui.components.Button;
import openfl.display.Sprite;
import openfl.text.TextField;

/**
 * ...
 * @author gulvan
 */
class CantConnect extends Sprite 
{
	
	private var WIDTH:Int = 300;
	private var message:TextField;
	private var connectBtn:Button;
	
	public function new(callback:Void->Void) 
	{
		super();
		message = TextFields.default1("Error: Unable to connect to the server. You're not connected to the internet or the server went offline. Try again after several minutes.", WIDTH);
		connectBtn = new Button();
		connectBtn.text = "Connect";
		connectBtn.width = 100;
		connectBtn.x = (WIDTH - 100) / 2;
		connectBtn.y = message.height + 5;
		connectBtn.onClick = function(e){connectHandler(callback); };
		addChild(message);
		addChild(connectBtn);
	}
	
	private function connectHandler(cb:Void->Void)
	{
		message.text = "Connecting...";
		Timer.delay(cb, 100);
	}
	
	override private function get_width():Float 
	{
		return WIDTH;
	}
	
	override private function get_height():Float 
	{
		return message.height + connectBtn.height + 5;
	}
	
}