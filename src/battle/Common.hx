package battle;
import Assets;
import battle.enums.InputMode;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;

using MathUtils;

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	public var inputMode(default, null):InputMode;
	private var playerCoords:UnitCoords;
	private var reversed:Bool;
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	
	private function keyHandler(e:KeyboardEvent)
	{
		if (e.keyCode.inRange(49, 57))
			if (inputMode != InputMode.None)
				//model.choose(e.keyCode - 49);
	}
	
	//================================================================================
	
	private static var ABILITYBARH:Float = 80;
	private static var ABILITYBARX:Float = 0;
	private static var ABILITYBARY:Float = Main.screenH - ABILITYBARH;
	private static var STATEBARX:Float = 0;
	private static var STATEBARY:Float = 0;
	
	public function init() 
	{	
		add(bg, 0, 0);
		add(objects, 0, 0);
		add(abilityBar, ABILITYBARX, ABILITYBARY);
		add(stateBar, STATEBARX, STATEBARY);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		
		objects.init();
		abilityBar.init();
		stateBar.init();
	}
	
	public function new(zone:Zone, units:Array<UnitData>, wheel:Array<Ability>, login:String)
	{
		super();
		inputMode = InputMode.None;
		reversed = false;
		
		var upair:UPair<UnitData> = new UPair([], []);
		for (u in units)
			if (u.team == Team.Left)
				upair.left.push(u);
			else
				upair.right.push(u);
		for (u in units)
			switch (u.id)
			{
				case ID.Player(l): 
					if (l == login)
					{
						playerCoords = UnitCoords.get(u);
						if (u.team == Team.Right)
						{
							upair.reverse();
							reversed = true;
						}
						break;
					}
				default:
			}
		
		bg = Assets.getBattleBG(zone);
		objects = new UnitsAndBolts(upair);
		abilityBar = new AbilityBar(wheel);
		stateBar = new UnitStateBar(upair);
	}
}