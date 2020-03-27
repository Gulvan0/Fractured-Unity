package;

import battle.struct.Pool;

class RoamUnitParameters 
{
	public var tree:Tree;
	public var wheel:Array<ID>;
	public var level:Int;
	public var xp:Int;
	public var abilityPoints:Int;
	public var attributePoints:Int;
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	
	public function new(){}
}

/**
 * Represents a playable unit in roaming state
 * @author Gulvan
 */
class Player
{
	public var id(default, null):ID;
	public var name(default, null):String;
	public var element(default, null):Null<Element>;
	
	public var wheel:Array<ID>;
	
	public var attribs(default, null):Map<Attribute, Int>;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;

	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):Tree;
	
	public function new(element:Element, login:String, ?name:String, params:RoamUnitParameters) 
	{
		this.id = ID.Player(login);
		this.name = name == null? login : name;
		this.element = element;
			
		this.level = params.level;
		this.xp = new Pool(params.xp, GameRules.xpToLvlup(level));
		
		this.attribs = new Map<Attribute, Int>();
		this.attribs[Attribute.Strength] = params.strength;
		this.attribs[Attribute.Flow] = params.flow;
		this.attribs[Attribute.Intellect] = params.intellect;
		
		this.tree = params.tree;
		this.wheel = params.wheel;
		
		this.abilityPoints = params.abilityPoints;
		this.attributePoints = params.attributePoints;
	}
	
}