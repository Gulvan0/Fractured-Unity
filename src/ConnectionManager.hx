package;
import graphic.components.LoginForm;
import haxe.Timer;
import mphx.client.Client;

enum ClientState
{
	NotLogged;
	Logged;
}

/**
 * Controls the connection and performs actions aiming at interaction with the server
 * @author gulvan
 */
class ConnectionManager 
{
	
	private static var s:Client;
	public static var state:ClientState;
	private static var updater:Timer;
	
	private static var loginSource:Null<LoginForm>;
	
	public static function logIn(username:String, password:String, form:LoginForm)
	{
		if (state == ClientState.NotLogged)
		{
			loginSource = form;
			s.events.on("BadLogin", badLogin);
			s.events.on("LoggedIn", loggedIn);
			s.events.on("AlreadyLogged", function(d){trace("Warning: Repeated login attempt");});
			s.send("Login", {login: username, password: password});
		}
	}
	
	private static function badLogin(data:Dynamic)
	{
		s.events.remove("BadLogin");
		s.events.remove("LoggedIn");
		s.events.remove("AlreadyLogged");
		loginSource.displayError("Incorrect login/password");
	}
	
	private static function loggedIn(data:Dynamic)
	{
		s.events.remove("BadLogin");
		s.events.remove("LoggedIn");
		s.events.remove("AlreadyLogged");
		state = ClientState.Logged;
		loginSource = null;
		s.events.on("SendPlayer", buildPlayer);
		s.send("GetPlayer");
	}
	
	private static function buildPlayer(xml:String)
	{
		s.events.remove("SendPlayer");
		
	}
	
	public static function init(host:String, port:Int)
	{
		state = ClientState.NotLogged;
		s = new Client(host, port);
		
		updater = new Timer(200);
		updater.run = s.update.bind(0);
		
		s.onConnectionError = function(e){throw "ConnectionFailed"; };
		s.connect();
	}
	
}