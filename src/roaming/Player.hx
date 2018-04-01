package roaming;

import roaming.Unit;
using MathUtils;

/**
 * Represents a playable unit in roaming state
 * @author Gulvan
 */
class Player extends Unit 
{
	
	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):Tree;
	
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
	
	public function new(element:Element, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		super(element, name, params);
		
		this.tree = (params == null)? new Tree(element) : params.tree;
		this.wheel = (params == null)? [] : params.wheel;
		
		this.abilityPoints = (params == null)? 0 : params.abilityPoints;
		this.attributePoints = (params == null)? 0 : params.attributePoints;
	}
	
	public function setName(newName:String):Bool
	{
		if (!newName.length.inRange(3, 18))
			return false;
		
		name = newName;
		return true;
	}
	
}