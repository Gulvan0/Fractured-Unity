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
		progress = [for (zone in Zone.createAll()) zone => new Pool(0, XMLUtils.stageCount(zone) + 1)];
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
		progress[currentZone].value++;
		if (progress[currentZone].value == progress[currentZone].maxValue)
			for (zone in XMLUtils.nextZones(currentZone))
				if (progress[zone].value == 0)
					progress[zone].value = 1;
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