package;
import graphic.Shapes;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
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
	public static var INNER_ABILITY_RADIUS = 56 / 2;
	public static var ABILITY_BORDER_THICKNESS = 1.25;
	public static var FULL_ABILITY_RADIUS = INNER_ABILITY_RADIUS + ABILITY_BORDER_THICKNESS;

	private static var bitmapDatas:Map<String, BitmapData> = [];
	
	public static function init()
	{
		bitmapDatas.set("mainBG", openfl.Assets.getBitmapData("bitmap/mainscreen.png"));
		bitmapDatas.set("charScreenBG", openfl.Assets.getBitmapData("bitmap/charscreen.png"));
	}

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
		var border:MovieClip = new AbilityIconBorder();
		icon.add(mc, ABILITY_BORDER_THICKNESS, ABILITY_BORDER_THICKNESS);
		icon.add(border, ABILITY_BORDER_THICKNESS, ABILITY_BORDER_THICKNESS);

		if (hinted)
			icon.setHint(new AbilityHint(id, hintType, hintLevel));
		return icon;
	}

	public static function getRoundAbility(id:ID.AbilityID, ?hinted:Bool = false, ?hintType:AbilityHintType, ?hintLevel:Int):Sprite
	{
		Assert.require(hinted == (hintLevel != null && hintType != null));

		if (id == EmptyAbility)
		{
			var slot = new EmptyAbilitySlot();
			slot.setHint(new AbilityHint(id, hintType, hintLevel));
			return slot;
		}

		var container:Sprite = new Sprite();
		var iconMask:Sprite = new EmptyAbilitySlot();
		var icon = getBattleAbility(id);
		
		icon.x = -FULL_ABILITY_RADIUS;
		icon.y = -FULL_ABILITY_RADIUS;
		container.cacheAsBitmap = true;
		container.addChild(icon);
		container.addChild(iconMask);
		icon.mask = iconMask;

		if (hinted)
			icon.setHint(new AbilityHint(id, hintType, hintLevel));

		return container;
	}

	public static function getRhombusAbility(id:ID.AbilityID):Sprite
	{
		var container:Sprite = new Sprite();
		var iconMask:Sprite = Shapes.rotatedSquare(INNER_ABILITY_RADIUS, 0x000000);
		var icon = getBattleAbility(id);
		
		icon.x = -FULL_ABILITY_RADIUS;
		icon.y = -FULL_ABILITY_RADIUS;
		container.cacheAsBitmap = true;
		container.addChild(icon);
		container.addChild(iconMask);
		icon.mask = iconMask;

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
	
	public static function getBuffIcon(id:BuffID):Sprite
	{
		var round:Sprite = getRoundAbility(switch id 
		{
			case LgCharged: LgCharge;
			case LgReEnergizing: LgEnergize;
			case LgEnergyBarrier: LgEnergyBarrier;
			case LgClarity: LgDisrupt;
			case LgSnared: LgVoltSnare;
			case LgStrikeback: LgStrikeback;
			case LgReboot: LgReboot;
			case LgMagnetized: LgMagneticField;
			case LgManaShiftPos: LgManaShift;
			case LgManaShiftNeg: LgManaShift;
			case LgLightningShield: LgLightningShield;
			case LgBlessed: LgGuardianOfLight;
			case LgDCForm: LgDCForm;
			case LgACForm: LgACForm;
		});
		round.scaleX = round.scaleY = 0.5;
		return round;
	}
	
	public static function getBattleBG(zone:Zone):MovieClip
	{
		switch (zone)
		{
			default:
				return new NullZoneBG();
		}
	}
	
	public static function getMapBG(zone:Zone):MovieClip
	{
		switch (zone)
		{
			default:
				Assert.fail('Zone $zone has no map background');
				return new MovieClip();
		}
	}

	public static function mainScreenBG()
	{
		return new Bitmap(bitmapDatas.get("mainBG"));
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