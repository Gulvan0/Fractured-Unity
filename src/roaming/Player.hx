package roaming;

import roaming.Unit;

/**
 * Represents a playable unit in roaming state
 * @author Gulvan
 */
class Player extends Unit 
{
	
	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):Tree;
	public var pool(default, null):Array<ID>;
	
	public override function levelUp()
	{
		level++;
		
		abilityPoints += XMLUtils.getGlobal("lvlup", "ability_pts", 1);
		attributePoints += XMLUtils.getGlobal("lvlup", "attribute_pts", 1);
		strength += XMLUtils.getGlobal("gains", "lgSt", 1);
		flow += XMLUtils.getGlobal("gains", "lgFl", 1);
		intellect += XMLUtils.getGlobal("gains", "lgIn", 1);
	}
	
	public function reSpec()
	{
		var basicSt:Int = XMLUtils.getGlobal("gains", "lgSt", 1) * level;
		var basicFl:Int = XMLUtils.getGlobal("gains", "lgFl", 1) * level;
		var basicIn:Int = XMLUtils.getGlobal("gains", "lgIn", 1) * level;
		
		abilityPoints += tree.reset();
		pool = [];
		wheel = [];
		
		attributePoints += strength + flow + intellect - basicSt - basicFl - basicIn;
		strength = basicSt;
		flow = basicFl;
		intellect = basicIn;
	}
	
	public function stIncrement()
	{
		strength++;
	}
	
	public function flIncrement()
	{
		flow++;
	}
	
	public function inIncrement()
	{
		intellect++;
	}
	
	public function new(element:Element, name:String, ?params:Null<RoamUnitParameters>) 
	{
		super(element, name, params);
		
	}
	
	public function setName(newName:String):Bool
	{
		if (!MathUtils.inRange(newName.length, 3, 18))
			return false;
		
		name = newName;
		return true;
	}
	
}