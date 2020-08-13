package graphic.components.abilityscreen;

import haxe.ui.containers.menus.Menu;
import bh.Pattern;
import io.AbilityParser;
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
import struct.Attribute;
import graphic.components.abilityscreen.AttributeContainer;
import graphic.components.abilityscreen.PointsAndRespec;
import graphic.components.abilityscreen.TreeContainer;
import graphic.components.abilityscreen.WheelContainer;
import ID.AbilityID;
using engine.MathUtils;
using graphic.SpriteExtension;

/**
 * Ability screen. Contains ability tree, ability wheel and attribute box
 * @author Gulvan
 */
class SAbility extends Sprite
{
	private var treeContainer:TreeContainer;//TODO: [Improvements Patch] Add the low-level better-fill-the-wheel warning
	private var wheelContainer:WheelContainer;
	private var attribContainer:AttributeContainer;
	private var parContainer:PointsAndRespec;
	private var bhPreview:BHPreview;
	private var bhEditor:BHEditor;
	private var warnField:TextField;
	private var warnTimer:Timer;
	private var menu:Menu;

	private var dragging:Null<AbilityID>;
	private var dragIcon:Sprite;

	private var hideQuickBar:Void->Void;
	private var showQuickBar:Void->Void;
	
	public function new(hideQuickBar:Void->Void, showQuickBar:Void->Void) 
	{
		super();
		dragging = null;
		this.hideQuickBar = hideQuickBar;
		this.showQuickBar = showQuickBar;

		treeContainer = new TreeContainer();
		wheelContainer = new WheelContainer();
		attribContainer = new AttributeContainer();
		parContainer = new PointsAndRespec();
		bhPreview = new BHPreview(this);

		warnField = TextFields.editorWarning("");
		warnField.visible = false;

		this.add(new AbilityScreenBG(), 0, 0);
		this.add(parContainer, 0, 0);
		this.add(attribContainer, 1064, 127);
		this.add(wheelContainer, 690, 220);
		this.add(treeContainer, 28, 51);
		this.add(bhPreview, 0, 0);
		this.add(warnField, 0, 44);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(?e)
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
			removeEventListener(Event.ADDED_TO_STAGE, init);
		stage.addEventListener(MouseEvent.CLICK, clickHandler);
		stage.addEventListener(MouseEvent.RIGHT_CLICK, rightClickHandler);
		addEventListener(Event.REMOVED_FROM_STAGE, deInit);
	}

	private function deInit(?e)
	{
		if (hasEventListener(Event.REMOVED_FROM_STAGE))
			removeEventListener(Event.REMOVED_FROM_STAGE, deInit);
		stage.removeEventListener(MouseEvent.CLICK, clickHandler);
		stage.removeEventListener(MouseEvent.RIGHT_CLICK, rightClickHandler);
	}

	public function initEditor(ability:AbilityID, selectedPattern:Int)
	{
		deInit();
		var level:Int = AbilityParser.getLevel(ability);
		var patterns:Array<Pattern> = [];

		function startEditor()
		{
			bhEditor = new BHEditor(ability, level, selectedPattern, patterns, onEditorClosed.bind(ability));
			removeChild(bhPreview);
			hideQuickBar();
			this.add(bhEditor, 0, 0);
			bhEditor.init(650, 400);
		}

		function getPattern(nextPtnPos:Int, curPattern:String) 
		{
			if (nextPtnPos > 0)
				patterns.push(Pattern.fromJson(ability, curPattern));
			if (nextPtnPos == 3)
				startEditor();
			else
				ConnectionManager.getPattern(ability, nextPtnPos, getPattern.bind(nextPtnPos+1));
		}

		getPattern(0, "");
	}

	private function onEditorClosed(editedAbility:AbilityID, s:Null<Array<String>>)
	{
		removeChild(bhEditor);
		bhPreview = new BHPreview(this);
		bhPreview.changeAbility(editedAbility);
		this.add(bhPreview, 0, 0);
		showQuickBar();
		init();
	}

