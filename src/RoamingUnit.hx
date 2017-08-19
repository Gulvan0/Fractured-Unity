package;
import dataobj.ParamsUnit;
import utils.Pool;

/**
 * model OF unit IN roaming
 * @author Gulvan
 */
class RoamingUnit 
{
	public var id:String;
	
	public var abilityPoints:Int;
	public var attributePoints:Int;
	
	public var tree;
	
	public var vitality:Int;
	public var strength:Int;
	public var flow:Int;
	public var intellect:Int;
	
	public var level:Int;
	public var xp:Pool;
	
	public function levelUp()
	{
		
	}
	
	public function compactToParams():ParamsUnit
	{
		
	}
	
	public function new() 
	{
		
	}
	
}