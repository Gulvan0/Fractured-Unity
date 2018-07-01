package battle.struct;
import battle.Buff;
import battle.data.Passives.BattleEvent;
import hxassert.Assert;
import Element;
import MathUtils;

/**
 * Represents a unit's queue of buffs
 * @author Gulvan
 */
class BuffQueue
{

	public var queue(default, null):Array<Buff>;
	private var newBuffs:Int;
	
	public function addBuff(buff:Buff)
	{
		var index:Int = indexOfBuff(buff.id);
		
		if (index == -1 || buff.isStackable)
		{
			queue.push(buff);
			trace ("Buff casted: " + buff.name);
			buff.onCast();
			trace ("Buff activated");
			newBuffs++;
		}
		else
		{
			queue[index] = buff;
			trace("Buff updated: " + buff.name);
		}
	}
	
	public function tick()
	{
		var i:Int = queue.length - 1;
		while (i >= 0)
		{
			trace("Ticking: " + queue[i].name + ", duration: " + queue[i].duration + "(-1 now)");
			if (queue[i].tickAndCheckEnded())
			{
				dispellBuff(i);
				trace ("Dispelled");
			}
			i--;
		}
		newBuffs = 0;
	}
	
	public function getTriggering(e:BattleEvent):Array<Buff>
	{
		return [for (b in queue.slice(0, queue.length - newBuffs)) if (b.reactsTo(e)) b];
	}
	
	public function dispellByID(id:ID)
	{
		dispellBuff(indexOfBuff(id));
	}
	
	public function dispellByElement(?elements:Array<Element>, ?count:Int = -1)
	{
		Assert.assert(count > 0 || count == -1);
		
		var candidates:Array<Buff> = new Array<Buff>();
		
		if (elements == null)
			candidates = queue;
		else
			for (buff in queue)
				for (element in elements)
					if (buff.element == element)
					{
						candidates.push(buff);
						break;
					}
					
		
		if (count == -1)
			count = candidates.length;
				
		if (count < candidates.length)
			for (i in 0...count)
				dispellBuff(MathUtils.randomInt(0, candidates.length));
		else
			for (i in 0...candidates.length)
				dispellBuff(i);
	}
	
	private function dispellBuff(index:Int)
	{
		if (index >= 0)
		{
			trace ("Dispelled buff: " + queue[index].name);
			queue[index].onEnd();
			queue.splice(index, 1);
		}
	}
	
	public function elementalCount(element:Element):Int
	{
		var count:Int = 0;
		
		for (buff in queue)
			if (buff.element == element)
				count++;
				
		return count;
	}
	
	public function new() 
	{
		queue = new Array<battle.Buff>();
		newBuffs = 0;
	}
	
	//We need separate function because we compare only by id. indexOf() thinks that buffs with different current durations are different 
	private function indexOfBuff(id:ID):Int
	{
		for (buff in queue)
			if (buff.id == id)
				return queue.indexOf(buff);
				
		return -1;
	}
}