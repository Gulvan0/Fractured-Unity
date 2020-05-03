package bh;

import bh.enums.DispenserType;
import ID.AbilityID;
import openfl.geom.Point;

class BehaviourData
{
    public var ability:AbilityID;
    public var abilityProperties:PropObj;
    public var pattern:Pattern;

    public function new(ability:AbilityID, ?pattern:Pattern) 
    {
        this.ability = ability;
        this.abilityProperties = PropObj.createForAbility(ability);
        if (abilityProperties.dispenser != DispenserType.Geyser)
            this.pattern = pattern != null? pattern : Pattern.firstTimeCreate(ability);
    }
}