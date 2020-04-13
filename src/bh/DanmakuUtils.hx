package bh;

class DanmakuUtils
{
    public static inline function secondsToTicks(v:Float):Int
    {
        return Math.round(1000 * v / GameRules.bhTickInterval);
    }    
}