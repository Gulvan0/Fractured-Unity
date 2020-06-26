package engine;

import bh.enums.AttackType;
import bh.enums.DispenserType;
import struct.Attribute;
import struct.Element;
import openfl.filters.ColorMatrixFilter;

enum Channel
{
    Red;
    Green;
    Blue;
}

class Color 
{

    public static var HEAL:Int = 0x33FA01;
    public static function elemental(element:Element):Int
	{
		return switch (element)
		{
			case Element.Fire: 0xFF6509;
			case Element.Terra: 0x6A744B;
			case Element.Lightning: 0xffff66;
			case Element.Shadow: 0x5f316e;
			case Element.Frost: 0x00bfff;
			case Element.Poison: 0x0f4d16;
			case Element.Physical: 0xCA2828;
		};
    }
    
    public static function attribute(att:Attribute):Int
	{
        return switch att 
        {
            case Strength: 0x990000;
            case Flow: 0x00CC00;
            case Intellect: 0x0066CC;
        }
    }
    
    public static function helpDispenserColor(disp:DispenserType):Int
	{
        return switch disp {
            case Emitter: 0xFFFF33;
            case Sequential: 0x0066FF;
            case Obstacle: 0x666666;
            case Geyser: 0x66FF00;
        }
    }
    
    public static function helpAttackTypeColor(type:AttackType):Int
	{
        return switch type {
            case Instant: 0xFF9900;
            case Delayed: 0x33FFCC;
        }
	}

    public static function darken(color:Int, convertBlue:Bool):Int
	{
		var channels = disperse(color);
        for (ch in channels.keys())
            channels[ch] -= Math.ceil(channels[ch] * 0.6);
		if (convertBlue) channels[Blue] = Math.round((channels[Red] + channels[Green]) / 6);
		return construct(channels[Red], channels[Green], channels[Blue]);
	}

    public static function getTransformationTo(color:Int):ColorMatrixFilter
    {
        var channels = disperse(color);
        return new ColorMatrixFilter([0, 0, 0, 0, channels[Red], 0, 0, 0, 0, channels[Green], 0, 0, 0, 0, channels[Blue], 0, 0, 0, 1, 0]);
    }

    public static function construct(red:Int, green:Int, blue:Int):Int
    {
        return Math.round(red * Math.pow(16, 4) + green * Math.pow(16, 2) + blue);
    }

    ///More economic version than 3 getChannel() calls
    public static function disperse(color:Int):Map<Channel, Int>
    {
        var map:Map<Channel, Int> = [];
        map[Blue] = cast color % Math.pow(16, 2);
        color -= map[Blue];
        color = cast color / Math.pow(16, 2);
        map[Green] = cast color % Math.pow(16, 2);
        color -= map[Green];
        color = cast color / Math.pow(16, 2);
        map[Red] = color;
        return map;
    }

}