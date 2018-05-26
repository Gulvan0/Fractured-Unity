package battle;
import battle.data.Passives;
import battle.enums.AbilityType;
import battle.Buff;
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
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		this.target = UnitCoords.get(target);
		this.delta = dhp;
		
		for (passive in target.wheel.passives(BattleEvent.HPUpdate))
			Passives.handle(passive.id, BattleEvent.HPUpdate, this);
		
		if (crit)
			for (passive in target.wheel.passives(BattleEvent.Crit))
				Passives.handle(passive.id, BattleEvent.Crit, this);
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		this.target = UnitCoords.get(target);
		this.delta = dmana;
		
		for (passive in target.wheel.passives(BattleEvent.ManaUpdate))
			Passives.handle(passive.id, BattleEvent.ManaUpdate, this);
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		this.target = UnitCoords.get(unit);
		this.delta = dalac;
		
		for (passive in unit.wheel.passives(BattleEvent.AlacUpdate))
			Passives.handle(passive.id, BattleEvent.AlacUpdate, this);
	}
	
	public function tick(current:Unit):Void 
	{
		this.target = UnitCoords.get(current);
		
		for (passive in current.wheel.passives(BattleEvent.Tick))
			Passives.handle(passive.id, BattleEvent.Tick, this);
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		this.target = target;
		var unit:Unit = model.getUnits().get(target);
		
		for (passive in unit.wheel.passives(BattleEvent.Miss))
			Passives.handle(passive.id, BattleEvent.Miss, this);
	}
	
	public function death(unit:UnitCoords):Void 
	{
		this.target = unit;
		
		for (u in model.getUnits())
			for (passive in u.wheel.passives(BattleEvent.Death))
				Passives.handle(passive.id, BattleEvent.Death, this);
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType):Void 
	{
		this.target = target;
		this.caster = caster;
		var unit:Unit = model.getUnits().get(target);
		
		for (passive in unit.wheel.passives(BattleEvent.Strike))
			Passives.handle(passive.id, BattleEvent.Strike, this);
			
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
	
}