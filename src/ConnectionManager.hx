package;
import battle.Ability;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import graphic.components.LoginForm;
import haxe.Timer;
import mphx.client.Client;

enum ClientState
{
	NotConnected;
	NotLogged;
	Logged;
	InBattle;
}

enum Events
{
	Login;
	RoamData;
	Matchmaking;
	InBattle;
}

typedef RoamingData = {
	player:Null<Xml>,
	progress:Null<Xml>
}

typedef BattleData = {
	common:Null<Array<UnitData>>,
	personal:Null<Array<Ability>>
}

typedef Focus = {
  var abilityNum:Int;
  var target:UnitCoords;
}

/**
 * Controls the connection and performs actions aiming at interaction with the server
 * @author gulvan
 */
class ConnectionManager 
{
	
	private static var s:Client;
	public static var state(default, null):ClientState = ClientState.NotConnected;
	private static var data:RoamingData = {player: null, progress: null};
	private static var bdata:BattleData = {common: null, personal: null};
	private static var updater:Timer;
	
	private static var loginSource:Null<LoginForm>;
	
	public static function useAbility(f:Focus)
	{
		if (state == ClientState.InBattle)
			s.send("UseRequest", f);
	}
	
	public static function skipTurn()
	{
		if (state == ClientState.InBattle)
			s.send("SkipTurn");
	}
	
	public static function quit()
	{
		if (state == ClientState.InBattle)
			s.send("QuitBattle");
	}
	
	public static function findMatch()
	{
		if (state == ClientState.Logged)
		{
			s.send("FindMatch");
			s.events.on("BattleStarted", onCommonData);
			s.events.on("BattlePersonal", onPersonalData);
		}
	}
	
	private static function onCommonData(data:Array<UnitData>)
	{
		bdata.common = data;
		if (bdata.personal != null)
			onBothBDataRecieved();
	}
	
	private static function onPersonalData(data:Array<Ability>)
	{
		bdata.personal = data;
		if (bdata.common != null)
			onBothBDataRecieved();
	}
	
	private static function onBothBDataRecieved()
	{
		remove(Events.Matchmaking);
		s.send("InitialDataRecieved");
		state = ClientState.InBattle;
		Main.listener.battleDataRecieved(bdata.common, bdata.personal);
	}
	
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
	
	private static function loggedIn(login:String)
	{
		remove(Events.Login);
		state = ClientState.Logged;
		Main.login = login;
		loginSource.display("Loading player data...");
		s.events.on("PlayerData", onPlayerRecieved);
		s.events.on("ProgressData", onProgressRecieved);
		s.events.on("PlayerProgressData", onBothDataRecieved);
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
	
	private static function onBothDataRecieved(?combined:Null<String>)
	{
		var xml:Xml = Xml.parse(combined);
		remove(Events.RoamData);
		loginSource = null;
		if (combined == null)
			Main.listener.playerDataRecieved(data.player, data.progress);
		else
			Main.listener.playerDataRecieved(xml, xml);
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
			Events.RoamData => ["PlayerData", "ProgressData", "PlayerProgressData"],
			Events.Matchmaking => ["BattleStarted", "BattlePersonal"],
			Events.InBattle => ["BattleWarning", "HPUpdate", "ManaUpdate", "AlacrityUpdate", "BuffQueueUpdate", "Tick", "Miss", "Death", "Thrown", "Strike", "BattleEnded"]
		];
		
		for (e in events[type])
			s.events.remove(e);
	}
	
}