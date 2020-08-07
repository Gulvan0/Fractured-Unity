package graphic.components.startmenu;

import haxe.Timer;
import haxe.ui.components.TextField;
import haxe.ui.containers.Box;

/**
 * ...
 * @author gulvan
 */
@:build(haxe.ui.macros.ComponentMacros.build("graphic/components/startmenu/loginForm.xml"))
class LoginForm extends Box 
{
	public var onDataLoaded:Void->Void;
	public var onConnectionFailed:Void->Void;
	
	public function new() 
	{
		super();
		usernametf.restrictChars = "0-9a-zA-Z";
		passwordtf.restrictChars = "0-9a-zA-Z";
		connectBtn.onClick = function (e)
		{
			display("");
			
			ConnectionManager.logIn(usernametf.text, passwordtf.text, onDataLoaded, onLogged, onBadLogin, remember.selected);
		}
		registerBtn.onClick = function (e)
		{
			display("");
			ConnectionManager.register(usernametf.text, passwordtf.text, onDataLoaded, onRegistered, onNameTaken, remember.selected);
		}
	}

	private function onLogged()
	{
		display("Loading player data...");
	}

	private function onRegistered()
	{
		display("Success, logging in..."); 
	}

	private function onBadLogin()
	{
		display("Incorrect login/password");
	}

	private function onNameTaken()
	{
		display("An account with this name already exists");
	}
	
	private function display(text:String)
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