package battle;
import battle.enums.InputMode;
import battle.struct.UnitCoords;

/**
 * @author Gulvan
 */
interface IObservableModel 
{
	public function getInputMode():InputMode;
	
	public function choose(abilityPos:Int):Void;
	public function targetAndUse(targetCoords:UnitCoords):Void;
	
	public function printAbilityInfo(num:Int):Void;
	public function printUnitInfo(coords:UnitCoords):Void;
	public function skipTurn():Void;
	public function quit():Void;
	
	public function respond():Void;
}