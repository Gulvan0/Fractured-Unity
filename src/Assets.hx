package;
import roaming.screens.SAbility;
import haxe.io.Error;
import haxe.macro.Expr.Case;
import hxassert.Assert;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import Element;
import openfl.display.Sprite;

/**
 * [STATIC_SERVICE] Returns graphics by id (all ids)
 * @author Gulvan
 */
class Assets 
{
	
	public static function getBattleAbility(id:ID):MovieClip
	{
		var mc:Null<MovieClip> = switch (id)
		{
			case ID.EmptyAbility: new NoAbility();
			case ID.LockAbility: new LockedAbility();
			
			case ID.LgShockTherapy: new ShockTherapy();
			case ID.LgHighVoltage: new HighVoltage();
			case ID.LgElectricalStorm: new ElectricalStorm();
			case ID.LgCharge: new Charge();
			case ID.LgArcFlash: new ArcFlash();
			case ID.LgDisrupt: new Disrupt();
			case ID.LgEMPBlast: new EMPBlast();
			case ID.LgEnergize: new Energize();
			case ID.LgLightningBolt: new LightningBolt();
			case ID.LgStrikeback: new Strikeback();
			case ID.LgThunderbirdSoul: new ThunderbirdSoul();
			case ID.LgVoltSnare: new VoltSnare();
			
			default: null;
		}
		if (mc == null)
		{
			Assert.fail("ERROR! No battle ability asset was found with such ID: " + id);
			return new MovieClip();
		}
		else
			return mc;
	}

	public static function getRoundAbility(id:ID):Sprite
	{
		if (id == ID.EmptyAbility)
			return new EmptyAbilitySlot();

		var container:Sprite = new Sprite();
		var newMask:Sprite = new EmptyAbilitySlot();
		var icon = getBattleAbility(id);
		var abwidth:Float = 56;
		
		icon.x = -abwidth / 2;
		icon.y = -abwidth / 2;
		
		container.addChild(icon);
		container.addChild(newMask);
		icon.mask = newMask;

		return container;
	}
	
	public static function getUnit(id:ID):MovieClip
	{
		switch (id)
		{
			case ID.UnitHero:
				return new Hero();
			case ID.UnitGhost:
				return new Ghost();
			case ID.UnitArchghost:
				return new Archghost();
			default:
				throw "ERROR! No battle unit asset was found with such ID: " + id;
		}
	}
	
	public static function getPlayer(element:Element):MovieClip
	{
		switch (element)
		{
			case Element.Lightning:
				return new Zealon();
			case Element.Fire:
				return new Icarus();
			case Element.Terra:
				return new Hugo();
			default:
				throw "ERROR! No player asset was found for element: " + element;
		}
	}
	
	public static function getBuffBox(element:Element):Sprite
	{
		switch (element)
		{
			case Element.Lightning:
				return new LgBuff();
			case Element.Physical:
				return new PhBuff();
			default:
				return new PhBuff();
		}
	}
	
	public static function getBuffMark(id:ID):Sprite
	{
		switch (id)
		{
			case ID.BuffLgStrikeback:
				return new Buff2();
			case ID.BuffLgConductivity:
				return new Buff11();
			case ID.BuffLgClarity:
				return new Buff1();
			case ID.BuffLgCharged:
				return new Buff6();
			case ID.BuffLgEnergized:
				return new Buff9();
			case ID.BuffLgReenergizing:
				return new Buff5();
			case ID.BuffLgSnared:
				return new Buff8();
			default:
				return new Buff4();
		}
	}
	
	public static function getBattleBG(zone:Zone):MovieClip
	{
		switch(zone)
		{
			case Zone.NullSpace:
				return new NullZoneBG();
			default:
				throw "ERROR! Incorrect zone id: " + zone;
		}
	}
	
	public static function getRoamingBG(zone:Zone):MovieClip
	{
		switch(zone)
		{
			case Zone.NullSpace:
				return new NullZoneBGR();
			default:
				throw "ERROR! Incorrect zone id: " + zone;
		}
	}
	
	public static function getSpellAnim(element:Element):MovieClip
	{
		switch(element)
		{
			case Element.Lightning:
				return new SpellLg();
			default:
				trace("Warning! Incorrect ability id: " + element);
				return new MovieClip();
		}
	}
	
	public static function getBolt(element:Element):MovieClip
	{
		switch (element)
		{
			case Element.Lightning: 
				return new BoltLg();
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