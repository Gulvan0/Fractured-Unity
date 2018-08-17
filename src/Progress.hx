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
		//Will get more complicated in the future
		if (progress[currentZone].value >= progress[currentZone].maxValue - 1)
			return true;
		else
			return false;
	}
	
	function set_currentZone(value:Zone):Zone 
	{
		if (progress[value].value != 0)
			return currentZone = value;
		else
			throw "Attempt to get to the locked zone";
	}
	
}