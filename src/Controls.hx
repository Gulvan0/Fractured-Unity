package;

import sys.FileSystem;
import sys.io.File;
import haxe.Json;
using StringTools;

enum Action
{
    UseAbility(pos:Int);
    BH_UP;
    BH_LEFT;
    BH_RIGHT;
    BH_DOWN;
    //SkipTurn;
}

class Controls
{
    private static var PATH:String = Main.exePath() + "controls.json";
    public static var map(default, null):Map<Int, Action> = [];

    public static function assign(keyCode:Int, action:Action)
    {
        map.set(keyCode, action);
        save();
    }

    public static function init()
    {
        if (!FileSystem.exists(PATH))
        {
            createMap();
            return;
        }

        var ctrlMap:Map<Int, String> = Json.parse(File.getContent(PATH));
        for (k => v in ctrlMap)
        {
            if (v.startsWith("ua"))
                map.set(k, UseAbility(Std.parseInt(v.substr(2))));
            else 
                map.set(k, Action.createByName(v));
        }
    }

    private static function createMap()
    {
        map = [
            49 => UseAbility(0),
            50 => UseAbility(1),
            51 => UseAbility(2),
            52 => UseAbility(3),
            81 => UseAbility(4),
            87 => UseAbility(5),
            69 => UseAbility(6),
            82 => UseAbility(7),
            37 => BH_LEFT,
            38 => BH_UP,
            39 => BH_RIGHT,
            40 => BH_DOWN
        ];
    }

    private static function save()
    {
        var ctrlMap:Map<Int, String> = [];
        for (k => v in map)
        {
            var str = switch v
            {
                case UseAbility(pos): "ua" + pos;
                default: v.getName();
            }
            ctrlMap.set(k, str);
        }
        File.saveContent(PATH, Json.stringify(ctrlMap));
    }
}