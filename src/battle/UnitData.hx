package battle;
import battle.enums.Team;
import battle.struct.FloatPool;
import battle.struct.Pool;

/**
 * @author gulvan
 */
typedef UnitData =
{
	id:ID,
	name:String,
	element:Element,
	team:Team,
	pos:Int,
	hp:Pool,
	mana:Pool,
	alacrity:FloatPool,
	buffs:Array<Buff>	
}