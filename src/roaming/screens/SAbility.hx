package roaming.screens;

import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import roaming.IScreen;
import roaming.Player;
import roaming.Tree;
import roaming.Unit;

/**
 * Ability screen. Contains ability tree and ability wheel
 * @author Gulvan
 */
class SAbility extends SSprite implements IScreen 
{
	
	public function draw() 
	{
		add(new AbilityScreenBG(), bgX, bgY);
		add(new TreeBox(), treeBoxX, treeBoxY);
		
		for (abilityProps in Main.player.tree)
		{
			
		}
	}
	
	public function onKeyPress(e:KeyboardEvent) 
	{
		
	}
	
	public function onClick(e:MouseEvent) 
	{
		
	}
	
	public function close() 
	{
		
	}
	
	public function circleMaskTest()
	{
		addChild(squareToRound(new HighVoltage()));
	}
	
	public function new() 
	{
		super();
	}
	
	/**
	 * Parameter object has to have its zero at top-left corner. Returned object has its zero at its center
	 * @param	ability
	 */
	private function squareToRound(ability:MovieClip):MovieClip
	{
		var container:MovieClip = new MovieClip();
		var newAbility:MovieClip = ability;
		var newMask:MovieClip = new CircleAbilityMask();
		
		newAbility.width = 43;
		newAbility.height = 43;
		newAbility.x = -treeAbilityRadius;
		newAbility.y = -treeAbilityRadius;
		newMask.x = newAbility.x + newAbility.width / 2;
		newMask.y = newAbility.y + newAbility.height / 2;
		
		container.addChild(newAbility);
		container.addChild(newMask);
		
		newAbility.mask = newMask;
		return container;
	}
	
	//================================================================================
	// Inline map
	//================================================================================
	
	private static inline var bgX:Float = 0;
	private static inline var bgY:Float = 0;
	
	private static inline var treeBoxX:Float = 50;
	private static inline var treeBoxY:Float = 50;
	
	private static inline var treeAbilityRadius:Float = 18;
	
	private static inline var wheelCenterX:Float = -1;
	private static inline var wheelCenterY:Float = -1;
	private static inline var wheelRadius:Float = -1;
	
	private static inline function treeAbilityX(i:Int):Float
	{
		return (treeAbilityOffsetX() + 2 * treeAbilityRadius) * i + treeAbilityOffsetX() + treeAbilityRadius; 
	}
	
	private static inline function treeAbilityY(j:Int):Float
	{
		return (treeAbilityOffsetY() + 2 * treeAbilityRadius) * j + treeAbilityOffsetY() + treeAbilityRadius; 
	}
	
	private static inline function treeAbilityOffsetX():Float
	{
		var count:Int = XMLUtils.getGlobal("tree", "width", 1);
		var boxW:Float = new TreeBox().width;
		return (boxW - count * wheelRadius * 2) / (count + 1);
	}
	
	private static inline function treeAbilityOffsetY():Float
	{
		var count:Int = XMLUtils.getGlobal("tree", "height", 1);
		var boxH:Float = new TreeBox().height;
		return (boxH - count * wheelRadius * 2) / (count + 1);
	}
	
	
	private static inline function wheelAbilityX(num:Int):Float
	{
		var localX:Float = Math.cos((1/2 - num/4) * Math.PI);
		return localX * wheelRadius + wheelCenterX;
	}
	
	private static inline function wheelAbilityY(num:Int):Float
	{
		var localY:Float = Math.sin((1/2 - num/4) * Math.PI);
		return localY * wheelRadius + wheelCenterY;
	}
	
}