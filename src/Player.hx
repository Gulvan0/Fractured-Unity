package;

import roaming.Tree;
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
	
	public function new(element:Element, login:String, ?name:String, params:RoamUnitParameters) 
	{
		super(ID.Player(login), element, name == null? login : name, params);
		
		this.tree = params.tree;
		this.wheel = params.wheel;
		
		this.abilityPoints = params.abilityPoints;
		this.attributePoints = params.attributePoints;
	}
	
}