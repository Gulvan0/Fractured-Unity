package roaming;
import battle.Unit.ParameterList;
import battle.struct.Pool;
import battle.struct.Wheel;

/**
 * model OF unit IN roaming
 * @author Gulvan
 */
typedef RoamUnitParameters = {
	var tree:Tree;
	var pool:Array<ID>;
	var wheel:Array<ID>;
	var level:Int;
	var xp:Pool;
	var abilityPoints:Int;
	var attributePoints:Int;
	var strength:Int;
	var flow:Int;
	var intellect:Int;
}
 
class Unit 
{
	public var id(default, null):ID;
	public var name(default, null):String;
	public var element(default, null):Element;
	
	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):Tree;
	public var pool(default, null):Array<ID>;
	public var wheel:Array<ID>;
	
	public var strength(default, null):Int;
	public var flow(default, null):Int;
	public var intellect(default, null):Int;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;
	
	public function levelUp(rest:Int)
	{
		
		level++;
		xp = new Pool(rest, 100); //change maxvalue to log value
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
	
	public function toParams():ParameterList
	{
		return {
		name: name,
		strength: strength,
		flow: flow,
		intellect: intellect,
		wheel: wheel,
		hp: strength * XMLUtils.getGlobal("hp", "perst", 1) + XMLUtils.getGlobal("hp", "base", 1),
		mana: intellect * XMLUtils.getGlobal("mana", "perin", 1) + XMLUtils.getGlobal("mana", "base", 1)
		};
	}
	
	public function new(element:Element, name:String, ?params:Null<RoamUnitParameters>) 
	{
		this.id = getIDByElement(element);
		this.name = name;
		this.element = element;
		
		
		if (params == null)
		{
			this.tree = new Tree(element);
			this.pool = [];
			this.wheel = [];
			
			this.level = 0;
			this.xp = new Pool(0, 100);
			this.abilityPoints = 0;
			this.attributePoints = 0;
			this.strength = 0;
			this.flow = 0;
			this.intellect = 0;
		}
		else
		{
			this.tree = params.tree;
			this.pool = params.pool;
			this.wheel = params.wheel;
			
			this.level = params.level;
			this.xp = params.xp;
			this.abilityPoints = params.abilityPoints;
			this.attributePoints = params.attributePoints;
			this.strength = params.strength;
			this.flow = params.flow;
			this.intellect = params.intellect;
		}
	}
	
	private function getIDByElement(element:Element):ID
	{
		switch (element)
		{
			case Element.Fire:
				return ID.PlayerIcarus;
			case Element.Terra:
				return ID.PlayerHugo;
			case Element.Lightning:
				return ID.PlayerZealon;
			default:
				throw "Player ID retrieval exception: there's no ID for such an element";
		}
	}
	
	public function setName(newName:String):Bool
	{
		if (!MathUtils.inRange(newName.length, 3, 18))
			return false;
		
		name = newName;
		return true;
	}
	
}