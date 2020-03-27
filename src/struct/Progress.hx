package;
import battle.struct.Pool;

/**
 * Represents a player's progress in game
 * @author Gulvan
 */
class Progress 
{
	
	public var progress:Map<Zone, Pool>;
	public var currentZone(default, set):Zone;
	
	public function new(prog:Map<Zone, Int>, current:Zone) 
	{
		progress = [for (zone in Zone.createAll()) zone => new Pool(0, WorldMap.stageCount(zone))];
		for (key in progress.keys())
			if (prog.exists(key))
				progress[key].value = prog[key];
				
		this.currentZone = current;
	}
	
	public function getZoneName():String
	{
		return switch (currentZone)
		{
			case Zone.NullSpace: "Null Space";
			default: "Unknown";
		};
	}
	
	public function getStage():Int
	{
		return progress[currentZone].value;
	}
	
	public function proceed()
	{
		if (progress[currentZone].value == progress[currentZone].maxValue)
			progress[currentZone].value++;
	}
	
	public function isBossStage():Bool
	{
		//Can get more complicated in the future
		if (progress[currentZone].value >= progress[currentZone].maxValue - 1)
			return true;
		else
			return false;
	}

	public function getCurrentMaxStageCount():Int
	{
		return progress[currentZone].maxValue;
	}
	
	function set_currentZone(value:Zone):Zone 
	{
		return currentZone = value;
	}
	
}