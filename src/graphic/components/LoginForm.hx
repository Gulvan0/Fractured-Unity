package graphic.components;

import haxe.Timer;
import haxe.ui.components.TextField;
import haxe.ui.containers.Box;

/**
 * ...
 * @author gulvan
 */
@:build(haxe.ui.macros.ComponentMacros.build("graphic/components/loginForm.xml"))
class LoginForm extends Box 
{

	public function new() 
	{
		super();
		usernametf.restrictChars = "0-9a-zA-Z";
		passwordtf.restrictChars = "0-9a-zA-Z";
		connectBtn.onClick = function (e)
		{
			display("");
			
			ConnectionManager.logIn(usernametf.text, passwordtf.text, this, remember.selected);
		}
		registerBtn.onClick = function (e)
		{
			display("");
			ConnectionManager.register(usernametf.text, passwordtf.text, this, remember.selected);
		}
	}
	
	public function display(text:String)
	{
		errorMess.text = text;
		Utils.centre(errorMess);
	}
	
	override private function get_width():Float 
	{
		return usernametf.width;
	}
	
	override private function get_height():Float 
	{
		return 100;
	}
	
}