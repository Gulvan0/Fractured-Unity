package battle.vision;
import battle.Model.AbilityInfo;
import battle.Model.UnitInfo;
import battle.enums.AbilityTarget;
import battle.enums.AbilityType;
import battle.Buff;
import battle.struct.UnitCoords;
import battle.enums.Source;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.events.MouseEvent;

import battle.IModelObserver;
import battle.Unit;

/**
 * Vision of bottom battle bar with ability icons
 * @author Gulvan
 */
class AbilityBar extends SSprite implements IModelObserver 
{

	public static var xPos:Float = 0;
	public static var yPos:Float = 516;
	
	private var model:IObservableModel;
	
	private var bottomBar:DisplayObject;
	private var skipTurn:DisplayObject;
	private var leaveBattle:DisplayObject;
	private var abilitiesVision:Array<MovieClip>;
	
	public function new(player:Unit, model:IObservableModel) 
	{
		super();
		this.model = model;		
		
		bottomBar = new BottomBattleBar();
		skipTurn = new SkipTurn();
		leaveBattle = new LeaveBattle();
		abilitiesVision = [for (i in 0...10) Assets.getBattleAbility(player.wheel.get(i).id)];
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
	
	private function skipHandler(e:MouseEvent)
	{
		model.skipTurn();
	}
	
	private function leaveHandler(e:MouseEvent)
	{
		model.quit();
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
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
	
	public function tick(current:Unit):Void 
	{
		//Update cooldowns on icons
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
		//Select ability
	}
	
	public function abDeselected(num:Int):Void 
	{
		//Deselect ability
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, type:AbilityType, element:Element):Void 
	{
		model.respond();
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:AbilityType):Void 
	{
		model.respond();
	}
	
	public function abInfoPrint(info:AbilityInfo):Void 
	{
		var targetString:String = switch (info.target)
		{
			case AbilityTarget.Self: "self";
			case AbilityTarget.Allied: "allies & self";
			case AbilityTarget.Enemy: "enemies";
			case AbilityTarget.All: "all targets";
		}
		
		var result:String = info.name + "\n" + info.describition + "\n\nCooldown: " + info.currentCooldown + "/" + (info.maxCooldown - 1) + ", Manacost: " + info.manacost + "\nType: " + info.type + "\nPossible targets: " + targetString;
		#if js
		js.Browser.alert(result);
		#elseif neko
		trace(result);
		#end
	}
	
	public function unitInfoPrint(info:UnitInfo):Void 
	{
		//no action
	}
	
	public function warn(text:String):Void 
	{
		//no action
	}
	
}