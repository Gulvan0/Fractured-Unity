package;

import struct.Element;
import struct.Attribute;
import hxassert.Assert;

enum BattleOutcome
{
    Win;
    Loss;
    Draw;    
}
/**
 * Contains game-rule constants and dependencies
 * @author Gulvan
 */
class GameRules
{

    public static inline var initialAbilityPoints:Int = 1;
    public static inline var initialAttributePoints:Int = 4;
    public static inline var initialAttributeValues:Int = 10;

    public static inline var basicHP:Int = -50;
    public static inline var basicMana:Int = 80;

    public static inline var treeWidth:Int = 4;
    public static inline var treeHeight:Int = 7;

    public static inline var bhRectW:Int = 750;
    public static inline var bhRectH:Int = 750;
    public static inline var bhTicksDuration:Int = 500;
    public static inline var bhTickInterval:Int = 25;

    public static inline var bhObjectPosRestrictionRadius:Float = 100;

    public static inline var defaultDelayedPatternDuration:Int = 5;
    
    public static function xpToLvlup(currentLevel:Int):Int
	{
		Assert.assert(currentLevel > 0);
		var base1:Int = 30;
		var base2:Int = 100;
		if (currentLevel == 1)
			return 20;
		if (currentLevel <= 8)
			return base1 + 5 * (currentLevel - 2);
		else
			return base2 + 10 * (currentLevel - 9);
	}

    ///May depend on level in the future
    public static function abPointsLvlupBonus():Int
    {
        return 1;
    }

    ///May depend on level in the future
    public static function attPointsLvlupBonus():Int
    {
        return 3;
    }

    public static function attributeLvlupBonus(el:Element):Map<Attribute, Int>
    {
        return switch (el)
        {
            case Element.Lightning:
                [Attribute.Strength => 1,
                Attribute.Flow => 1,
                Attribute.Intellect => 6];
            case Element.Fire:
                [Attribute.Strength => 2,
                Attribute.Flow => 4,
                Attribute.Intellect => 2];
            case Element.Terra:
                [Attribute.Strength => 6,
                Attribute.Flow => 1,
                Attribute.Intellect => 1];
            case Element.Shadow:
                [Attribute.Strength => 3,
                Attribute.Flow => 3,
                Attribute.Intellect => 3];
            case Element.Frost:
                [Attribute.Strength => 1,
                Attribute.Flow => 2,
                Attribute.Intellect => 4];
            case Element.Poison:
                [Attribute.Strength => 3,
                Attribute.Flow => 3,
                Attribute.Intellect => 2];
            default: [Attribute.Strength => 1, Attribute.Flow => 1, Attribute.Intellect => 1];
        };
    }

    public static function wheelSlotCount(level:Int):Int
    {
        return 8;
    }

    public static function hpStBonus(strength:Int):Int
    {
        return 15 * strength;
    }

    public static function manaInBonus(intellect:Int):Int
    {
        return 2 * intellect;
    }

    public static function ratingRewardPVP(outcome:BattleOutcome, ratingDifference:Int):Int
    {
        if (outcome == BattleOutcome.Win)
            return Math.round(Math.min(50, 25 + Math.abs(ratingDifference) / 100));
        else if (outcome == BattleOutcome.Loss)
            return -Math.round(Math.min(50, 25 + Math.abs(ratingDifference) / 100));
        else
            return 0;
    }

    public static function xpRewardPVP(outcome:BattleOutcome):Int
    {
        if (outcome == BattleOutcome.Win)
            return 50;
        else if (outcome == BattleOutcome.Draw)
            return 30;
        else
            return 10; 
    }

    public static function xpRewardPVE(outcome:BattleOutcome, isBoss:Bool):Int
    {
        if (outcome == BattleOutcome.Win)
        {
            if (isBoss)
                return 100;
            else
                return 50;
        }
        else if (outcome == BattleOutcome.Draw)
            return 25;
        else 
            return 5;
    }
}