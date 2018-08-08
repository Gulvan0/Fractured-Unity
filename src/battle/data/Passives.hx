package battle.data;
import battle.EffectHandler.EffectData;
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
	private static var data:EffectData;
	
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
	
	public static function handle(id:ID, e:BattleEvent, dataObj:EffectData) 
	{
		event = e;
		data = dataObj;
		
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
		model.castBuff(ID.BuffLgStrikeback, UnitCoords.get(data.target), UnitCoords.nullC(), 1);
	}
	
	private static function thunderbirdSoul()
	{
		model.changeHP(UnitCoords.get(data.caster), UnitCoords.get(data.caster), -Math.round(data.delta/2), Element.Lightning, Source.Buff);
	}
}