package io;

import ID.BuffID;
import struct.Utils;
import struct.Element;
import battle.enums.BattleEvent;
import bh.enums.AttackType;
import bh.enums.DispenserType;
import hxassert.Assert;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import ID.AbilityID;
import sys.io.File;
import sys.FileSystem;
import haxe.Json;
using Reflect;

typedef AbilityInfo =
{
    var id:AbilityID;
    var name:String;
    var description:Map<String, String>;
    var element:Element;
    var type:AbilityType;
    var target:Null<AbilityTarget>;
    var manacost:Array<Int>; //Empty if passive
    var cooldown:Array<Int>;//Empty if passive
    var maxlvl:Int;
    var danmakuType:Null<AttackType>; //Null if not danmaku ability
    var danmakuDispenser:Null<DispenserType>; //Null if not danmaku ability
    var danmakuProps:Null<Dynamic>;

    var aoe:Bool; //False if passive
    var triggers:Array<BattleEvent>; //Empty if active
}

typedef TreePos = {i:Int, j:Int}
typedef TreeAbility = {id:String, requires:String}
typedef Tree = Array<Array<TreeAbility>>;

enum BuffFlag 
{
    Overtime;
    Stun;
    Silence;
    Stackable;
    Morph;
    Undispellable;
    Danmaku;    
}

typedef ParsedBuff =
{
    var name:String;
    var rawDesc:String;
    var flags:Array<BuffFlag>;
    var triggers:Array<BattleEvent>;
    var element:Element;
}

class AbilityParser 
{

    public static var abilities(default, null):Map<AbilityID, AbilityInfo> = [];
    public static var treePositions(default, null):Map<AbilityID, TreePos> = [];
    public static var trees(default, null):Map<Element, Tree> = [];
    public static var buffs(default, null):Map<BuffID, ParsedBuff> = [];

    public static function initMap()
    {
        for (element in Element.createAll())
        {
            var path = Main.exePath() + "data\\classes\\" + Utils.getElementAbbreviation(element) + "\\abilities.json";
            if (!FileSystem.exists(path))
                continue;

            var full = Json.parse(File.getContent(path));
            for (prop in Reflect.fields(full))
            {
                var id:AbilityID = AbilityID.createByName(prop);
                var abilityObject = Reflect.field(full, prop);
                abilities.set(id, initAbility(abilityObject, id, element));
            }
        }
        for (element in Element.createAll())
        {
            var path = Main.exePath() + "data\\classes\\" + Utils.getElementAbbreviation(element) + "\\tree.json";
            if (!FileSystem.exists(path))
                continue;

            var full:Tree = Json.parse(File.getContent(path));
            trees.set(element, full);
            for (i in 0...full.length)
                for (j in 0...full[i].length)
                    treePositions.set(AbilityID.createByName(full[i][j].id), {i:i, j:j});
        }
        for (element in Element.createAll())
        {
            var path = Main.exePath() + "data\\classes\\" + Utils.getElementAbbreviation(element) + "\\buffs.json";
            if (!FileSystem.exists(path))
                continue;

            var full = Json.parse(File.getContent(path));
            for (prop in Reflect.fields(full))
            {
                var id:BuffID = BuffID.createByName(prop);
                var buffObj = Reflect.field(full, prop);
                buffs.set(id, initBuff(buffObj, id, element));
            }
        }
    }

    private static function initBuff(obj:Dynamic, id:BuffID, element:Element):ParsedBuff
    {
        Assert.assert(Reflect.hasField(obj, "description"));
        var flags:Array<BuffFlag> = [];
        if (Reflect.hasField(obj, "flags"))
        {
            var flagStrs:Array<String> = Reflect.field(obj, "flags");
            for (flag in flagStrs)
            {
                var flagName = flag.charAt(0).toUpperCase() + flag.substr(1);
                var flagEnumValue = BuffFlag.createByName(flagName);
                flags.push(flagEnumValue);
            }
        }

        var triggers:Array<BattleEvent> = [];
        if (Reflect.hasField(obj, "triggers"))
        {
            var trg:Array<String> = Reflect.field(obj, "triggers");
            triggers = trg.map(BattleEvent.createByName.bind(_, null));
        }
            
        return {
            name: Reflect.hasField(obj, "name")? Reflect.field(obj, "name"):retrieveImplicitName(id),
            element: element,
            rawDesc: Reflect.field(obj, "description"),
            flags: flags,
            triggers: triggers
        };
    }

