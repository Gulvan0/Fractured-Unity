package battle.enums;

/**
 * @author Gulvan
 */
 enum AbilityType 
 {
	 Kick;
	 Bolt;
	 Spell;
	 Passive;
	 Aura(affectsSummons:Bool, affectsAllies:Bool);
	 BHSkill;
	 Morph;
	 Summon;
 }