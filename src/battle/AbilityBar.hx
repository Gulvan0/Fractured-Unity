package battle;
import battle.enums.AbilityType;
import battle.enums.StrikeType;
import battle.struct.UnitCoords;
import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import openfl.filters.GlowFilter;
/**
 * Vision of bottom battle bar with ability icons
 * @author Gulvan
 */
class AbilityBar extends SSprite 
{
	
	private var bottomBar:DisplayObject;
	private var skipTurn:DisplayObject;
	private var leaveBattle:DisplayObject;
	private var abs:Array<Ability>;
	private var abilitiesVision:Array<AbilityCell>;
	
	public function new(wheel:Array<Ability>) 
	{
		super();	
		
		bottomBar = new BottomBattleBar();
		skipTurn = new SkipTurn();
		leaveBattle = new LeaveBattle();
		abs = wheel;
		abilitiesVision = [for (i in 0...10) new AbilityCell(abs[i], "" + (i + 1))];
	}
	
	public function init()
	{		
		add(bottomBar, 4.85, 0);
		add(skipTurn, 766, 21);
		add(leaveBattle, 830, 21);
		
		for (i in 0...10)
			add(abilitiesVision[i], abilityX(i), 17);
			
		skipTurn.addEventListener(MouseEvent.CLICK, skipHandler, null, null, true);
		leaveBattle.addEventListener(MouseEvent.CLICK, leaveHandler, null, null, true);
	}
	
	private static inline function abilityX(i:Int):Float
	{
		return 15 + i * 70;
	}
	
	public function tick(current:UnitData):Void 
	{
		if (current.id == ID.Player)
			for (i in 1...10)
				if (!abs[i].checkEmpty() && abs[i].type == AbilityType.Active)
					abilitiesVision[i].decrementCooldown();
	}
	
	public function abSelected(num:Int):Void 
	{
		abilitiesVision[num].filters = [new GlowFilter(0x47FE0A, 1, 20, 20, 2, 1, true)];
	}
	
	public function abDeselected(num:Int):Void 
	{
		abilitiesVision[num].filters = [];
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		for (i in 0...abs.length)
			if (abs[i].id == id)
			{
				abilitiesVision[i].updateCooldown();
				break;
			}
		//Continue
	}
	
	private function skipHandler(e:MouseEvent)
	{
		ConnectionManager.skipTurn();
	}
	
	private function leaveHandler(e:MouseEvent)
	{
		ConnectionManager.quit();
	}
	
}