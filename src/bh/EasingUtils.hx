package bh;

import motion.easing.Expo;
import motion.easing.Cubic;
import motion.easing.Linear;
import motion.easing.IEasing;

enum Easing
{
    None;
    CubicIn;
    CubicOut;
    ExpoIn;
    ExpoOut;
}

class EasingUtils 
{
    public static function getEasing(e:Easing):IEasing 
    {
        return switch e 
        {
            case None: Linear.easeNone;
            case CubicIn: Cubic.easeIn;
            case CubicOut: Cubic.easeOut;
            case ExpoIn: Expo.easeIn;
            case ExpoOut: Expo.easeOut;
        }
    }  
    
    public static function getEnum(e:IEasing):Null<Easing>
    {
        if (Std.is(e, LinearEaseNone))
            return None;
        else if (Std.is(e, CubicEaseIn))
            return CubicIn;
        else if (Std.is(e, CubicEaseOut))
            return CubicOut;
        else if (Std.is(e, ExpoEaseIn))
            return ExpoIn;
        else if (Std.is(e, ExpoEaseOut))
            return ExpoOut;
        else
            return null;
    }

    public static function getName(e:IEasing):Null<String>
    {
        var en = getEnum(e);
        return en == null? null : en.getName();
    }
}