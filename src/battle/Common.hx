package battle;
import Assets;
import battle.struct.UPair;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;

using MathUtils;

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	
	private function keyHandler(e:KeyboardEvent)
	{
		if (e.keyCode.inRange(49, 57))
			if (model.getInputMode() != InputMode.None)
				model.choose(e.keyCode - 49);
	}
	
	//================================================================================
	
	private static var ABILITYBARH:Float = 80;
	private static var ABILITYBARX:Float = 0;
	private static var ABILITYBARY:Float = Main.screenH - ABILITYBARH;
	private static var STATEBARX:Float = 0;
	private static var STATEBARY:Float = 0;
	
	public function init(pair:UPair<Unit>) 
	{	
		add(bg, 0, 0);
		add(objects, 0, 0);
		add(abilityBar, ABILITYBARX, ABILITYBARY);
		add(stateBar, STATEBARX, STATEBARY);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
		
		objects.init();
		abilityBar.init();
		stateBar.init(pair);
	}
	
	public function new(zone:Zone, units:Array<UnitData>, wheel:Array<Ability>)
	{
		super();
		
		bg = Assets.getBattleBG(zone);
		objects = new UnitsAndBolts(allies, enemies, model);
		abilityBar = new AbilityBar(allies[0], model);
		stateBar = new UnitStateBar(allies, enemies, model);
		effectHandler = new EffectHandler();
	}
}