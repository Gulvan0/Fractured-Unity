package roaming;

import roaming.Unit;

/**
 * Represents an allied bot in roaming state
 * @author Gulvan
 */
class Bot extends Unit 
{

	public override function levelUp()
	{
		level++;
		
		//To be filled
	}
	
	public function new(id:ID, element:Element, name:String, ?params:Null<RoamUnitParameters>) 
	{
		super(id, element, name, params);
	}
	
}