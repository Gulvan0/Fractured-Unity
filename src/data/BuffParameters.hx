package data;
import dataobj.ParamsBuff;
import utils.Element;

/**
 * [STATIC_SERVICE] Returns parameters by id (for buff ids)
 * @author Gulvan
 */
class BuffParameters
{

	public static function getParametersByID(id:String):ParamsBuff
	{
		var parameters:ParamsBuff = new ParamsBuff();
		
		switch (id)
		{
			case "buff_conductivity":
				parameters.name = "Conductivity";
				parameters.describition = "Healing income increased by 200%";
				parameters.element = Element.Lightning;
				parameters.isOverTime = false;
				parameters.isStackable = false;
			case "buff_charged":
				parameters.name = "Charged";
				parameters.describition = "Flow increased by 100%";
				parameters.element = Element.Lightning;
				parameters.isOverTime = false;
				parameters.isStackable = false;
			default:
				trace("Incorrect ability ID: " + id);
				throw 0;
		}
		
		return parameters;
	}
	
}