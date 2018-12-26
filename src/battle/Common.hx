package battle;
import Assets;
import battle.Model;
import battle.Unit;
import battle.UnitStateBar;
import battle.enums.InputMode;
import battle.struct.UPair;
import openfl.display.DisplayObject;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

using MathUtils;

/**
 * Common code for all the visions
 * @author Gulvan
 */
class Common extends SSprite
{
	
	public static var shiftKey:Bool;
	
	private var bg:DisplayObject;
	private var stateBar:UnitStateBar;
	private var abilityBar:AbilityBar;
	private var objects:UnitsAndBolts;
	private var effectHandler:EffectHandler;
	
	private function keyUpHandler(e:KeyboardEvent)
	{
		if (e.keyCode == 16)
            shiftKey = false;
	}
	
	private function keyHandler(e:KeyboardEvent)
	{
		trace("key handled: " + e.keyCode);
		
		if (e.keyCode == 16)
			shiftKey = true;
		else if (e.keyCode.inRange(49, 57))
			if (model.getInputMode() != InputMode.None)
				model.choose(e.keyCode - 49);
	}
	
	private function clickHandler(e:MouseEvent)
	{
		trace("click handled: " + e.stageX + ", " + e.stageY);
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
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		
		objects.init();
		abilityBar.init();
		stateBar.init(pair);
	}
	
	public function new(zone:Zone, allies:Array<Unit>, enemies:Array<Unit>)
	{
		super();
		this.model = model;
		shiftKey = false;
		
		bg = Assets.getBattleBG(zone);
		objects = new UnitsAndBolts(allies, enemies, model);
		abilityBar = new AbilityBar(allies[0], model);
		stateBar = new UnitStateBar(allies, enemies, model);
	}
}