    private static function initAbility(obj:Dynamic, id:AbilityID, element:Element):AbilityInfo
    {
        Assert.assert(obj.hasField("description"));
        Assert.assert(obj.hasField("type"));
        Assert.assert(obj.hasField("maxlvl"));

        var name:String = obj.hasField("name")? obj.field("name") : retrieveImplicitName(id);
        var description:Map<String, String> = [];
        var descObj = obj.field("description");
        for (prop in Reflect.fields(descObj))
            description.set(prop, Reflect.field(descObj, prop));
        var type:AbilityType = AbilityType.createByName(obj.field("type"));
        var target:Null<AbilityTarget> = obj.hasField("target")? AbilityTarget.createByName(obj.field("target")) : null;

        var maxlvl:Int = obj.field("maxlvl");
        var manacost:Array<Int>;
        if (!obj.hasField("manacost"))
            manacost = [];
        else
        {
            var value:Dynamic = obj.field("manacost");
            if (Std.is(value, Int))
                manacost = extend([value], maxlvl);
            else 
                manacost = value;
        }
        var cooldown:Array<Int>;
        if (!obj.hasField("cooldown"))
            cooldown = [];
        else
        {
            var value:Dynamic = obj.field("cooldown");
            if (Std.is(value, Int))
                cooldown = extend([value], maxlvl);
            else 
                cooldown = value;
        }

        var danmakuType:Null<AttackType> = null;
        var danmakuDispenser:Null<DispenserType> = null;
        var danmakuProps:Null<Dynamic> = null;
        if (obj.hasField("danmakuProps"))
        {
            danmakuProps = obj.field("danmakuProps");
            Assert.assert(danmakuProps.hasField("type"));
            Assert.assert(danmakuProps.hasField("dispenser"));
            danmakuType = AttackType.createByName(danmakuProps.field("type"));
            danmakuDispenser = DispenserType.createByName(danmakuProps.field("dispenser"));
        }
        var aoe:Bool = false;
        if (obj.hasField("aoe"))
            aoe = obj.field("aoe");
        var triggers:Array<String> = [];
        if (obj.hasField("triggers"))
            triggers = obj.field("triggers");

        return {
            id:id,
            name:name,
            description: description,
            element: element,
            type: type,
            target: target,
            cooldown: cooldown,
            manacost: manacost,
            maxlvl: maxlvl,
            danmakuType: danmakuType,
            danmakuDispenser: danmakuDispenser,
            danmakuProps: danmakuProps,
            aoe: aoe,
            triggers: triggers.map(BattleEvent.createByName.bind(_, null))
        };
    }

    public static function isParticleBased(ab:AbilityID):Bool
    {
        return abilities.get(ab).danmakuDispenser != Emitter;
    }

    public static function getLevel(ab:AbilityID):Int
    {
        var pos:TreePos = treePositions.get(ab);
        return Main.player.character.tree[pos.i][pos.j];
    }

    public static function getIDUsingPlayer(pos:TreePos):AbilityID
    {
        return AbilityID.createByName(trees.get(Element.createByName(Main.player.character.element))[pos.i][pos.j].id);
    }

    public static function isDanmakuBased(pos:TreePos):Bool
    {
        return isDanmakuBasedByID(getIDUsingPlayer(pos));
    }

    public static function isDanmakuBasedByID(id:AbilityID):Bool
    {
        return abilities.get(id).danmakuProps != null;
    }

    public static function canLearn(pos:TreePos):Bool
	{
        var levels = Main.player.character.tree;
        var element = Element.createByName(Main.player.character.element);
        var id = getIDUsingPlayer(pos);
		for (req in trees.get(element)[pos.i][pos.j].requires.split(""))
			if (req == "l" && levels[pos.i-1][pos.j-1] == 0)
                return false;
            else if (req == "c" && levels[pos.i-1][pos.j] == 0)
                return false;
            else if (req == "r" && levels[pos.i-1][pos.j+1] == 0)
                return false;
		return true;
	}

	public static function isMaxedOut(pos:TreePos):Bool
	{
		return abilities.get(getIDUsingPlayer(pos)).maxlvl == Main.player.character.tree[pos.i][pos.j];
	}

    private static function retrieveImplicitName(ab:EnumValue):String
    {
        var contracted:String = ab.getName().substr(2);
        var full:String = "";
        for (i in 0...contracted.length)
        {
            var char:String = contracted.charAt(i);
            if (char.toUpperCase() == char && i > 0)
                full += " ";
            full += char;
        }
        return full;
    }

    private static function extend<T>(a:Array<T>, newLength:Int):Array<T>
    {
        Assert.require(a.length > 0);
        var last:T = a[a.length-1];
        while (a.length < newLength)
            a.push(last);
        return a;
    }
}