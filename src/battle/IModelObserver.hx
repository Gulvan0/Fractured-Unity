package battle;
import battle.Model.AbilityInfo;
import battle.Model.UnitInfo;
import battle.enums.AbilityType;
import battle.enums.Source;
import battle.struct.UnitCoords;

/**
 * @author Gulvan
 */
interface IModelObserver 
{
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void;
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void;
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void;
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void;
	
	public function tick(current:Unit):Void;
	public function miss(target:UnitCoords, element:Element):Void;
	public function death(unit:UnitCoords):Void;
	
	public function abSelected(num:Int):Void;
	public function abDeselected(num:Int):Void;
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, type:AbilityType, element:Element):Void;
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:AbilityType):Void;
	
	public function abInfoPrint(info:AbilityInfo):Void;
	public function unitInfoPrint(info:UnitInfo):Void;
	
	public function warn(text:String):Void;
}