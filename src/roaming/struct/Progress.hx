package roaming.struct;
import hxassert.Assert;

/**
 * ...
 * @author Gulvan
 */
class Progress 
{

	public var stage:Int;
	public var zone:Int;
	
	public function new(zone:Int, stage:Int) 
	{
		Assert.assert(zone >= 0);
		Assert.assert(stage >= 0);
		
		this.stage = stage;
		this.zone = zone;
	}
	
}