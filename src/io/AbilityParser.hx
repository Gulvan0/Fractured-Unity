package io;

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

class AbilityParser 
{

    public static var abilities:Map<AbilityID, AbilityInfo>;

    public static function initMap()
    {
        abilities = [];
        for (element in Element.createAll())
        {
            var path = Main.exePath() + "data\\classes\\" + Utils.getElementAbbreviation(element) + "\\abilities.json";
            if (!FileSystem.exists(path))
                continue;

            var full = Json.parse(File.getContent(path));
            for (prop in Reflect.fields(full))
            {
                var id:AbilityID = AbilityID.createByName(prop);
                var abilityObject = full.field(prop);
                abilities.set(id, initAbility(abilityObject, id, element));
            }
        }
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
            description.set(prop, descObj.field(prop));
        var type:AbilityType = AbilityType.createByName("type");
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
        var danmakuProps:Null<DispenserType> = null;
        if (obj.hasField("danmakuProps"))
        {
            danmakuProps = obj.field("danmakuProps");
            Assert.assert(danmakuProps.hasField("type"));
            Assert.assert(danmakuProps.hasField("dispenser"));
            danmakuType = danmakuProps.field("type");
            danmakuDispenser = cast danmakuProps.field("dispenser");
        }
        var aoe:Bool = false;
        if (obj.hasField("aoe"))
            aoe = obj.field("aoe");
        var triggers:Array<BattleEvent> = [];
        if (obj.hasField("triggers"))
            triggers = obj.field("triggers").map(BattleEvent.createByName);

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
            triggers: triggers
        };
    }

    private static function retrieveImplicitName(ab:AbilityID):String
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