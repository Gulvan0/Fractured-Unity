package;
import haxe.io.Error;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import Element;

/**
 * [STATIC_SERVICE] Returns graphics by id (all ids)
 * @author Gulvan
 */
class Assets 
{

	public static function getAssetByID(id:ID):MovieClip
	{
		switch (id)
		{
			//ABILITIES
			case ID.EmptyAbility:
				return new NoAbility();
			case ID.LockAbility:
				return new LockedAbility();
			case ID.LgShockTherapy:
				return new ShockTherapy();
			case ID.LgHighVoltage:
				return new HighVoltage();
			case ID.LgElectricalStorm:
				return new ElectricalStorm();
			case ID.LgCharge:
				return new Charge();
			//UNITS
			case ID.UnitHero:
				return new Hero();
			case ID.PlayerZealon:
				return new Zealon();
			case ID.PlayerIcarus:
				return new Icarus();
			case ID.PlayerHugo:
				return new Hugo();
			case ID.UnitGhost:
				return new Ghost();
			case ID.UnitArchghost:
				return new Archghost();
			default:
				neko.Lib.rethrow("ERROR! No asset was found with such ID: " + id);
				return new MovieClip();
		}
	}
	
	public static function getBattleBGByZone(zone:Int):MovieClip
	{
		switch(zone)
		{
			case 0:
				return new NullZoneBG();
			default:
				trace("ERROR! Incorrect zone number: " + zone);
				neko.Lib.rethrow(0);
				return new MovieClip();
		}
	}
	
	public static function getRoamingBGByZone(zone:Int):MovieClip
	{
		switch(zone)
		{
			default:
				trace("ERROR! Incorrect zone number: " + zone);
				neko.Lib.rethrow(0);
				return new MovieClip();
		}
	}
	
	public static function getSpellAnimByAbilityID(id:ID):MovieClip
	{
		switch(id)
		{
			case ID.LgShockTherapy:
				return new AShockTherapy();
			default:
				trace("Warning! Incorrect ability id: " + id);
				return new MovieClip();
		}
	}
	
	public static function getBoltByElement(element:Element):MovieClip
	{
		switch (element)
		{
			case Element.Lightning: 
				return new LightningBolt();
			default: 
				trace("Warning! Incorrect element: " + element.getName());
				return new LightningBolt();
		}
	}
	
	public static function getSpellByElement(element:Element):MovieClip
	{
		switch (element)
		{
			default: 
				trace("Warning! Incorrect element: " + element.getName());
				return new MovieClip();
		}
	}
	
}