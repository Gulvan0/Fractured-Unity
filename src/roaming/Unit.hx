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
typedef RoamUnitParameters = {
	var tree:Tree;
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
	
	public var wheel:Array<ID>;
	
	public var attribs(default, null):Map<Attribute, Int>;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;
	
	public function gainXP(count:Int)
	{
		if (xp.maxValue - xp.value > count)
			xp.value += count;
		else
		{
			xp.value = xp.value + count - xp.maxValue;
			levelUp();
		}
	}
	
	public function levelUp()
	{
		level++;
		trace("WARNING: levelUp() is called without being overriden");
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
	
	public function new(element:Element, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		this.id = getID(element);
		this.name = (name == null)? name :getDefaultName(element);
		this.element = element;
			
		this.level = (params == null)? 0 : params.level;
		this.xp = (params == null)? new Pool(0, 100) : params.xp;
		
		this.attribs = new Map<Attribute, Int>();
		this.attribs[Attribute.Strength] = (params == null)? 0 : params.strength;
		this.attribs[Attribute.Flow] = (params == null)? 0 : params.flow;
		this.attribs[Attribute.Intellect] = (params == null)? 0 : params.intellect;
		
		this.wheel = (params == null)? [] : params.wheel;
	}
	
	private function getID(element:Element):ID
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
				throw "There's no ID for such an element";
		}
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