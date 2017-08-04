package data;
import haxe.io.Error;
import openfl.display.DisplayObject;

/**
 * [STATIC_SERVICE] Returns graphics by id (all ids)
 * @author Gulvan
 */
class Assets 
{

	public static function getAssetByID(id:String):DisplayObject
	{
		switch (id)
		{
			case "gui_battle_upper_bar":
				return new UpperBattleBar();
			case "gui_battle_bottom_bar":
				return new BottomBattleBar();
			case "gui_battle_skip_turn":
				return new SkipTurn();
			case "gui_battle_leave_battle":
				return new LeaveBattle();
			case "ability_quick_strike":
				return new QuickStrike();
			case "ability_heal":
				return new Heal();
			case "ability_dark_pact":
				return new DarkPact();
			case "ability_empty":
				return new NoAbility();
			case "ability_locked":
				return new LockedAbility();
			case "unit_hero":
				return new Hero();
			case "unit_ghost":
				return new Ghost();
			default:
				trace("ERROR! No asset was found with such ID: " + id);
				throw 0;
		}
	}
	
	public static function getBattleBGByZone(zone:Int):DisplayObject
	{
		switch(zone)
		{
			case 0:
				return new NullZoneBG();
			default:
				trace("ERROR! Incorrect zone number: " + zone);
				throw 0;
		}
	}
	
	public static function getRoamingBGByZone(zone:Int):DisplayObject
	{
		switch(zone)
		{
			default:
				trace("ERROR! Incorrect zone number: " + zone);
				throw 0;
		}
	}
	
}