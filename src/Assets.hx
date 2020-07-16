package;
import engine.Color;
import struct.Zone;
import hxassert.Assert;
import openfl.display.MovieClip;
import struct.Element;
import openfl.display.Sprite;
import ID.AbilityID;
import ID.BuffID;
import ID.UnitID;
import graphic.components.hints.AbilityHint;
using graphic.SpriteExtension;

/**
 * @author Gulvan
 */
class Assets 
{
	
	public static function getBattleAbility(id:AbilityID, ?hinted:Bool = false, ?hintType:AbilityHintType, ?hintLevel:Int):Sprite
	{
		Assert.require(hinted == (hintLevel != null && hintType != null));
		var mc:Null<MovieClip> = switch (id)
		{
			case AbilityID.EmptyAbility: new NoAbility();
			case AbilityID.LockAbility: new LockedAbility();
			
			case AbilityID.LgShockTherapy: new ShockTherapy();
			case AbilityID.LgHighVoltage: new HighVoltage();
			case AbilityID.LgElectricalStorm: new ElectricalStorm();
			case AbilityID.LgCharge: new Charge();
			case AbilityID.LgArcFlash: new ArcFlash();
			case AbilityID.LgDisrupt: new Disrupt();
			case AbilityID.LgEMPBlast: new EMPBlast();
			case AbilityID.LgEnergize: new Energize();
			case AbilityID.LgLightningBolt: new LightningBolt();
			case AbilityID.LgStrikeback: new Strikeback();
			case AbilityID.LgThunderbirdSoul: new ThunderbirdSoul();
			case AbilityID.LgVoltSnare: new VoltSnare();
			case LgEnergyBarrier: new EnergyBarrier();
			case LgSparkle: new Sparkle();
			case LgBallLightning: new BallLightning();
			case LgAtomicOverload: new AtomicOverload();
			case LgWarp: new Warp();
			case LgDash: new Dash();
			case LgReboot: new Reboot();
			case LgSwiftnessAura: new SwiftnessAura();
			case LgMagneticField: new MagneticField();
			case LgManaShift: new ManaShift();
			case LgLightningShield: new LightningShield();
			case LgRapidStrikes: new RapidStrikes();
			case LgGuardianOfLight: new GuardianOfLight();
			case LgRejuvenate: new Rejuvenate();
			case LgDCForm: new DCForm();
			case LgACForm: new ACForm();
			default: null;
		}

		if (mc == null)
		{
			trace("WARNING! No battle ability asset was found with such ID: " + id);
			return new NoAbility();
		}
		
		var icon:Sprite = new Sprite();
		icon.add(new AbilityIconBorder(), 1.25, 1.25);
		icon.add(mc, 1.25, 1.25);

		if (hinted)
			icon.setHint(new AbilityHint(id, hintType, hintLevel));
		return icon;
	}

	public static function getRoundAbility(id:ID.AbilityID):Sprite
	{
		if (id == AbilityID.EmptyAbility)
			return new EmptyAbilitySlot();

		var container:Sprite = new Sprite();
		var newMask:Sprite = new EmptyAbilitySlot();
		var icon = getBattleAbility(id);
		var abwidth:Float = 56;
		
		icon.x = -abwidth / 2;
		icon.y = -abwidth / 2;
		container.cacheAsBitmap = true;
		container.addChild(icon);
		container.addChild(newMask);
		icon.mask = newMask;

		return container;
	}
	
	public static function getUnit(id:UnitID):MovieClip
	{
		switch (id)
		{
			case UnitID.Ghost:
				return new Ghost();
			case UnitID.Archghost:
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
	
	public static function getBuffMark(id:BuffID):Sprite
	{
		switch (id)
		{
			case BuffID.LgStrikeback:
				return new Buff2();
			case BuffID.LgConductivity:
				return new Buff11();
			case BuffID.LgClarity:
				return new Buff1();
			case BuffID.LgCharged:
				return new Buff6();
			case BuffID.LgEnergized:
				return new Buff9();
			case BuffID.LgReenergizing:
				return new Buff5();
			case BuffID.LgSnared:
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

	public static function getSoul(?element:Element):Sprite
	{
		var s = new DefaultSoul();
		if (element != null)
			s.filters = [Color.getTransformationTo(Color.elemental(element))];
		return s;
	}

	public static function getParticle(id:AbilityID):MovieClip
	{
		switch id
		{
			case LgAtomicOverload: return new PAtomicOverload();
			case LgElectricalStorm: return new PElectricalStorm();
			case LgSparkle: return new PSparkle();
			case LgHighVoltage: return new PHighVoltage();
			case LgBallLightning: return new PBallLightning();
			default: throw "Particle not found: " + id;
		}
	}

	public static function getDispenser(id:AbilityID):MovieClip
	{
		switch id
		{
			case LgElectricalStorm: return new EElectricalStorm();
			default: throw "Dispenser not found: " + id;
		}
	}
	
}