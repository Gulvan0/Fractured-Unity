package;
import battle.Ability;
import battle.Buff;
import battle.Common;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import graphic.components.LoginForm;
import haxe.Json;
import haxe.Timer;
import json2object.JsonParser;
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
	private static var common:Null<Common>;
	
	public static function setCommon(c:Common)
	{
		common = c;
		s.events.on("HPUpdate", common.onhpUpdate);
		s.events.on("ManaUpdate", common.onManaUpdate);
		s.events.on("AlacrityUpdate", common.onAlacUpdate);
		s.events.on("BuffQueueUpdate", common.onBuffQueueUpdate);
		s.events.on("Tick", common.onTick);
		s.events.on("Miss", common.onMiss);
		s.events.on("Death", common.onDeath);
		s.events.on("Thrown", common.onThrown);
		s.events.on("Strike", common.onStrike);
		s.events.on("Turn", common.onTurn);
		s.events.on("BattleEnded", onBattleEnded);
		s.send("InitialDataRecieved");
		trace("Confirmation sent!");
	}
	
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
			s.events.on("BattleStarted", onCommonData);
			s.events.on("BattlePersonal", onPersonalData);
			s.send("FindMatch");
		}
	}
	
	private static function onCommonData(d:String)
	{
		var parser = new JsonParser<Array<UnitData>>();
		var data:Array<UnitData> = parser.fromJson(d);
		bdata.common = data;
		if (bdata.personal != null)
			onBothBDataRecieved();
	}
	
	private static function onPersonalData(d:String)
	{
		var parser = new JsonParser<Array<Ability>>();
		var data:Array<Ability> = parser.fromJson(d);
		bdata.personal = data;
		if (bdata.common != null)
			onBothBDataRecieved();
	}
	
	private static function onBattleEnded(d:String)
	{
		var parser = new JsonParser<Array<String>>();
		var data:Null<Bool> = d == "DRAW"? null : parser.fromJson(d).remove(Main.login);
		remove(Events.InBattle);
		state = ClientState.Logged;
		common.onEnded(data);
		Main.listener.battleFinished();
	}
	
	private static function onBothBDataRecieved()
	{
		trace(3);
		remove(Events.Matchmaking);
		state = ClientState.InBattle;
		Main.listener.battleDataRecieved(bdata.common, bdata.personal);
	}
	
	public static function logIn(username:String, password:String, ?form:Null<LoginForm>)
	{
		if (state == ClientState.NotLogged)
		{
			if (form != null)
			{
				loginSource = form;
				s.events.on("BadLogin", badLogin);
				s.events.on("AlreadyLogged", function(d){trace("Warning: Repeated login attempt"); });
				s.events.on("LoggedIn", function(d){loginSource.display("Loading player data..."); loggedIn(d);} );
			}
			else
				s.events.on("LoggedIn", loggedIn);
			s.send("Login", {login: username, password: password});
		}
	}
	
	public static function debugLogIn()
	{
		s.events.on("AlreadyLogged", function(d){logIn("KazvixX", "naconaco"); Main.login = "KazvixX"; });
		Main.login = "Gulvan";
		logIn("Gulvan", "Lobash21");
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
		s.onConnectionClose = function(e)
		{
			state = ClientState.NotConnected;
		};
		s.connect();
	}
	
	private static function remove(type:Events)
	{
		var events:Map<Events, Array<String>> = [
			Events.Login => ["BadLogin", "LoggedIn", "AlreadyLogged"],
			Events.RoamData => ["PlayerData", "ProgressData", "PlayerProgressData"],
			Events.Matchmaking => ["BattleStarted", "BattlePersonal"],
			Events.InBattle => ["Turn", "BattleWarning", "HPUpdate", "ManaUpdate", "AlacrityUpdate", "BuffQueueUpdate", "Tick", "Miss", "Death", "Thrown", "Strike", "BattleEnded"]
		];
		
		for (e in events[type])
			s.events.remove(e);
	}
	
}