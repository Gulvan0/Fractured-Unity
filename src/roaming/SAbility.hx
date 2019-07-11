package roaming;

import openfl.events.Event;
import hxassert.Assert;
import lime.math.Rectangle;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import Player;
import roaming.Tree;
import roaming.Unit;
import roaming.components.AttributeContainer;
import roaming.components.PointsAndRespec;
import roaming.components.TreeContainer;
import roaming.components.WheelContainer;
using MathUtils;

/**
 * Ability screen. Contains ability tree, ability wheel and attribute box
 * @author Gulvan
 */
class SAbility extends SSprite
{
	public static var ABILITY_RADIUS:Float = 23;

	private var treeContainer:TreeContainer;
	private var wheelContainer:WheelContainer;
	private var attribContainer:AttributeContainer;
	private var parContainer:PointsAndRespec;
	private var closeButton:CloseAbScreen;

	private var onClose:Void->Void;
	
	public function new(onClose:Void->Void) 
	{
		super();
		this.onClose = onClose;

		treeContainer = new TreeContainer();
		wheelContainer = new WheelContainer();
		attribContainer = new AttributeContainer();
		parContainer = new PointsAndRespec();
		closeButton = new CloseAbScreen();
		
		add(new AbilityScreenBG(), 0, 0);
		//add everything
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	public function init(e)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		//Add event listeners
	}

	public function deInit()
	{
		//Remove event listeners
	}

	public function clickHandler(e:MouseEvent) 
	{
		if (new Point(e.localX, e.localY).inside(closeButton.getBounds(this)))
		{
			deInit();
			onClose();
			return;
		}
	}
	
}