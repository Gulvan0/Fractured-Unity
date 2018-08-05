package battle.vision;
import battle.Active;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.StrikeType;
import battle.struct.UnitCoords;
import battle.enums.Source;
import haxe.ds.Either;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.events.MouseEvent;
import openfl.filters.GlowFilter;

import battle.IModelObserver;
import battle.Unit;

/**
 * Vision of bottom battle bar with ability icons
 * @author Gulvan
 */
class AbilityBar extends SSprite implements IModelObserver 
{
	
	private var model:IObservableModel;
	
	private var bottomBar:DisplayObject;
	private var skipTurn:DisplayObject;
	private var leaveBattle:DisplayObject;
	private var abs:Array<Ability>;
	private var abilitiesVision:Array<AbilityCell>;
	
	public function new(player:Unit, model:IObservableModel) 
	{
		super();
		this.model = model;		
		
		bottomBar = new BottomBattleBar();
		skipTurn = new SkipTurn();
		leaveBattle = new LeaveBattle();
		abs = [for (i in 0...10) player.wheel.get(i)];
		abilitiesVision = [for (i in 0...10) new AbilityCell(abs[i], "" + (i + 1))];
	}
	
	public function init()
	{		
		add(bottomBar, 4.85, 0);
		add(skipTurn, 766, 21);
		add(leaveBattle, 830, 21);
		
		for (i in 0...10)
			add(abilitiesVision[i], abilityX(i), 17);
			
		skipTurn.addEventListener(MouseEvent.CLICK, skipHandler);
		leaveBattle.addEventListener(MouseEvent.CLICK, leaveHandler);
	}
	
	private static inline function abilityX(i:Int):Float
	{
		return 15 + i * 70;
	}
	
	public function preTick(current:Unit):Void
	{
		//no action
	}
	
	public function tick(current:Unit):Void 
	{
		if (current.isPlayer())
			for (i in 1...10)
				if (!abs[i].checkEmpty() && abs[i].type == AbilityType.Active)
					abilitiesVision[i].decrementCooldown();
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		for (i in 0...abs.length)
			if (abs[i].id == id)
			{
				abilitiesVision[i].updateCooldown();
				break;
			}
		model.respond();
	}
	
	private function skipHandler(e:MouseEvent)
	{
		model.skipTurn();
	}
	
	private function leaveHandler(e:MouseEvent)
	{
		model.quit();
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, caster:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		//no action
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		//no action
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		//no action
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		//no action
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		//no action
	}
	
	public function death(unit:UnitCoords):Void 
	{
		//no action
	}
	
	public function abSelected(num:Int):Void 
	{
		abilitiesVision[num].filters = [new GlowFilter(0x47FE0A, 1, 20, 20, 2, 1, true)];
	}
	
	public function abDeselected(num:Int):Void 
	{
		abilitiesVision[num].filters = [];
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		model.respond();
	}
	
	public function warn(text:String):Void 
	{
		//no action
	}
	
}