package graphic.components.abilityscreen;

import haxe.ui.core.Screen;
import haxe.ui.containers.menus.Menu.MenuEvent;
import haxe.ui.macros.ComponentMacros;
import graphic.components.bheditor.BHEditor;
import openfl.text.TextFormatAlign;
import haxe.Timer;
import graphic.components.abilityscreen.WheelContainer;
import graphic.Sounds;
import openfl.display.DisplayObject;
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
import graphic.components.abilityscreen.AttributeContainer;
import graphic.components.abilityscreen.PointsAndRespec;
import graphic.components.abilityscreen.TreeContainer;
import graphic.components.abilityscreen.WheelContainer;
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
	private var bhPreview:BHPreview;
	private var bhEditor:BHEditor;
	private var closeButton:CloseAbScreen;
	private var warnField:TextField;

	private var onClose:Void->Void;
	private var onUpdate:Void->Void;

	private var dragging:Null<ID>;
	private var dragIcon:Sprite;
	
	public function new(onClose:Void->Void, onUpdate:Void->Void) 
	{
		super();
		this.onClose = onClose;
		this.onUpdate = onUpdate;
		dragging = null;

		treeContainer = new TreeContainer();
		wheelContainer = new WheelContainer();
		attribContainer = new AttributeContainer();
		parContainer = new PointsAndRespec();
		bhPreview = new BHPreview(this);
		closeButton = new CloseAbScreen();

		var format:TextFormat = new TextFormat();
		format.size = 28;
		format.bold = true;
		format.color = 0xD50010;
		format.align = TextFormatAlign.CENTER;
		warnField = new TextField();
		warnField.width = Main.screenW;
		warnField.visible = false;
		warnField.selectable = false;
		warnField.setTextFormat(format);

		add(new AbilityScreenBG(), 0, 0);
		add(parContainer, 0, 0);
		add(attribContainer, 1064, 108);
		add(wheelContainer, 690, 176);
		add(treeContainer, 28, 28);
		add(closeButton, 1324, 33);
		add(bhPreview, 0, 0);
		add(warnField, 0, 0);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	public function init(e)
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
			removeEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(MouseEvent.CLICK, clickHandler);
		addEventListener(MouseEvent.RIGHT_CLICK, rightClickHandler);
		treeContainer.init();
		wheelContainer.init();
	}

	public function deInit()
	{
		removeEventListener(MouseEvent.CLICK, clickHandler);
		removeEventListener(MouseEvent.RIGHT_CLICK, rightClickHandler);
		treeContainer.deInit();
		wheelContainer.deInit();
	}

	public function initEditor(ability:ID, selectedPattern:Int)
	{
		deInit();
		ConnectionManager.getBHPatternsByID(ability, function (patterns:Xml) {
			remove(bhPreview);
			bhEditor = new BHEditor(ability, selectedPattern, Omniscient.particleCount(ability), patterns, onEditorClosed.bind(ability));
			add(bhEditor, 0, 0);
			bhEditor.init(650, 400);
		});
	}

	private function onEditorClosed(editedAbility:ID, s:Null<String>)
	{
		remove(bhEditor);
		bhPreview = new BHPreview(this);
		bhPreview.changeAbility(editedAbility);
		add(bhPreview, 0, 0);
		init(null);
	}

	public function clickHandler(e:MouseEvent) 
	{
		if (inside(e.stageX, e.stageY, closeButton))
		{
			Sounds.CLICK.play();
			deInit();
			ConnectionManager.updatePlayerAndReturn(onClose);
			return;
		}
		else if (inside(e.stageX, e.stageY, treeContainer))
		{
			//Start dragging (null) or change dragging (not-null)
			var p:Null<Point> = treeContainer.identifyAbility(e.stageX, e.stageY);
			if (p != null)
			{
				Sounds.CLICK.play();
				if (treeContainer.levels[cast p.x][cast p.y] > 0)
					drag(Main.player.tree.get(cast p.x, cast p.y).id); //Assuming trees are constant
				else
					warn("You haven't learned this ability yet. To learn the ability, right-click on it");
			}
			else if (dragging != null)
				stopDragging();
		}
		else if (inside(e.stageX, e.stageY, wheelContainer))
		{
			//Remove and start dragging (null) or replace with dragged (not-null)
			var i:Null<Int> = wheelContainer.identifyAbility(e.stageX, e.stageY);
			if (i != null)
			{
				Sounds.CLICK.play();
				if (dragging != null)
				{
					ConnectionManager.putAbility(dragging, i);
					if (wheelContainer.has(dragging))
						wheelContainer.redrawWheelAb(wheelContainer.indexOf(dragging), ID.EmptyAbility);
					wheelContainer.redrawWheelAb(i, dragging);
					stopDragging();
				}
				else if (wheelContainer.visionWheel[i] != ID.EmptyAbility)
				{
					ConnectionManager.removeAbility(i);
					drag(wheelContainer.visionWheel[i]);
					wheelContainer.redrawWheelAb(i, ID.EmptyAbility);
				}
			}
			else if (dragging != null)
				stopDragging();
		}
		else if (inside(e.stageX, e.stageY, attribContainer))
		{
			//Check(identify) and Add attributes (null) or stopdragging (not-null)
			if (dragging != null)
				stopDragging();
			else
			{
				var att:Null<Attribute> = attribContainer.identifyAttribute(e.stageX, e.stageY);
				if (att != null)
				{
					Sounds.CLICK.play();
					if (parContainer.hasATTP())
					{
						ConnectionManager.incrementAttribute(att);
						attribContainer.incrementAttribute(att);
						parContainer.decrementAttp();
					}
					else
						warn("Not enough attribute points");
				}
			}
		}
		else if (parContainer.isRespecButton(e.stageX, e.stageY))
		{
			//Respec (null) or stopdragging (not-null)
			Sounds.CLICK.play();
			if (dragging != null)
				stopDragging();
			else
				respec();
		}
		else if (dragging != null)
			stopDragging();
	}

	public function rightClickHandler(e:MouseEvent) 
	{
		//Show actions
		if (inside(e.stageX, e.stageY, treeContainer))
		{
			var p:Null<Point> = treeContainer.identifyAbility(e.stageX, e.stageY);
			if (p != null)
			{
				Sounds.CLICK.play();
				showTreeContext(e.stageX, e.stageY, cast p.x, cast p.y);
			}
		}
		else if (inside(e.stageX, e.stageY, wheelContainer))
		{
			var i:Null<Int> = wheelContainer.identifyAbility(e.stageX, e.stageY);
			if (i != null)
			{
				Sounds.CLICK.play();
				showWheelContext(e.stageX, e.stageY, i);
			}
		}
		else if (dragging != null)
			stopDragging();
	}

	public function showTreeContext(stageX:Float, stageY:Float, i:Int, j:Int)
	{
		showContextMenu(stageX, stageY, "Tree", function(e:MenuEvent) {
            if (e.menuItem.text == "Learn")
				if (!parContainer.hasABP())
					warn("Not enough ability points");
				else if (!treeContainer.meetsRequirements(i, j))
					warn("You must learn the required abilities first");
				else if (treeContainer.isMaxedOut(i, j))
					warn("This ability is maxed out, you can't learn it further");
				else
					learn(i, j);
			else if (e.menuItem.text == "Edit Patterns")
				if (!Omniscient.isAbilityBH(Main.player.tree.get(i, j).id))
					warn("This ability isn't particle-based");
				else
					editPattern(Main.player.tree.get(i, j).id);
			else
				trace("Warning: menu item not found. " + e.menuItem.text);
        });
	}

	public function showWheelContext(stageX:Float, stageY:Float, i:Int)
	{
		showContextMenu(stageX, stageY, "Wheel", function(e:MenuEvent) {
            if (e.menuItem.text == "Unequip")
				removeFromWheel(i);
			else if (e.menuItem.text == "Edit Patterns")
				if (!Omniscient.isAbilityBH(wheelContainer.visionWheel[i]))
					warn("This ability isn't particle-based");
				else
					editPattern(wheelContainer.visionWheel[i]);
			else
				trace("Warning: menu item not found. " + e.menuItem.text);
        });
	}

	private function showContextMenu(stageX:Float, stageY:Float, type:String, handler:MenuEvent->Void)
	{
		var menu;
		if (type == "Tree")
			menu = ComponentMacros.buildComponent("assets/layouts/TreeContextMenu.xml");
		else if (type == "Wheel")
			menu = ComponentMacros.buildComponent("assets/layouts/WheelContextMenu.xml");
		else
			throw "Unknown type in SAbility.showContextMenu: " + type;

        menu.left = stageX;
        menu.top = stageY;
        menu.registerEvent(MenuEvent.MENU_SELECTED, handler);

		var focusLostHandler:haxe.ui.events.MouseEvent->Void;
		focusLostHandler = function(e:haxe.ui.events.MouseEvent) {
			if(e.screenX < menu.left || e.screenX > menu.left + menu.width || e.screenY < menu.top || e.screenY > menu.top + menu.height)
			{
				Screen.instance.removeComponent(menu);
				Screen.instance.unregisterEvent(haxe.ui.events.MouseEvent.CLICK, focusLostHandler);
				Screen.instance.unregisterEvent(haxe.ui.events.MouseEvent.RIGHT_CLICK, focusLostHandler);
			}
		};
		Screen.instance.registerEvent(haxe.ui.events.MouseEvent.CLICK, focusLostHandler);
		Screen.instance.registerEvent(haxe.ui.events.MouseEvent.RIGHT_CLICK, focusLostHandler);
        Screen.instance.addComponent(menu);
	}

	public function learn(i:Int, j:Int)
	{
		ConnectionManager.learnAbility(i, j);
		var l = [for (a in treeContainer.levels) a.copy()];
		l[i][j]++;
		treeContainer.redraw(l);
		parContainer.decrementAbp();
		treeContainer.updateHint();
	}

	public function editPattern(id:ID)
	{
		bhPreview.changeAbility(id);
	}

	public function removeFromWheel(i:Int)
	{
		ConnectionManager.removeAbility(i);
		wheelContainer.redrawWheelAb(i, ID.EmptyAbility);
	}

	private function respec()
	{
		ConnectionManager.respec(onUpdate);
		deInit();
	}

	private function warn(text:String)
	{
		warnField.text = text;
		warnField.visible = true;
		var timer = new Timer(3000);
		timer.run = function() {warnField.visible = false; timer.stop();}
	}

	private function drag(id:ID)
	{
		treeContainer.disableHint();
		wheelContainer.disableHint();
		if (dragging != null)
			stopDragging();
		dragIcon = Assets.getRoundAbility(id);
		addChild(dragIcon);
		dragIcon.startDrag(true);
		dragging = id;
	}

	private function stopDragging()
	{
		dragIcon.stopDrag();
		removeChild(dragIcon);
		dragging = null;
		treeContainer.enableHint();
		wheelContainer.enableHint();
	}

	private function inside(ex:Float, ey:Float, member:DisplayObject):Bool
	{
		return new Point(ex, ey).inside(member.getBounds(stage));
	}
}