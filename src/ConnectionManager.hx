package;
import graphic.components.LoginForm;
import haxe.Timer;
import mphx.client.Client;

enum ClientState
{
	NotConnected;
	NotLogged;
	Logged;
}

enum Events
{
	Login;
	RoamData;
}

typedef Data = {
	player:Null<Xml>,
	progress:Null<Xml>
}

/**
 * Controls the connection and performs actions aiming at interaction with the server
 * @author gulvan
 */
class ConnectionManager 
{
	
	private static var s:Client;
	public static var state(default, null):ClientState = ClientState.NotConnected;
	private static var data:Data = {player: null, progress: null};
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
		remove(Events.Login);
		loginSource.display("Incorrect login/password");
	}
	
	private static function loggedIn(data:Dynamic)
	{
		remove(Events.Login);
		state = ClientState.Logged;
		loginSource.display("Loading player data...");
		s.events.on("PlayerData", onPlayerRecieved);
		s.events.on("ProgressData", onProgressRecieved);
	}
	
	private static function onPlayerRecieved(pl:Xml)
	{
		data.player = pl;
		if (data.progress != null)
			onBothDataRecieved();
	}
	
	private static function onProgressRecieved(pr:Xml)
	{
		data.progress = pr;
		if (data.player != null)
			onBothDataRecieved();
	}
	
	private static function onBothDataRecieved()
	{
		remove(Events.RoamData);
		loginSource = null;
		Main.listener.playerDataRecieved(data.player, data.progress);
	}
	
	public static function init(host:String, port:Int)
	{
		state = ClientState.NotLogged;
		s = new Client(host, port);
		
		updater = new Timer(200);
		updater.run = s.update.bind(0);
		
		s.onConnectionError = function(e)
		{
			state = ClientState.NotConnected;
			throw "ConnectionFailed"; 
		};
		s.connect();
	}
	
	private static function remove(type:Events)
	{
		var events:Map<Events, Array<String>> = [
			Events.Login => ["BadLogin", "LoggedIn", "AlreadyLogged"],
			Events.RoamData => ["PlayerData", "ProgressData"]
		];
		
		for (e in events[type])
			s.events.remove(e);
	}
	
}