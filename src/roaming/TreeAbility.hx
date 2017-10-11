package roaming;
import hxassert.Assert;

/**
 * A model of tree ability, that only contains data given and doesn't know anything about it's ability or parent tree
 * @author Gulvan
 */
class TreeAbility
{
	
	public var id(default, never):String;
	public var maxLvl(default, never):Int;
	
	public var currentLvl:Int;
	
	public function learn():Bool
	{
		if (currentLvl >= maxLvl)
			return false;
			
		currentLvl++;
		return true;
	}
	
	public function reset():Int
	{
		var lvl:Int = currentLvl;
		currentLvl = 0;
		return lvl;
	}
	
	public function new(id:String, maxLvl:Int) 
	{
		Assert.assert(maxLvl > 0);
		
		this.id = id;
		this.maxLvl = maxLvl;
		this.currentLvl = 0;
	}
	
}