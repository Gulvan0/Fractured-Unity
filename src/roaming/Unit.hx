package roaming;
import battle.dataobj.ParamsUnit;
import battle.struct.Pool;

/**
 * model OF unit IN roaming
 * @author Gulvan
 */
class Unit 
{
	public var id(default, null):String;
	public var name:String;
	
	public var abilityPoints(default, null):Int;
	public var attributePoints(default, null):Int;
	
	public var tree(default, null):roaming.Tree;
	
	public var vitality:Int;
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	
	public var level:Int;
	public var xp:Pool;
	
	public function levelUp()
	{
		
	}
	
	public function reSpec()
	{
		
	}
	
	public function compactToParams():ParamsUnit
	{
		var parameters:ParamsUnit = new ParamsUnit();
		parameters.name
	}
	
	public function new() 
	{
		
	}
	
}