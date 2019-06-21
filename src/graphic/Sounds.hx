package graphic;

import openfl.media.Sound;

class Sounds
{
    public static var CLICK(get, never):Sound;
    public static var INFO_APPEAR(get, never):Sound;
    public static var WINDOW_CLOSE(get, never):Sound;
    public static var BATTLEBGM1(get, never):Sound;
    public static var KICK(get, never):Sound;
    public static var HEAL(get, never):Sound;
    public static var THROW(get, never):Sound;
    public static var STRIKE(get, never):Map<Element, Sound>;
    public static var SPELL(get, never):Map<Element, Sound>;

    public static function get_CLICK():Sound
    {
        return openfl.Assets.getSound("sound/click.wav");
    }

    public static function get_INFO_APPEAR():Sound
    {
        return openfl.Assets.getSound("sound/info_appear.wav");
    }

    public static function get_WINDOW_CLOSE():Sound
    {
        return openfl.Assets.getSound("sound/window_close.wav");
    }

    public static function get_BATTLEBGM1():Sound
    {
        return openfl.Assets.getSound("sound/battle_bgm1.ogg");
    }

    public static function get_KICK():Sound
    {
        return openfl.Assets.getSound("sound/kick.wav");
    }

    public static function get_HEAL():Sound
    {
        return openfl.Assets.getSound("sound/heal.wav");
    }

    public static function get_THROW():Sound
    {
        return openfl.Assets.getSound("sound/throw.wav");
    }

    public static function get_STRIKE():Map<Element, Sound>
    {
        return [Element.Lightning => openfl.Assets.getSound("sound/lightning_strike.wav")];
    }

    public static function get_SPELL():Map<Element, Sound>
    {
        return [Element.Lightning => openfl.Assets.getSound("sound/lightning_spell.wav")];
    }
}