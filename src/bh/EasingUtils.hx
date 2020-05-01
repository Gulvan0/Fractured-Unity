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
}