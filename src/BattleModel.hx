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
		var a:Array<BattleUnit> = new Array<BattleUnit>();
		for (u in allies)
			a.push(u);
		return a;
	}
	
	public function getRightTeam():Array<BattleUnit>
	{
		var a:Array<BattleUnit> = new Array<BattleUnit>();
		for (u in enemies)
			a.push(u);
		return a;
	}
	
	public function new(allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
	{
		this.allies = allies;
		this.enemies = enemies;
	}
	
}