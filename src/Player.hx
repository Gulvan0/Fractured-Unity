package;

import battle.struct.Pool;
import haxe.ds.IntMap;
import hxassert.Assert;
import roaming.Tree;
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
	
	public function new(element:Element, login:String, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		super(ID.Player(login), element, name == null? login : name, params);
		
		this.tree = (params == null)? new Tree(element) : params.tree;
		this.wheel = (params == null)? [] : params.wheel;
		
		this.abilityPoints = (params == null)? 1 : params.abilityPoints;
		this.attributePoints = (params == null)? 4 : params.attributePoints;
	}
	
}