	public function clickHandler(e:MouseEvent) 
	{
		if (menu != null)
			if (e.stageX < menu.x || e.stageX > menu.x + menu.width || e.stageY < menu.y || e.stageY > menu.y + menu.height)
			{
				Screen.instance.removeComponent(menu);
				menu = null;
			}
		if (inside(e.stageX, e.stageY, treeContainer))
		{
			//Start dragging (null) or change dragging (not-null)
			var p:Null<TreePos> = treeContainer.identifyAbility(e.stageX, e.stageY);
			if (p != null)
			{
				Sounds.CLICK.play();
				if (Main.player.character.tree[p.i][p.j] > 0)
					drag(AbilityParser.getIDUsingPlayer(p)); 
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
					ConnectionManager.updateData(()->{});
					if (wheelContainer.has(dragging))
						wheelContainer.redrawWheelAb(wheelContainer.indexOf(dragging), AbilityID.EmptyAbility);
					wheelContainer.redrawWheelAb(i, dragging);
					stopDragging();
				}
				else if (wheelContainer.visionWheel[i] != AbilityID.EmptyAbility)
				{
					ConnectionManager.removeAbility(i);
					ConnectionManager.updateData(()->{});
					drag(wheelContainer.visionWheel[i]);
					wheelContainer.redrawWheelAb(i, AbilityID.EmptyAbility);
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
						ConnectionManager.updateData(()->{});
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
		if (menu != null)
			if (e.stageX < menu.x || e.stageX > menu.x + menu.width || e.stageY < menu.y || e.stageY > menu.y + menu.height)
			{
				Screen.instance.removeComponent(menu);
				menu = null;
			}
		//Show actions
		if (inside(e.stageX, e.stageY, treeContainer))
		{
			var p:Null<TreePos> = treeContainer.identifyAbility(e.stageX, e.stageY);
			if (p != null)
			{
				Sounds.CLICK.play();
				showTreeContext(e.stageX, e.stageY, p);
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

	public function showTreeContext(stageX:Float, stageY:Float, pos:TreePos)
	{
		showContextMenu(stageX, stageY, "Tree", function(e:MenuEvent) {
            if (e.menuItem.text == "Learn")
				if (!parContainer.hasABP())
					warn("Not enough ability points");
				else if (!AbilityParser.canLearn(pos))
					warn("You must learn the required abilities first");
				else if (AbilityParser.isMaxedOut(pos))
					warn("This ability is maxed out, you can't learn it further");
				else
					learn(pos.i, pos.j);
			else if (e.menuItem.text == "Edit Patterns")
				if (!AbilityParser.isDanmakuBased(pos))           
					warn("This ability isn't particle-based");
				else
					editPattern(AbilityParser.getIDUsingPlayer(pos));
			else
				trace("Warning: menu item not found. " + e.menuItem.text);
        });
	}

	public function showWheelContext(stageX:Float, stageY:Float, i:Int)
	{
		var id = wheelContainer.visionWheel[i];
		showContextMenu(stageX, stageY, "Wheel", function(e:MenuEvent) {
            if (e.menuItem.text == "Unequip")
				removeFromWheel(i);
			else if (e.menuItem.text == "Edit Patterns")
				if (AbilityParser.abilities.get(id).danmakuProps == null)           
					warn("This ability isn't particle-based");
				else
					editPattern(id);
			else
				trace("Warning: menu item not found. " + e.menuItem.text);
        });
	}

	private function showContextMenu(stageX:Float, stageY:Float, type:String, handler:MenuEvent->Void)
	{
		if (type == "Tree")
			menu = ComponentMacros.buildComponent("assets/layouts/TreeContextMenu.xml");
		else if (type == "Wheel")
			menu = ComponentMacros.buildComponent("assets/layouts/WheelContextMenu.xml");
		else
			throw "Unknown type in SAbility.showContextMenu: " + type;

        menu.left = stageX;
        menu.top = stageY;
        menu.registerEvent(MenuEvent.MENU_SELECTED, handler);
		Screen.instance.addComponent(menu);
	}

	public function learn(i:Int, j:Int)
	{
		ConnectionManager.learnAbility(i, j);
		treeContainer.redrawAbility(i, j, Main.player.character.tree[i][j]+1);
		ConnectionManager.updateData(()->{});
		parContainer.decrementAbp();
	}

	public function editPattern(id:AbilityID)
	{
		bhPreview.changeAbility(id);
	}

	public function removeFromWheel(i:Int)
	{
		ConnectionManager.removeAbility(i);
		ConnectionManager.updateData(()->{});
		wheelContainer.redrawWheelAb(i, AbilityID.EmptyAbility);
	}

	private function respec()
	{
		ConnectionManager.respec(function () {
			totalUpdate();
			init();
		});
		deInit();
	}

	private function totalUpdate()
	{
		treeContainer.redraw();
		wheelContainer.redraw();
		attribContainer.updateValues();
		parContainer.updateValues();
	}

	private function warn(text:String)
	{
		if (warnField.visible)
			warnTimer.stop();
		warnField.text = text;
		warnField.visible = true;
		warnTimer = new Timer(3000);
		warnTimer.run = function() {warnField.visible = false; warnTimer.stop();}
	}

	private function drag(id:AbilityID)
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
	}

	private function inside(ex:Float, ey:Float, member:DisplayObject):Bool
	{
		return new Point(ex, ey).inside(member.getBounds(stage));
	}
}