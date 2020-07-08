package;
import haxe.Log;
import openfl.geom.Point;
import sys.io.File;
import sys.io.FileOutput;
import battle.Ability;
import battle.Buff;
import battle.Common;
import battle.enums.AbilityType;
import battle.enums.Team;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import haxe.Json;
import haxe.Timer;
import json2object.JsonParser;
import struct.Attribute;
import mphx.client.Client;

using io.IOUtils;

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

typedef BattleResult = {
	outcome:String,
	xp:Int, 
	rating:Null<Int>
}

typedef Focus = {
	var abilityNum:Int;
	var target:UnitCoords;
}

enum BHParameterUnit
{
    Number;
    Degree;
}

class BHParameterDetails
{
	public var name:String; 
	public var unit:BHParameterUnit; 
	public var from:Float; 
	public var to:Float;

	public function new(name:String, unit:BHParameterUnit, from:Float, to:Float)
	{
		this.name = name;
		this.unit = unit;
		this.from = from;
		this.to = to;
	}
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
	private static var playerdataCallback:Void->Void;
	private static var bdata:BattleData = {common: null, personal: null};
	private static var updater:Timer;
	
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
		s.events.on("Throw", common.onThrown);
		s.events.on("Strike", common.onStrike);
		s.events.on("Turn", common.onTurn);
		s.events.on("BattleEnded", onBattleEnded);
		s.events.on("BHTick", common.onForeignBHTick);
		s.events.on("BHVanish", common.onForeignBHVanish);
		s.events.on("BHCloseGame", common.onCloseBHGameRequest);
		s.events.on("BHCloseDemo", common.onCloseBHDemoRequest);
		s.send("InitialDataRecieved");
	}

	public static function getVersion(onRecieved:String->Void)
	{
		s.send("GetVersion");
		s.events.on("Version", function (d:String)
		{
			onRecieved(d);
			s.events.remove("Version");
		});
	}

	//Deprecated
	/*public static function getBHParams(onRecieved:Array<BHParameterDetails>->Void)
	{
		s.send("GetBHParams");
		s.events.on("BHParams", function (d:String)
		{
			var p:JsonParser<Array<BHParameterDetails>> = new JsonParser<Array<BHParameterDetails>>();
			onRecieved(p.fromJson(d));
			s.events.remove("BHParams");
		});
	}*/

	public static function getBHPatternByPos(i:Int, j:Int, num:Int, onRecieved:Xml->Void)
	{
		s.send("GetBHPatternByPos", {i:i, j:j, num:num});
		s.events.on("BHPattern", function (d:String)
		{
			s.events.remove("BHPattern");
			onRecieved(d == ""? null : Xml.parse(d));
		});
	}

	public static function getBHPatternByID(id:ID.AbilityID, num:Int, onRecieved:Xml->Void)
	{
		s.send("GetBHPatternByID", {id:id.getName(), num:num});
		s.events.on("BHPattern", function (d:String)
		{
			s.events.remove("BHPattern");
			onRecieved(d == ""? null : Xml.parse(d));
		});
	}

	public static function getBHPatternsByID(id:ID.AbilityID, onRecieved:Xml->Void)
	{
		s.send("GetBHPatternsByID", {id:id.getName()});
		s.events.on("BHPatterns", function (d:String)
		{
			s.events.remove("BHPatterns");
			onRecieved(Xml.parse(d));
		});
	}

	public static function setPatternByID(id:ID.AbilityID, num:Int, pattern:String, onSet:Void->Void)
	{
		s.send("SetBHPatternByID", {id:id.getName(), num:num, pattern:pattern.drain()});
		s.events.on("PatternSet", function (d:String)
		{
			s.events.remove("PatternSet");
			onSet();
		});
	}

	public static function setPatternsByID(id:ID.AbilityID, patterns:String, onSet:Void->Void)
	{
		s.send("SetBHPatternsByID", {id:id.getName(), patterns:patterns.drain()});
		s.events.on("PatternSet", function (d:String)
		{
			s.events.remove("PatternSet");
			onSet();
		});
	}

	public static function sendBHTick(t:Int, soulX:Float, soulY:Float)
	{
		if (state == ClientState.InBattle)
			s.send("BHTick", '$t|$soulX|$soulY');
	}

	//particleIndex changes dynamically, this change should be equal on all the clients
	public static function notifyVanish(t:Int, particleGroup:Int, particleIndex:Int)
	{
		if (state == ClientState.InBattle)
			s.send("BHVanish", '$t|$particleGroup|$particleIndex');
	}

	public static function notifyBoom()
	{
		if (state == ClientState.InBattle)
			s.send("BHBoom");
	}

	public static function notifyFinished()
	{
		if (state == ClientState.InBattle)
			s.send("BHFinished");
	}

	public static function notifyDemoClosed()
	{
		if (state == ClientState.InBattle)
			s.send("DemoClosed");
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
			bdata = {common: null, personal: null};
			s.events.on("BattleStarted", onCommonData);
			s.events.on("BattlePersonal", onPersonalData);
			s.send("FindMatch");
		}
	}

	public static function learnAbility(i:Int, j:Int)
	{
		if (state == ClientState.Logged)
			s.send("LearnAbility", i + "|" + j);
	}

	public static function putAbility(id:ID.AbilityID, pos:Int)
	{
		if (state == ClientState.Logged)
			s.send("PutAbility", id.getName() + "|" + pos);
	}

	public static function removeAbility(pos:Int)
	{
		if (state == ClientState.Logged)
			s.send("RemoveAbility", "" + pos);
	}

	public static function incrementAttribute(att:Attribute)
	{
		if (state == ClientState.Logged)
			s.send("IncrementAttribute", att.getName());
	}

	public static function respec(callback:Void->Void)
	{
		if (state == ClientState.Logged)
		{
			playerdataCallback = callback;
			s.events.on("PlayerData", onPlayerRecieved);
			s.events.on("ProgressData", onProgressRecieved);
			s.events.on("PlayerProgressData", onBothDataRecieved);
			s.send("ReSpec");
		}
	}

	public static function updatePlayerAndReturn(callback:Void->Void)
	{
		playerdataCallback = callback;
		s.events.on("PlayerData", onPlayerRecieved);
		s.events.on("ProgressData", onProgressRecieved);
		s.events.on("PlayerProgressData", onBothDataRecieved);
		s.send("GetPlPrData");
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
	
	private static function onBattleEnded(data:BattleResult)
	{
		var win:Null<Bool> = data.outcome == "WIN"? true : data.outcome == "LOSS"? false : null;
		remove(Events.InBattle);
		state = ClientState.Logged;
		common.onEnded(win, data.xp, data.rating);
	}
	
	private static function onBothBDataRecieved()
	{
		remove(Events.Matchmaking);
		state = ClientState.InBattle;
		Main.listener.battleDataRecieved(bdata.common, bdata.personal);
	}

	public static function logOut()
	{
		s.close();
		state = ClientState.NotConnected;
	}
	
	public static function logIn(username:String, password:String, onDataLoaded:Void->Void, ?onLoggedIn:Void->Void, ?onBadLogin:Null<Void->Void>, ?remember:Bool = false)
	{
		if (state == ClientState.NotLogged)
		{
			s.events.on("BadLogin", badLogin.bind(_, onBadLogin));
			s.events.on("AlreadyLogged", function(d){trace("Warning: Repeated login attempt"); });
			s.events.on("LoggedIn", function(d)
			{
				if (onLoggedIn != null)
					onLoggedIn();
				if (remember)
					rememberLogin(username, password);
				loggedIn(username);
			});

			playerdataCallback = onDataLoaded;
			s.send("Login", {login: username, password: password});
		}
	}

	public static function register(username:String, password:String, onDataLoaded:Void->Void, ?onRegistered:Void->Void, ?onNameTaken:Null<Void->Void>, ?remember:Bool = false)
	{
		if (state == ClientState.NotLogged)
		{
			s.events.on("AlreadyRegistered", function(d){onNameTaken();});
			s.events.on("LoggedIn", function(d){
				if (onRegistered != null)
					onRegistered();
				if (remember)
					rememberLogin(username, password);
				loggedIn(username);
			});
			
			playerdataCallback = onDataLoaded;
			s.send("Register", {login: username, password: password});
		}
	}
	
	private static function rememberLogin(login:String, pass:String)
	{
		var fo:FileOutput = File.write(Main.exePath() + "logindata.d");
		fo.writeString(login + "|" + pass);
		fo.close();
	}

	public static function debugLogIn(cb:Void->Void)
	{
		s.events.on("AlreadyLogged", function(d){
			Main.login = "KazvixX";
			logIn("KazvixX", "naconaco", cb); 
		});
		Main.login = "Gulvan";
		logIn("Gulvan", "Lobash21", cb);
	}
	
	private static function badLogin(data:Dynamic, onBadLogin:Null<Void->Void>)
	{
		remove(Events.Login);
		if (onBadLogin != null)
			onBadLogin();
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
		remove(Events.RoamData);
		if (combined == null)
			Main.listener.playerDataRecieved(data.player, data.progress);
		else
		{
			var xml:Xml = Xml.parse(combined);
			Main.listener.playerDataRecieved(xml, xml);
		}
		playerdataCallback();
		playerdataCallback = function(){};
	}
	
	public static function init(host:String, port:Int)
	{
		state = ClientState.NotLogged;
		s = new Client(host, port);
		
		updater = new Timer(25);
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
			Events.InBattle => ["Turn", "BattleWarning", "HPUpdate", "ManaUpdate", "AlacrityUpdate", "BuffQueueUpdate", "Tick", "Miss", "Death", "Thrown", "Strike", "BattleEnded", "BHTick", "BHVanish", "BHCloseGame", "BHCloseDemo"]
		];
		
		for (e in events[type])
			s.events.remove(e);
	}
	
}