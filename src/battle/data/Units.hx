package battle.data;
import battle.Unit;
import battle.struct.UnitCoords;
import hxassert.Assert;
import battle.enums.Team;

/**
 * ...
 * @author Gulvan
 */
typedef BotDecision = {target:UnitCoords, abilityNum:Int}
typedef UnitParameters = {
	var name:String;
	var hp:Int;
	var mana:Int;
	var wheel:Array<String>;
	
	var strength:Int;
	var flow:Int;
	var intellect:Int;
}
 
class Units 
{

	//================================================================================
    // Parameters
    //================================================================================
	
	public static function getParametersByID(id:String, godMode:Bool = false):UnitParameters
	{
		var parameters:UnitParameters = {name:"", hp:-1, mana:-1, wheel:[], strength:-1, flow:-1, intellect:-1};
		
		switch (id)
		{
			case "unit_ghost":
				parameters.name = "Ghost";
				parameters.hp = 100;
				parameters.mana = 50;
				parameters.wheel = ["ability_quick_strike"];
				parameters.strength = 1;
				parameters.flow = 1;
				parameters.intellect = 1;
			case "unit_archghost":
				parameters.name = "Archghost";
				parameters.hp = 10000;
				parameters.mana = 5000;
				parameters.wheel = ["ability_quick_strike"];
				parameters.strength = 1;
				parameters.flow = 1;
				parameters.intellect = 1;
			case "unit_zealon":
				parameters.name = "Zealon";
				parameters.hp = 140;
				parameters.mana = 400;
				parameters.wheel = ["ability_shock_therapy", "ability_high_voltage", "ability_electrical_storm", "ability_charge"];
				parameters.strength = 2;
				parameters.flow = 2;
				parameters.intellect = 4;
			case "unit_icarus":
				parameters.name = "Icarus";
				parameters.hp = 200;
				parameters.mana = 200;
				parameters.wheel = ["ability_burn", "ability_affliction", "ability_replenish", "ability_in_flames"];
				parameters.strength = 2;
				parameters.flow = 4;
				parameters.intellect = 2;
			case "unit_hugo":
				parameters.name = "Hugo";
				parameters.hp = 400;
				parameters.mana = 140;
				parameters.wheel = ["ability_kick", "ability_throw_stone", "ability_nature_heal", "ability_stone_form"];
				parameters.strength = 4;
				parameters.flow = 2;
				parameters.intellect = 2;
			default:
				trace("Incorrect unit ID: " + id);
				neko.Lib.rethrow(0);
		}
		
		if (godMode)
		{
			parameters.hp *= 100;
			parameters.mana *= 100;
		}
		
		return parameters;
	}
	
	//================================================================================
    // AI
    //================================================================================
	
	public static function decide(id:String, allies:Array<battle.Unit>, enemies:Array<battle.Unit>):BotDecision
	{
		switch (id)
		{
			case "unit_ghost", "unit_archghost":
				return ghost(allies);
			default:
				trace("Incorrect unit ID: " + id);
				neko.Lib.rethrow(0);
				return {target:new UnitCoords(battle.enums.Team.Left, -1), abilityNum:-1};
		}
	}
	
	private static function ghost(allies:Array<battle.Unit>):BotDecision
	{
		var target:UnitCoords = findWeakestUnit(allies);
		
		return {target: target, abilityNum: 0};
	}
	
	//================================================================================
    // Supply
    //================================================================================
	
	private static function findWeakestUnit(array:Array<battle.Unit>):UnitCoords 
	{
		Assert.assert(array.length > 0);
		
		var result:battle.Unit = array[0];
		
		for (unit in array)
			if (unit.hpPool.value < result.hpPool.value)
				result = unit;
		
		return new UnitCoords(result.team, result.position);
	}
	
}