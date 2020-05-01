package;

/**
 * @author Gulvan
 */
enum AbilityID 
{
	//Lg abilities
	LgLightningBolt;
	LgStrikeback;
	LgVoltSnare;
	LgShockTherapy;
	
	LgArcFlash;
	LgDisrupt;
	LgEnergize;
	LgElectricalStorm;
	
	LgEMPBlast;
	LgThunderbirdSoul;
	LgCharge;
	LgHighVoltage;

	LgEnergyBarrier;
	LgSparkle;
	LgBallLightning;
	LgAtomicOverload;

	LgWarp;
	LgDash;
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
	
	//Bot abilities
	BoGhostStrike;

	//Special
	EmptyAbility;
	LockAbility;
	StubAbility;
}
	
enum UnitID 
{
	Player(id:String);
	Ghost;
	Archghost;
}
	
enum BuffID 
{
	//Lg
	LgConductivity;
	LgCharged;
	LgClarity;
	LgStrikeback;

	LgEnergized;
	LgSnared;
	LgReenergizing;
}