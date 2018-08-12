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
		progress = [for (zone in Zone.createAll()) zone => 0];
		for (key in progress.keys())
			if (prog.exists(key))
				progress[key] = new Pool(prog[key], XMLUtils.stageCount(key) + 1);
				
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
	
	function set_currentZone(value:Zone):Zone 
	{
		if (progress[value] != 0)
			return currentZone = value;
		else
			throw "Attempt to get to the locked zone";
	}
	
}