package;
import utils.DamageSource;
import utils.Element;

/**
 * [ROOT] model OF APP IN battle
 * @author Gulvan
 */
class BattleModel 
{

	private var allies:Array<BattleUnit>;
	private var enemies:Array<BattleUnit>;
	
	public function changeUnitHP(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource):Int
	{
		target.hpPool.value += delta;
		return delta;
	}
	
	public function changeUnitMana(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource):Int
	{
		target.manaPool.value += delta;
		return delta;
	}
	
	public function getLeftTeam():Array<BattleUnit>
	{
		return allies;
	}
	
	public function getRightTeam():Array<BattleUnit>
	{
		return enemies;
	}
	
	public function new(allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
	{
		this.allies = allies;
		this.enemies = enemies;
	}
	
}