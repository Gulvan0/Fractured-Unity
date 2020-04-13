package bh;

import ID.AbilityID;
import openfl.geom.Point;

class BehaviourData
{
    public var ability:AbilityID;
    public var pattern:Array<Point>;
    public var props:PropObj;

    public function new(ability:AbilityID, pattern:Array<Point>, props:PropObj) 
    {
        this.ability = ability;
        this.pattern = pattern;
        this.props = props;
    }
}