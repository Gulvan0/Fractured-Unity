package roaming.screens;
import roaming.enums.Attribute;

/**
 * @author Gulvan
 */
interface ISAbility 
{
	public function getAbRadius():Float;
	
	public function put(i:Int, j:Int):Void;
	public function splice(i:Int):Void;
	public function learn(i:Int, j:Int):Void;
	public function power(att:Attribute):Void;
	public function respec():Void;
}