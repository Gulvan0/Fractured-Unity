package;

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
	}
	
	public function tick()
	{
		for (buff in queue)
		{
			var index:Int = queue.indexOf(buff);
			if (buff.tickAndCheckEnded())
				queue.splice(index, 1);
		}
	}
	
	public function new() 
	{
		queue = new Array<Buff>();
	}
	
	//We need separate function because we compare only by id. indexOf() thinks that buffs with different current durations are different 
	private function indexOfBuff(id:String):Int
	{
		for (buff in queue)
			if (buff.id == id)
				return queue.indexOf(buff);
				
		return -1;
	}
}