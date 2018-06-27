package battle;
import battle.data.Buffs;
import battle.data.Passives;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.BuffMode;
import battle.enums.StrikeType;
import battle.struct.UnitCoords;
import battle.enums.Source;
import battle.Unit;

interface IEffectHandler
{
	public function getTarget():UnitCoords;
	public function getCaster():UnitCoords;
	public function getDelta():Float;
}

/**
 * An observer that forces passives to react on battle events
 * @author Gulvan
 */
class EffectHandler implements IModelObserver implements IEffectHandler
{
	
	private static var model:ISimpleModel;
	private static var flag:Bool = true;
	
	private var target:UnitCoords;
	private var caster:UnitCoords;
	private var delta:Float;
	
	public function init(m:ISimpleModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to re-init";
	}
	
	private function procAbilities(e:BattleEvent, unit:Unit)
	{
		for (passive in unit.wheel.passives(e))
			Passives.handle(passive, e, this);
	}
	
	private function procBuffs(e:BattleEvent, unit:Unit)
	{
		for (buff in unit.buffQueue.getTriggering(e))
			Buffs.useBuff(buff.id, buff.owner, buff.caster, BuffMode.Proc);
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		this.target = UnitCoords.get(target);
		this.delta = dhp;
		
		procAbilities(BattleEvent.HPUpdate, target);
		procBuffs(BattleEvent.HPUpdate, target);
		if (crit)
			procAbilities(BattleEvent.Crit, target);
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		this.target = UnitCoords.get(target);
		this.delta = dmana;
		
		procAbilities(BattleEvent.ManaUpdate, target);
		procBuffs(BattleEvent.ManaUpdate, target);
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		this.target = UnitCoords.get(unit);
		this.delta = dalac;
		
		procAbilities(BattleEvent.AlacUpdate, unit);
		procBuffs(BattleEvent.AlacUpdate, unit);
	}
	
	public function tick(current:Unit):Void 
	{
		this.target = UnitCoords.get(current);
		
		procAbilities(BattleEvent.Tick, current);
		procBuffs(BattleEvent.Tick, current);
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		this.target = target;
		
		procAbilities(BattleEvent.Miss, getUnit(target));
		procBuffs(BattleEvent.Miss, getUnit(target));
	}
	
	public function death(unit:UnitCoords):Void 
	{
		this.target = unit;
		
		for (u in model.getUnits())
			procAbilities(BattleEvent.Death, u);
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType):Void 
	{
		this.target = target;
		this.caster = caster;
		
		procAbilities(BattleEvent.Strike, getUnit(target));
		procBuffs(BattleEvent.Strike, getUnit(target));
			
		model.respond();
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, type:StrikeType, element:Element):Void 
	{
		model.respond();
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		//no action
	}
	
	public function abSelected(num:Int):Void 
	{
		//no action
	}
	
	public function abDeselected(num:Int):Void 
	{
		//no action
	}
	
	public function warn(text:String):Void 
	{
		//no action
	}
	
	//--------------------------------------------------------------------
	
	private function getUnit(coords:UnitCoords):Unit
	{
		return model.getUnits().get(coords);
	}
	
	public function new() 
	{
		
	}
	
	public function getTarget():UnitCoords
	{
		return target;
	}
	
	public function getCaster():UnitCoords
	{
		return caster;
	}
	
	public function getDelta():Float
	{
		return delta;
	}
	
}