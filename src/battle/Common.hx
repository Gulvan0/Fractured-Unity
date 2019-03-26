package battle;
import Assets;
import battle.enums.AbilityType;
import battle.enums.InputMode;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;

using MathUtils;

enum ChooseResult 
{
	Ok;
	Empty;
	Manacost;
	Cooldown;
	Passive;
}

enum TargetResult 
{
	Ok;
	Invalid;
	Nonexistent;
	Dead;
	NoAbility;
} 

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	public var inputMode(default, null):InputMode;
	private var playerCoords:UnitCoords;
	private var reversed:Bool;
	
	private var units:UPair<UnitData>;
	private var chosenAbility:Null<Int>;
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	
	private function keyHandler(e:KeyboardEvent)
	{
		if (e.keyCode.inRange(49, 57))
			if (inputMode != InputMode.None)
				switch (checkChoose(abilityBar.abs[e.keyCode - 49]))
				{
					case ChooseResult.Ok:
						chosenAbility = e.keyCode - 49;
						abilityBar.abSelected(chosenAbility);
						inputMode = InputMode.Targeting;
					case ChooseResult.Passive:
						objects.warn("This ability is passive, you can't use it");
					case ChooseResult.Manacost:
						objects.warn("Not enough mana");
					case ChooseResult.Cooldown:
						objects.warn("This ability is currently on cooldown");
					case ChooseResult.Empty:
						objects.warn("There is no ability in this slot");
				}
	}
	
	public function target(coords:UnitCoords)
	{
		if (inputMode == InputMode.Targeting)
			switch (checkTarget(coords))
			{
				case TargetResult.Ok:
					ConnectionManager.useAbility({abilityNum: chosenAbility, target: coords});
					chosenAbility = null;
					inputMode = InputMode.None;
				case TargetResult.Invalid:
					objects.warn("Chosen ability can't be used on this target");
					abilityBar.abDeselected(chosenAbility);
					chosenAbility = null;
					inputMode = InputMode.Choosing;
				default:
			}
	}
	
	public function checkChoose(ability:Ability):ChooseResult
	{
		if (ability.checkEmpty())
			return ChooseResult.Empty;
		if (ability.type == AbilityType.Passive)
			return ChooseResult.Passive;
		
		if (ability.checkOnCooldown())
			return ChooseResult.Cooldown;
		if (!units.get(playerCoords).checkAffordable(ability.manacost))
			return ChooseResult.Manacost;
		
		return ChooseResult.Ok;
	}
	
	public function checkTarget(coords:UnitCoords):TargetResult
	{
		var target:UnitData = units.get(coords);
		
		if (chosenAbility == null)
			return TargetResult.NoAbility;
		if (target == null)
			return TargetResult.Nonexistent;
		if (target.hp.value == 0)
			return TargetResult.Dead;
		if (!abilityBar.abs[chosenAbility].checkValid(playerCoords, coords))
			return TargetResult.Invalid;
			
		return TargetResult.Ok;
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
		
		this.units = upair;
	}
}