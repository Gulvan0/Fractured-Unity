package roaming;
import battle.Unit.ParameterList;
import battle.struct.Pool;
import battle.struct.Wheel;
import hxassert.Assert;

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
	
	public var wheel:Array<ID>;
	
	public var strength(default, null):Int;
	public var flow(default, null):Int;
	public var intellect(default, null):Int;
	
	public var level(default, null):Int;
	public var xp(default, null):Pool;
	
	public function gainXP(count:Int)
	{
		
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
		strength: strength,
		flow: flow,
		intellect: intellect,
		wheel: wheel,
		hp: strength * XMLUtils.getGlobal("hp", "perst", 1) + XMLUtils.getGlobal("hp", "base", 1),
		mana: intellect * XMLUtils.getGlobal("mana", "perin", 1) + XMLUtils.getGlobal("mana", "base", 1)
		};
	}
	
	public function new(element:Element, ?name:Null<String>, ?params:Null<RoamUnitParameters>) 
	{
		this.id = getID(element);
		this.name = (name == null)? name :getDefaultName(element);
		this.element = element;
			
		this.level = (params == null)? 0 : params.level;
		this.xp = (params == null)? new Pool(0, 100) : params.xp;
			
		this.strength = (params == null)? 0 : params.strength;
		this.flow = (params == null)? 0 : params.flow;
		this.intellect = (params == null)? 0 : params.intellect;
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
				Assert.fail("There's no ID for such an element");
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
				Assert.fail("There's no name for such an element");
		}
	}
	
}