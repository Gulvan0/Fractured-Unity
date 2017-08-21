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
				parameters.element = Element.Lightning;
				parameters.isOverTime = false;
				parameters.isStackable = false;
			case "buff_charged":
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