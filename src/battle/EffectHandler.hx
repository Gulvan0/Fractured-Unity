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

class EffectData
{
	public var target:Null<Unit>;
	public var caster:Null<Unit>;
	public var delta:Null<Float>;
	public var element:Null<Element>;
	public var source:Null<Source>;
	public function new(target:Null<Unit>, caster:Null<Unit>, delta:Null<Float>, element:Null<Element>, source:Null<Source>)
	{
		this.target = target;
		this.caster = caster;
		this.delta = delta;
		this.element = element;
		this.source = source;
	}
}

/**
 * An observer that forces passives to react on battle events
 * @author Gulvan
 */
class EffectHandler implements IModelObserver
{
	
	private static var model:ISimpleModel;
	private static var flag:Bool = true;
	
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
	
	private function procAbilities(e:BattleEvent, unit:Unit, data:EffectData)
	{
		for (passive in unit.wheel.passives(e))
			Passives.handle(passive, e, data);
	}
	
	private function procBuffs(e:BattleEvent, unit:Unit)
	{
		for (buff in unit.buffQueue.getTriggering(e))
			Buffs.useBuff(buff.id, buff.owner, buff.caster, BuffMode.Proc);
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, caster:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		var data:EffectData = new EffectData(target, caster, dhp, element, source);
		
		procAbilities(BattleEvent.HPUpdate, target, data);
		procBuffs(BattleEvent.HPUpdate, target);
		if (crit && !target.same(caster))
			procAbilities(BattleEvent.Crit, caster, data);
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		var data:EffectData = new EffectData(target, null, dmana, null, source);
		
		procAbilities(BattleEvent.ManaUpdate, target, data);
		procBuffs(BattleEvent.ManaUpdate, target);
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		var data:EffectData = new EffectData(unit, null, dalac, null, source);
		
		procAbilities(BattleEvent.AlacUpdate, unit, data);
		procBuffs(BattleEvent.AlacUpdate, unit);
	}
	
	public function preTick(current:Unit):Void
	{
		//no action
	}
	
	public function tick(current:Unit):Void 
	{
		var data:EffectData = new EffectData(current, null, null, null, null);
		
		procAbilities(BattleEvent.Tick, current, data);
		procBuffs(BattleEvent.Tick, current);
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		var t:Unit = getUnit(target);
		var data:EffectData = new EffectData(t, null, null, element, null);
		
		procAbilities(BattleEvent.Miss, t, data);
		procBuffs(BattleEvent.Miss, t);
	}
	
	public function death(unit:UnitCoords):Void 
	{
		var data:EffectData = new EffectData(getUnit(unit), null, null, null, null);
		
		for (u in model.getUnits())
			procAbilities(BattleEvent.Death, u, data);
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		var t:Unit = getUnit(target);
		var c:Unit = getUnit(caster);
		var data:EffectData = new EffectData(t, c, null, element, null);
		
		procAbilities(BattleEvent.Strike, t, data);
		procBuffs(BattleEvent.Strike, t);
			
		model.respond();
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
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
	
}