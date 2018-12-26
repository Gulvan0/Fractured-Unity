package battle;
import battle.enums.Source;
import battle.enums.StrikeType;
import battle.struct.UnitCoords;

/**
 * @author Gulvan
 */
interface IModelObserver 
{
	public function hpUpdate(target:UnitCoords, delta:Int, element:Element, crit:Bool):Void;
	public function manaUpdate(target:UnitCoords, delta:Int):Void;
	public function alacUpdate(target:UnitCoords, delta:Int):Void;
	
	public function buffQueueUpdate(target:UnitCoords, queue:Array<Buff>):Void;
	
	public function tick(target:UnitCoords):Void;
	public function miss(target:UnitCoords, element:Element):Void;
	public function death(target:UnitCoords):Void;
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void;
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void;
}