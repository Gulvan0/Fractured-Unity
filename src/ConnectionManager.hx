package;
using struct.Utils;
import ID.AbilityID;
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
	InBattle;
}

typedef RoamingData = {
	player:Null<Xml>,
	progress:Null<Xml>
}

typedef BattleData = {
	common:Array<UnitData>,
	personal:Array<Ability>
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
		s.events.on("BHCloseGame", common.onCloseBHGameRequest);
		s.events.on("BHCloseDemo", common.onCloseBHDemoRequest);
		s.send("InitialDataRecieved");
	}

	private static function sendRequest(questionEvent:String, answerEvent:String, onAnswer:String->Void, ?questionData:Dynamic) 
	{
		s.send(questionEvent, questionData);
		s.events.on(answerEvent, function (d:String)
		{
			s.events.remove(answerEvent);
			onAnswer(d);
		});
	}

	private static function toXML(d:String):Null<Xml> {
		return d == ""? null : Xml.parse(d);
	}

	//Requests

	public static function getVersion(onRecieved:String->Void) {
		sendRequest("GetVersion", "Version", onRecieved);
	}
	public static function getPattern(id:AbilityID, pos:Int, onRecieved:String->Void) {
		sendRequest("GetPatternByID", "BHPattern", onRecieved, {id:id.getName(), pos:pos});
	}
	public static function setPattern(id:AbilityID, pos:Int, pattern:String) {
		s.send("SetPatternByID", {id:id.getName(), pos:pos, pattern:pattern});
	}

	//Notifiers

	public static function sendBHTick(t:Int, soulX:Float, soulY:Float)
	{
		if (state == ClientState.InBattle)
			s.send("BHTick", '$t|$soulX|$soulY');
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
	public static function useBHAbility(id:AbilityID)
	{
		if (state == ClientState.InBattle)
			s.send("UseRequest", {abilityNum: common.findAbility(id), target: common.playerCoords});
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
	
	//Roaming notifiers

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
		function cb(s:String):Void
		{
			onRoamData(s);
			callback();
		}

		if (state == ClientState.Logged)
			sendRequest("ReSpec", "PlayerProgressData", cb);
	}

	public static function updateData(callback:Void->Void) //? Is it needed?
	{
		function cb(s:String):Void
		{
			onRoamData(s);
			callback();
		}
		sendRequest("GetPlPrData", "PlayerProgressData", cb);
	}
	
	private static function onBattleData(d:String, cb:BattleData->Void)
	{
		state = ClientState.InBattle;
		var parser = new JsonParser<BattleData>();
		var data:BattleData = parser.fromJson(d);
		cb(data);
	}
	
	private static function onRoamData(dataStr:String)
	{
		Main.player = Json.parse(dataStr);
		//TODO: [Conquest update] Set progress
	}

	public static function findMatch(onFound:BattleData->Void)
	{
		if (state == ClientState.Logged)
			sendRequest("FindMatch", "BattleStarted", onBattleData.bind(_, onFound));
	}
	
	private static function onBattleEnded(data:BattleResult)
	{
		var win:Null<Bool> = data.outcome == "WIN"? true : data.outcome == "LOSS"? false : null;
		remove(Events.InBattle);
		state = ClientState.Logged;
		common.onEnded(win, data.xp, data.rating);
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
				remove(Events.Login);
				state = ClientState.Logged;
				Main.login = username;
			});

			function cb(s:String)
			{
				onRoamData(s);
				onDataLoaded();
			}
			sendRequest("Login", "PlayerProgressData", cb, {login: username, password: password});
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
				remove(Events.Login);
				state = ClientState.Logged;
				Main.login = username;
			});
			
			function cb(s:String)
			{
				onRoamData(s);
				onDataLoaded();
			}
			sendRequest("Register", "PlayerProgressData", cb, {login: username, password: password});
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
			Events.InBattle => ["Turn", "BattleWarning", "HPUpdate", "ManaUpdate", "AlacrityUpdate", "BuffQueueUpdate", "Tick", "Miss", "Death", "Thrown", "Strike", "BattleEnded", "BHTick", "BHCloseGame", "BHCloseDemo"]
		];
		
		for (e in events[type])
			s.events.remove(e);
	}
	
}