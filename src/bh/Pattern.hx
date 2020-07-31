package bh;

import io.AbilityParser;
import io.AbilityParser.AbilityInfo;
import bh.EasingUtils.Easing;
import bh.enums.DispenserType;
import io.AdvancedJSONReader;
import ID.AbilityID;
import battle.enums.AbilityType;
import battle.enums.AbilityTarget;
import motion.easing.Linear;
import motion.easing.IEasing;
import json2object.JsonWriter;
using Lambda;

typedef BHParamPrototype =
{
    name:String,
    leftBorder:Null<Float>,
    rightBorder:Null<Float>,
    integer:Bool
}

class Pattern
{
    public var variablePrototypes:Array<BHParamPrototype>;
    public var customEasing:Bool;
    public var objects:Array<PatternObject>;

    public inline function isEmpty():Bool
    {
        return Lambda.empty(objects);
    }

    public function toJson():String
    {
        var s:String = "[";
        for (i in 0...objects.length)
        {
            if (i > 0)
                s += ", ";
            s += objects[i].toJson(customEasing);
        }   
        s += "]";
        return s;
    }

    ///Creates an object with given or default parameters
    public function createObject(x:Float, y:Float, ?paramValues:Map<String, Float>, ?easing:IEasing, ?addTo:Int)
    {
        var objEasing:Null<IEasing> = null;
        if (customEasing)
            if (easing != null)
                objEasing = easing;
            else
                objEasing = Linear.easeNone;
        var params:Map<String, BHParameter> = [];
        for (proto in variablePrototypes)
        {
            var paramValue:Null<Float> = null;
            if (paramValues != null && paramValues.exists(proto.name))
                paramValue = paramValues[proto.name];
            var p = new BHParameter(proto.leftBorder, proto.rightBorder, proto.integer, paramValue);
            params.set(proto.name, p);
        }
        if (addTo == null)
            objects.push(new PatternObject(x, y, params, objEasing));
        else
            objects.insert(addTo, new PatternObject(x, y, params, objEasing));
    }

    ///Finds and removes object with given position
    public function removeObject(x:Float, y:Float)
    {
        for (o in objects)
            if (o.x == x && o.y == y)
            {
                objects.remove(o);
                break;
            }
    }

    public function new(variablePrototypes:Array<BHParamPrototype>, customEasing:Bool) 
    {
        this.variablePrototypes = variablePrototypes;
        this.customEasing = customEasing;
        objects = [];
    }

    public static function fromJson(ability:AbilityID, json:String):Pattern
    {
        var p:Pattern = firstTimeCreate(ability);
        var reader:AdvancedJSONReader = new AdvancedJSONReader(json);
        var particles = reader.parseArray();
        for (prt in particles)
        {
            var prtReader:AdvancedJSONReader = new AdvancedJSONReader(prt);
            var x:Float = prtReader.parseAsFloat("x");
            var y:Float = prtReader.parseAsFloat("y");
            var paramMap:Map<String, Float> = [for (proto in p.variablePrototypes) proto.name => prtReader.parseAsFloat(proto.name)];
            if (prtReader.hasProperty("easing"))
            {
                var easing:IEasing = EasingUtils.getEasing(prtReader.parseAsEnumName(EasingUtils.Easing, "easing"));
                p.createObject(x, y, paramMap, easing);
            }
            else
                p.createObject(x, y, paramMap);
        }
        return p;
    }

    //? Maybe move to server
    public static function firstTimeCreate(id:AbilityID):Pattern
    {
        var ability:AbilityInfo = AbilityParser.abilities.get(id);
        var customEasing:Bool = false;
        var prototypes:Array<BHParamPrototype> = [];

        if (ability.danmakuProps.field("easing") == "Custom")
            customEasing = true;

        if (ability.danmakuProps.hasField("parameters"))
        {
            var params:Array<Dynamic> = ability.danmakuProps.field("parameters");
            for (param in params)
            {
                if (!param.hasField("integer"))
                    param.setField("integer", false);
                prototypes.push(param);
            }
        }

        if (ability.danmakuDispenser == DispenserType.Sequential)
            prototypes.push({name: "Order", leftBorder:1, rightBorder:100, integer: true}); //TODO: Order restrictions - right border and uniqueness

        if (ability.danmakuProps.field("rotatable") == true)
            prototypes.push({name: "Rotation", leftBorder:0, rightBorder:360, integer: false});

        return new Pattern(prototypes, customEasing);
    }
}