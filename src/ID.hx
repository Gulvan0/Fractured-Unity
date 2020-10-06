package;

/**
 * @author Gulvan
 */
enum AbilityID 
{
	//Lg abilities
	LgLightningBolt;
	LgCharge;
	LgEnergize;
	LgElectricalStorm;
	
	LgEnergyBarrier;
	LgDisrupt;
	LgVoltSnare;
	LgHighVoltage;
	
	LgArcFlash;
	LgThunderbirdSoul;
	LgSparkle;
	LgAtomicOverload;

	LgStrikeback;
	LgWarp;
	LgShockTherapy;
	LgBallLightning;

	LgDash;
	LgEMPBlast;
	LgReboot;
	LgSwiftnessAura;

	LgMagneticField;
	LgManaShift;
	LgLightningShield;
	LgRapidStrikes;

	LgGuardianOfLight;
	LgRejuvenate;
	LgDCForm;
	LgACForm;

	//Sh abilities
	ShReluctantOrb;
	ShSalvationOrb;
	
	//Bot abilities
	//...

	//Summon abilities
	SmnReluctantAura;
	SmnSalvationAura;

	//Special
	EmptyAbility;
	LockAbility;
	StubAbility;
}
	
enum UnitID 
{
	Player(id:String);
}
	
enum BuffID 
{
	//Lg
	LgCharged;
	LgReEnergizing;
	LgEnergyBarrier;
	LgClarity;

	LgSnared;
	LgStrikeback;
	LgReboot;
	LgMagnetized;

	LgManaShiftPos;
	LgManaShiftNeg;
	LgLightningShield;
	LgBlessed;

	LgDCForm;
	LgACForm;
	LgDash;
}

enum SummonID
{
	ReluctantOrb;
	SalvationOrb;
}