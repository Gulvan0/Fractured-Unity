package;
import hxassert.Assert;

/**
 * Ability wheel
 * @author Gulvan
 */
class BattleWheel 
{

	private var wheel:Array<BattleAbility>;
	
	public var numOfSlots:Int;
	
	public function get(pos:Int):BattleAbility
	{
		Assert.require(pos >= 0 && pos <= 9);
		return wheel[pos];
	}
	
	public function set(pos:Int, ability:BattleAbility):BattleAbility
	{
		Assert.require(pos >= 0 && pos <= 9);
		return wheel[pos] = ability;
	}
	
	public function new(pool:Array<String>, numOfSlots:Int) 
	{
		Assert.require(pool.length <= numOfSlots && numOfSlots >= 8 && numOfSlots <= 10);
		
		this.wheel = new Array<BattleAbility>();
		for (id in pool)
			this.wheel.push(new BattleAbility(id));
		for (i in pool.length...numOfSlots)
			this.wheel[i] = new BattleAbility("ability_empty");
		for (i in numOfSlots...10)
			this.wheel[i] = new BattleAbility("ability_locked");
		this.numOfSlots = numOfSlots;
	}
	
}