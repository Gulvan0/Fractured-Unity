package;
import utils.DamageSource;
import utils.Element;
import utils.Team;

/**
 * [ROOT] model OF APP IN battle
 * @author Gulvan
 */
class BattleModel 
{

	private var allies:Array<BattleUnit>;
	private var enemies:Array<BattleUnit>;
	
	private var chosenAbility:Null<BattleAbility>;
	
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
	
	public function chooseAbility(num:Int):Bool
	{
		var ability:BattleAbility = allies[0].wheel.get(num);
		
		if (ability.id == "ability_empty" || ability.id == "ability_locked")
			return false;
		if (ability.cooldown > 0)
			return false;
		if (ability.manacost > allies[0].manaPool.value)
			return false;
		
		chosenAbility = ability;
	}
	
	public function target(team:Team, pos:Int):Bool
	{
		
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility):Bool
	{
		ability.use(target, caster);
	}
	
	public function chooseAbility(num:Int)
	{
		
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