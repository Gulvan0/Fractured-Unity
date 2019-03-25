package battle;
import battle.enums.AbilityTarget;
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
	
	public var target:Null<AbilityTarget>;
	public var manacost:Null<Int>;
	public var cooldown:Null<Int>;
	public var delay:Null<Int>;
	
	public function checkEmpty():Bool
	{
		return id == ID.EmptyAbility || id == ID.LockAbility;
	}
	
	public function new()
	{
		
	}
	
}