package graphic.components;

import haxe.Timer;
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
		connectBtn.onClick = function (e)
		{
			errorMess.text = "";
			ConnectionManager.logIn(usernametf.text, passwordtf.text, this);
		}
	}
	
	public function displayError(text:String)
	{
		errorMess.text = text;
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