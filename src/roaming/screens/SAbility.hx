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
		add(new AbilityScreenBG(), bg.x, bg.y);
		add(new TreeBox(), treeBox.x, treeBox.y);
		
		for (ability in Main.player.tree)
		{
			var icon:MovieClip = Assets.getBattleAbility(ability.id);
			icon = squareToRound(icon);
			add(icon, treeAbilityX(ability.j), treeAbilityY(ability.i));
		}
		
		var i:Int = 0;
		for (id in Main.player.wheel)
		{
			var icon:MovieClip = Assets.getBattleAbility(id);
			icon = squareToRound(icon);
			add(icon, wheelAbilityX(i), wheelAbilityY());
			i++;
		}
		for (j in i...8)
		{
			var icon:MovieClip = Assets.getBattleAbility(ID.EmptyAbility);
			icon = squareToRound(icon);
			add(icon, wheelAbilityX(j), wheelAbilityY());
			j++;
		}
	}
	
	public function onKeyPress(e:KeyboardEvent) 
	{
		//no handling
	}
	
	public function close() 
	{
		
	}
	
	public function new() 
	{
		super();
	}
	
	/**
	 * Parameter object has to have its zero at top-left corner. Returned object has its zero at its center
	 * @param	ability
	 */
	public function squareToRound(ability:MovieClip):MovieClip
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
	
	private static inline var bg:Point = new Point(0, 0);
	private static inline var treeBox:Point = new Point(50, 50);
	private static inline var treeAbRadius:Float = 18;
	
	private static inline function treeAbX(j:Int):Float
	{
		return (treeAbOffsetX() + 2 * treeAbRadius) * j + treeAbOffsetX() + treeAbRadius + treeBox.x - 2; 
	}
	
	private static inline function treeAbY(i:Int):Float
	{
		return (treeAbOffsetY() + 2 * treeAbRadius) * i + treeAbOffsetY() + treeAbRadius + treeBox.y - 2; 
	}
	
	private static inline function treeAbOffsetX():Float
	{
		var count:Int = XMLUtils.getGlobal("tree", "width", 1);
		var boxW:Float = new TreeBox().width;
		return (boxW - count * treeAbRadius * 2) / (count + 1);
	}
	
	private static inline function treeAbOffsetY():Float
	{
		var count:Int = XMLUtils.getGlobal("tree", "height", 1);
		var boxH:Float = new TreeBox().height;
		return (boxH - count * treeAbRadius * 2) / (count + 1);
	}
	
	private static inline function wheelAbX(i:Int):Float
	{
		return -1; 
	}
	
	private static inline function wheelAbY():Float
	{
		return -1;
	}
	
	private static inline function wheelAbOffsetX():Float
	{
		return -1;
	}
	
	private static inline function wheelAbOffsetY():Float
	{
		return -1;
	}
	
}