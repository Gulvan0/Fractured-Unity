package battle.data;
import battle.EffectHandler.IEffectHandler;
import battle.Unit;
import battle.enums.Source;
import battle.struct.UnitCoords;

enum BattleEvent 
{
	HPUpdate;
	ManaUpdate;
	AlacUpdate;
	Throw;
	Strike;
	Miss;
	Tick;
	Death;
	Crit;
}

/**
 * ...
 * @author Gulvan
 */

class Passives 
{
	
	private static var model:IMutableModel;
	private static var flag:Bool = true;
	
	private static var event:BattleEvent;
	private static var caller:IEffectHandler;
	
	public static function init(m:IMutableModel)
	{
		if (flag)
		{
			model = m;
			flag = false;
		}
		else
			throw "Attempt to re-init";
	}
	
	public static function handle(id:ID, e:BattleEvent, handlerCaller:IEffectHandler) 
	{
		event = e;
		caller = handlerCaller;
		
		switch (id)
		{
			case ID.LgStrikeback:
				strikeback();
			case ID.LgThunderbirdSoul:
				thunderbirdSoul();
			default:
				throw "Passives->handle() exception: Invalid ID: " + id.getName();
		}
	}
	
	private static function strikeback()
	{
		var owner:UnitCoords = caller.getTarget();
		
		model.castBuff(ID.BuffLgStrikeback, owner, UnitCoords.nullC(), 1);
	}
	
	private static function thunderbirdSoul()
	{
		var owner:UnitCoords = caller.getCaster();
		var dmg:Int = -Math.round(caller.getDelta());
		
		model.changeHP(owner, owner, dmg, Element.Lightning, Source.Buff);
	}
}