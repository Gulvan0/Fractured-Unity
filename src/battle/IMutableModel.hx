package battle;
import battle.enums.Source;
import battle.struct.UPair;
import battle.struct.UnitCoords;

/**
 * @author Gulvan
 */
interface IMutableModel 
{
	public function changeHP(target:UnitCoords, caster:UnitCoords, dhp:Int, element:Element, source:Source):Void;
	public function changeMana(target:UnitCoords, caster:UnitCoords, dmana:Int, source:Source):Void;
	public function changeAlacrity(target:UnitCoords, caster:UnitCoords, dalac:Float, source:Source):Void;
	
	public function castBuff(id:ID, target:UnitCoords, caster:UnitCoords, duration:Int):Void;
	public function dispellBuffs(target:UnitCoords, ?elements:Array<Element>, ?count:Int = -1):Void;
	
	public function getUnits():UPair<Unit>;
}