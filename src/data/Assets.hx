package data;
import haxe.io.Error;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;

/**
 * [STATIC_SERVICE] Returns graphics by id (all ids)
 * @author Gulvan
 */
class Assets 
{

	public static function getAssetByID(id:String):MovieClip
	{
		switch (id)
		{
			//ABILITIES
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
			case "ability_shock_therapy":
				return new ShockTherapy();
			case "ability_high_voltage":
				return new HighVoltage();
			case "ability_electrical_storm":
				return new ElectricalStorm();
			case "ability_charge":
				return new Charge();
			//UNITS
			case "unit_hero":
				return new Hero();
			case "unit_zealon":
				return new Zealon();
			case "unit_icarus":
				return new Icarus();
			case "unit_hugo":
				return new Hugo();
			case "unit_ghost":
				return new Ghost();
			case "unit_archghost":
				return new Archghost();
			case "unit_terminator":
				return new Terminator();
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
	
	public static function getAnimationByAbilityID(id:String):MovieClip
	{
		switch(id)
		{
			case "ability_shock_therapy":
				return new AShockTherapy();
			default:
				trace("Warning! Incorrect ability id: " + id);
				return new MovieClip();
		}
	}
	
}