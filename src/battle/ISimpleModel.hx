package battle;
import battle.struct.UPair;

/**
 * @author Gulvan
 */
interface ISimpleModel 
{
	public function getUnits():UPair<Unit>;
	public function respond():Void;
}