package roaming;

import battle.struct.Pool;
import haxe.ds.IntMap;
import hxassert.Assert;
import roaming.Unit;
import roaming.enums.Attribute;
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
	
	public override function levelUp(xpRest:Int)
	{
		level++;
		xp = new Pool(xpRest, xpToLvlup(level));
		abilityPoints += XMLUtils.getGlobal("lvlup", "ability_pts", 1);
		attributePoints += XMLUtils.getGlobal("lvlup", "attribute_pts", 1);
		attribs[Attribute.Strength] += XMLUtils.getGlobal("gains", "lgSt", 1);
		attribs[Attribute.Flow] += XMLUtils.getGlobal("gains", "lgFl", 1);
		attribs[Attribute.Intellect] += XMLUtils.getGlobal("gains", "lgIn", 1);
	}
	
	public function reSpec()
	{
		var basicSt:Int = XMLUtils.getGlobal("gains", "lgSt", 1) * level;
		var basicFl:Int = XMLUtils.getGlobal("gains", "lgFl", 1) * level;
		var basicIn:Int = XMLUtils.getGlobal("gains", "lgIn", 1) * level;
		
		abilityPoints += tree.reset();
		wheel = [];
		
		attributePoints += attribs[Attribute.Strength] + attribs[Attribute.Flow] + attribs[Attribute.Intellect] - basicSt - basicFl - basicIn;
		attribs[Attribute.Strength] = basicSt;
		attribs[Attribute.Flow] = basicFl;
		attribs[Attribute.Intellect] = basicIn;
	}
	
	public function increment(a:Attribute):Bool
	{
		if (attributePoints == 0)
			return false;
			
		attribs[a]++;
		attributePoints--;
		return true;
	}
	
	public function spendAbPoint()
	{
		if (abilityPoints > 0)
			abilityPoints--;
	}
	
	public function new(element:Element, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		super(ID.Player, element, name, params);
		
		this.tree = (params == null)? new Tree(element) : params.tree;
		this.wheel = (params == null)? [] : params.wheel;
		
		this.abilityPoints = (params == null)? 1 : params.abilityPoints;
		this.attributePoints = (params == null)? 4 : params.attributePoints;
	}
	
	public function setName(newName:String):Bool
	{
		if (!newName.length.inRange(3, 18))
			return false;
		
		name = newName;
		return true;
	}
	
}