package battle.data;

/**
 * [STATIC_SERVICE] Returns enemies' ids by zone&stage number
 * @author Gulvan
 */
class Stages 
{
	
	public static function getEnemiesByStage(zone:Int, stage:Int):Array<String>
	{
		var a:Array<String> = [];
		
		switch (Std.string(zone) + "_" + Std.string(stage))
		{
			case "0_1":
				a = ["unit_ghost"];
			case "0_2":
				a = ["unit_ghost", "unit_ghost", "unit_ghost"];
			case "0_3":
				a = ["unit_archghost"];
			default:
				trace("ERROR! Incorrect zone&stage combination: " + zone + ", " + stage);
				neko.Lib.rethrow(0);
		}
		
		return a;
	}
	
}