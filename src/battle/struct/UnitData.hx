package battle.struct;
import ID.UnitID;
import battle.enums.Team;
import battle.struct.FloatPool;
import battle.struct.Pool;

/**
 * @author gulvan
 */
class UnitData
{
	public var id:UnitID;
	public var name:String;
	public var element:struct.Element;
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
			case UnitID.Player(l): true;
			default: false;
		};
	}
	
	public function playerLogin():String
	{
		return switch (id)
		{
			case UnitID.Player(l): l;
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