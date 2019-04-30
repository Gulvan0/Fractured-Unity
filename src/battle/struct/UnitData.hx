package battle.struct;
import battle.enums.Team;
import battle.struct.FloatPool;
import battle.struct.Pool;

/**
 * @author gulvan
 */
class UnitData
{
	public var id:ID;
	public var name:String;
	public var element:Element;
	public var team:Team;
	public var pos:Int;
	public var hp:Pool;
	public var mana:Pool;
	public var alacrity:FloatPool;
	public var buffs:Array<Buff>;
	
	public function isPlayer():Bool
	{
		return switch (id)
		{
			case ID.Player(l): true;
			default: false;
		};
	}
	
	public function playerLogin():String
	{
		return switch (id)
		{
			case ID.Player(l): l;
			default: "";
		};
	}
	
	public function checkAffordable(manacost:Int):Bool
	{
		return mana.value >= manacost;
	}
	
	public function new()
	{
		
	}
}