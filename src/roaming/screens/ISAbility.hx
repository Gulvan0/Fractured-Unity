package roaming.screens;

/**
 * @author Gulvan
 */
interface ISAbility 
{
	public function getAbRadius():Float;
	
	public function put(i:Int, j:Int):Void;
	public function splice(i:Int):Void;
}