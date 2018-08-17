package roaming;
import battle.Unit.ParameterList;
import battle.struct.Pool;
import battle.struct.Wheel;
import hxassert.Assert;
import roaming.enums.Attribute;

/**
 * model OF unit IN roaming
 * @author Gulvan
 */
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
 
class Unit 
{
	public var id(default, null):ID;
	public var name(default, null):String;
	public var element(default, null):Null<Element>;
	
	public var wheel:Array<ID>;
	
	public var attribs(default, null):Map<Attribute, Int>;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;
	
	public function gainXP(count:Int)
	{
		if (xp.maxValue - xp.value > count)
			xp.value += count;
		else
			levelUp(xp.value + count - xp.maxValue);
	}
	
	public function levelUp(xpRest:Int)
	{
		level++;
		trace("WARNING: levelUp() is called without being overriden");
	}
	
	private function xpToLvlup(currentLevel:Int):Int
	{
		Assert.assert(currentLevel > 0);
		var base1:Int = 30;
		var base2:Int = 100;
		if (currentLevel == 1)
			return 20;
		if (currentLevel <= 8)
			return base1 + 5 * (currentLevel - 2);
		else
			return base2 + 10 * (currentLevel - 9);
	}
	
	public function toParams():ParameterList
	{
		return {
		name: name,
		strength: attribs[Attribute.Strength],
		flow: attribs[Attribute.Flow],
		intellect: attribs[Attribute.Intellect],
		wheel: wheel,
		hp: attribs[Attribute.Strength] * XMLUtils.getGlobal("hp", "perst", 1) + XMLUtils.getGlobal("hp", "base", 1),
		mana: attribs[Attribute.Intellect] * XMLUtils.getGlobal("mana", "perin", 1) + XMLUtils.getGlobal("mana", "base", 1)
		};
	}
	
	public function new(id:ID, ?element:Null<Element>, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		this.id = id;
		this.name = (name == null)? name :getDefaultName(element);
		this.element = element;
			
		this.level = (params == null)? 1 : params.level;
		this.xp = new Pool((params == null)? 0 : params.xp, xpToLvlup(level));
		
		this.attribs = new Map<Attribute, Int>();
		this.attribs[Attribute.Strength] = (params == null)? 0 : params.strength;
		this.attribs[Attribute.Flow] = (params == null)? 0 : params.flow;
		this.attribs[Attribute.Intellect] = (params == null)? 0 : params.intellect;
		
		this.wheel = (params == null)? [] : params.wheel;
	}
	
	private function getDefaultName(element:Element):String
	{
		switch (element)
		{
			case Element.Fire:
				return "Icarus";
			case Element.Terra:
				return "Hugo";
			case Element.Lightning:
				return "Zealon";
			default:
				throw "There's no name for such an element";
		}
	}
	
}