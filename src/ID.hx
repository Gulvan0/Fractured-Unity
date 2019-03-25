package;

/**
 * @author Gulvan
 */
enum ID 
{
	//================================================================================
    // Abilities
    //================================================================================
	
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
	
	//Bot abilities
	
	BoGhostStrike;
	
	//================================================================================
    // Units
    //================================================================================
	
	Player(id:String);
	UnitGhost;
	UnitArchghost;
	
	//================================================================================
    // Buffs
    //================================================================================
	
	//Lg buffs
	
	BuffLgConductivity;
	BuffLgCharged;
	BuffLgClarity;
	BuffLgStrikeback;
	BuffLgEnergized;
	BuffLgSnared;
	BuffLgReenergizing;
	
	//================================================================================
    // Special
    //================================================================================
	
	EmptyAbility;
	LockAbility;
	StubAbility;
	UnitHero;
	
	NullID;
	
}