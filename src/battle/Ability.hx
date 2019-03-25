package battle;
import battle.enums.AbilityType;

/**
 * ...
 * @author gulvan
 */
class Ability 
{

	public var id:ID;
	public var name:String;
	public var description:String;
	public var type:AbilityType;
	public var element:Element;
	
	public function checkEmpty():Bool
	{
		return id == ID.EmptyAbility || id == ID.LockAbility;
	}
	
	public function new()
	{
		
	}
	
}