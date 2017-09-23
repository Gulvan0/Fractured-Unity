package battle.struct;
import battle.Ability;
import hxassert.Assert;

/**
 * Ability wheel
 * @author Gulvan
 */
class Wheel 
{

	private var wheel:Array<battle.Ability>;
	
	public var numOfSlots:Int;
	
	public function get(pos:Int):battle.Ability
	{
		Assert.assert(pos >= 0 && pos <= 9);
		return wheel[pos];
	}
	
	public function set(pos:Int, ability:battle.Ability):battle.Ability
	{
		Assert.assert(pos >= 0 && pos <= 9);
		return wheel[pos] = ability;
	}
	
	public function tick()
	{
		for (ability in wheel)
			if (!ability.checkEmpty())
				ability.tick();
	}
	
	public function new(pool:Array<String>, numOfSlots:Int) 
	{
		Assert.assert(pool.length <= numOfSlots && numOfSlots >= 8 && numOfSlots <= 10);
		
		this.wheel = new Array<battle.Ability>();
		for (id in pool)
			this.wheel.push(new battle.Ability(id));
		for (i in pool.length...numOfSlots)
			this.wheel[i] = new battle.Ability("ability_empty");
		for (i in numOfSlots...10)
			this.wheel[i] = new battle.Ability("ability_locked");
		this.numOfSlots = numOfSlots;
	}
	
}