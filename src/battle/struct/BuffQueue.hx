package battle.struct;
import battle.Buff;
import battle.data.Passives.BattleEvent;
import hxassert.Assert;
import Element;
import MathUtils;

/**
 * ...
 * @author Gulvan
 */
class BuffQueue
{

	public var queue(default, null):Array<Buff>;
	
	public function addBuff(buff:Buff)
	{
		var index:Int = indexOfBuff(buff.id);
		
		if (index == -1 || buff.isStackable)
			queue.push(buff);
		else
			queue[index] = buff;
		
		trace ("Buff casted: " + buff.name);
		buff.onCast();
		trace ("Buff activated");
	}
	
	public function tick()
	{
		for (i in 0...queue.length)
		{
			trace("Ticking: " + queue[i].name + ", cd: " + queue[i].duration + "(-1 now)");
			if (queue[i].tickAndCheckEnded())
			{
				dispellBuff(i);
				trace ("Dispelled");
			}
		}
	}
	
	public function getTriggering(e:BattleEvent):Array<Buff>
	{
		return [for (b in queue) if (b.reactsTo(e)) b];
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
		{
			count = 0;
			for (element in elements)
				count += elementalCount(element);
		}
				
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