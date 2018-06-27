package battle.struct;
import battle.Ability;
import battle.Active;
import battle.Passive;
import battle.data.Passives.BattleEvent;
import battle.enums.AbilityType;
import hxassert.Assert;

/**
 * Ability wheel
 * @author Gulvan
 */
class Wheel 
{

	private var wheel:Array<Ability>;
	
	public var numOfSlots:Int;
	
	public function get(pos:Int):Ability
	{
		Assert.assert(pos >= 0 && pos <= 9);
		return wheel[pos];
	}
	
	public function getActive(pos:Int):Active
	{
		Assert.assert(pos >= 0 && pos <= 9);
		Assert.assert(wheel[pos].type == AbilityType.Active); 
		return cast wheel[pos];
	}
	
	public function passives(?trigger:Null<BattleEvent>):Array<ID>
	{
		var res:Array<ID> = [];
		for (ab in wheel)
			if (ab.type == AbilityType.Passive)
			{
				var p:Passive = cast ab;
				if (trigger == null || p.reactsTo(trigger))
					res.push(p.id);
			}
		return res;
	}
	
	public function set(pos:Int, ability:Ability):Ability
	{
		Assert.assert(pos >= 0 && pos <= 9);
		return wheel[pos] = ability;
	}
	
	public function tick()
	{
		for (ability in wheel)
			if (!ability.checkEmpty() && ability.type == AbilityType.Active)
				cast(ability, Active).tick();
	}
	
	public function new(pool:Array<ID>, numOfSlots:Int) 
	{
		Assert.assert(pool.length <= numOfSlots && numOfSlots >= 8 && numOfSlots <= 10);
		
		this.wheel = new Array<Ability>();
		for (id in pool)
			if (XMLUtils.parseAbility(id, "type", AbilityType.Active) == AbilityType.Active)
				this.wheel.push(new Active(id));
			else
				this.wheel.push(new Passive(id));
		for (i in pool.length...numOfSlots)
			this.wheel[i] = new Ability(ID.EmptyAbility);
		for (i in numOfSlots...10)
			this.wheel[i] = new Ability(ID.LockAbility);
		this.numOfSlots = numOfSlots;
	}
	
}