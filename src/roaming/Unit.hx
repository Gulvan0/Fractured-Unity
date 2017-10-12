package roaming;
import battle.data.Units.UnitParameters;
import battle.struct.Pool;
import battle.struct.Wheel;
import roaming.data.Units;
import roaming.data.Units.AttributeGains;

/**
 * model OF unit IN roaming
 * @author Gulvan
 */
typedef RoamUnitParameters = {
	var tree:Tree;
	var pool:Array<String>;
	var wheel:Array<String>;
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
	public var id(default, null):String;
	public var name(default, null):String;
	public var element(default, null):Element;
	
	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):Tree;
	public var pool(default, null):Array<String>;
	public var wheel:Array<String>;
	
	public var strength(default, null):Int;
	public var flow(default, null):Int;
	public var intellect(default, null):Int;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;
	
	public function levelUp(rest:Int)
	{
		var gains:AttributeGains = Units.getAttrGain(element);
		
		level++;
		xp = new Pool(rest, 100); //change maxvalue to log value
		
		abilityPoints += 2;
		attributePoints += 4;
		strength += gains.strength;
		flow += gains.flow;
		intellect += gains.intellect;
	}
	
	public function reSpec()
	{
		var gains:AttributeGains = Units.getAttrGain(element);
		
		abilityPoints += tree.reset();
		pool = [];
		wheel = [];
		
		attributePoints += strength - gains.strength * level + flow - gains.flow * level + intellect - gains.intellect * level;
		strength += gains.strength * level;
		flow += gains.flow * level;
		intellect += gains.intellect * level;
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
	
	public function compactToParams():UnitParameters
	{
		var parameters:UnitParameters;
		parameters.name = name;
		parameters.strength = strength;
		parameters.flow = flow;
		parameters.intellect = intellect;
		parameters.wheel = wheel;
		parameters.hp = strength * 10 + 100;
		parameters.mana = intellect * 10 + 100;
		return parameters;
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
	
	private function getIDByElement(element:Element):String
	{
		switch (element)
		{
			case Element.Fire:
				return "unit_icarus";
			case Element.Frost:
				return "unit_frostborne";
			case Element.Poison:
				return "unit_aqilla";
			case Element.Terra:
				return "unit_hugo";
			case Element.Shadow:
				return "unit_khoru";
			case Element.Lightning:
				return "unit_zealon";
			case Element.Physical:
				return "unit_warrior";
			case Element.Natura:
				return "unit_woven";
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