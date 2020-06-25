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
        if (e == Linear.easeNone)
            return None;
        else if (e == Cubic.easeIn)
            return CubicIn;
        else if (e == Cubic.easeOut)
            return CubicOut;
        else if (e == Expo.easeIn)
            return ExpoIn;
        else if (e == Expo.easeOut)
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