package roaming;
import hxassert.Assert;

/**
 * A model of tree ability, that only contains data given and doesn't know anything about it's ability or parent tree
 * @author Gulvan
 */
class Ability
{
	
	public var id(default, null):ID;
	public var maxLvl(default, null):Int;
	
	public var currentLvl:Int;
	
	public function learn():Bool
	{
		if (currentLvl >= maxLvl)
			return false;
			
		currentLvl++;
		trace("Learning ability " + id + " (" + (currentLvl - 1) + "->" + currentLvl + "/" + maxLvl + ")");
		return true;
	}
	
	public function reset():Int
	{
		var lvl:Int = currentLvl;
		currentLvl = 0;
		return lvl;
	}
	
	public function new(id:ID, maxLvl:Int) 
	{
		Assert.assert(maxLvl > 0);
		
		this.id = id;
		this.maxLvl = maxLvl;
		this.currentLvl = 0;
	}
	
}