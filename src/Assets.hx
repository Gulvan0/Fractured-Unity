package;
import haxe.io.Error;
import haxe.macro.Expr.Case;
import hxassert.Assert;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import Element;

/**
 * [STATIC_SERVICE] Returns graphics by id (all ids)
 * @author Gulvan
 */
class Assets 
{
	
	public static function getBattleAbility(id:ID):MovieClip
	{
		switch (id)
		{
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
			default:
				Assert.fail("ERROR! No battle ability asset was found with such ID: " + id);
				return new MovieClip();
		}
	}
	
	public static function getBattleUnit(id:ID):MovieClip
	{
		switch (id)
		{
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
				Assert.fail("ERROR! No battle unit asset was found with such ID: " + id);
				return new MovieClip();
		}
	}
	
	public static function getBattleBG(zone:Int):MovieClip
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
	
	public static function getRoamingBG(zone:Int):MovieClip
	{
		switch(zone)
		{
			case 0:
				return new NullZoneBGR();
			default:
				trace("ERROR! Incorrect zone number: " + zone);
				neko.Lib.rethrow(0);
				return new MovieClip();
		}
	}
	
	public static function getSpellAnim(id:ID):MovieClip
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
	
	public static function getBolt(element:Element):MovieClip
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
	
	public static function getSpell(element:Element):MovieClip
	{
		switch (element)
		{
			default: 
				trace("Warning! Incorrect element: " + element.getName());
				return new MovieClip();
		}
	}
	
}