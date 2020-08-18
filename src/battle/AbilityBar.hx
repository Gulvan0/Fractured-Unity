package battle;
import openfl.geom.Point;
import io.AbilityParser;
import graphic.Shapes;
import graphic.components.HBox;
import battle.enums.AbilityType;
import battle.enums.AbilityType;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.filters.GlowFilter;
import graphic.components.battle.PatternChooseBtn;
using engine.Listeners;
using graphic.SpriteExtension;
/**
 * Vision of bottom battle bar with ability icons
 * @author Gulvan
 */
class AbilityBar extends Sprite 
{
	private var LEFT_RELATIVE_X:Float = 40;
	private var ROW_W:Float = 523;
	private var CELL_Y:Float = 666.75;
	private var Y_INTERVAL:Float = 5;
	private var ABROW_X:Float;
	private var ABROW_Y:Float;

	private var bottomBar:DisplayObject;
	private var abilitiesVision:Array<AbilityCell>;
	private var patternBtns:Array<Array<PatternChooseBtn>>;

	private var patternBtnCallbacks:Array<Array<MouseEvent->Void>>;

	private var selectFilter:Sprite;

	public function new(wheel:Array<Ability>) 
	{
		super();	
		this.patternBtnCallbacks = [for (i in 0...8) [for (j in 0...3) onPtnBtnClick.bind(i, j)]];
		bottomBar = new BottomBattleBar();
		
		var barx = (Main.screenW - bottomBar.width) / 2;
		var bary = Main.screenH - bottomBar.height;

		selectFilter = Shapes.fillOnlyRect(Assets.INNER_ABILITY_RADIUS * 2, Assets.INNER_ABILITY_RADIUS * 2, 0x00FF00, 0, 0, 0.5);
		selectFilter.mouseEnabled = false;
		var abilityRow:HBox = new HBox(Assets.FULL_ABILITY_RADIUS * 2, ROW_W);
		var btnRows:Array<HBox> = [];

		abilitiesVision = []; 
		patternBtns = [];
		
		for (i in 0...8)
		{
			abilitiesVision[i] = new AbilityCell(wheel[i], "" + (i + 1));
			abilityRow.addComponent(abilitiesVision[i]);
			patternBtns[i] = [];
			if (!wheel[i].checkEmpty() && AbilityParser.isDanmakuBasedByID(wheel[i].id))
			{
				btnRows[i] = new HBox(PatternChooseBtn.RECT_H, Assets.FULL_ABILITY_RADIUS * 2);
				for (j in 0...3)
				{
					patternBtns[i][j] = new PatternChooseBtn(j + 1);
					btnRows[i].addComponent(patternBtns[i][j]);
				}
				patternBtns[i][0].select();
			}
			else
				btnRows[i] = null;
		}

		this.add(bottomBar, barx, bary);
		ABROW_X = barx + LEFT_RELATIVE_X;
		ABROW_Y = CELL_Y;
		this.add(abilityRow, ABROW_X, ABROW_Y);

		for (i in 0...8)
			if (btnRows[i] != null)
				this.add(btnRows[i], abilityRow.x + abilitiesVision[i].x, CELL_Y + Assets.FULL_ABILITY_RADIUS * 2 + Y_INTERVAL);
	}

	public function init()
	{
		for (i in 0...8)
			if (!Lambda.empty(patternBtns[i]))
				for (j in 0...3)
					patternBtns[i][j].addEventListener(MouseEvent.CLICK, patternBtnCallbacks[i][j]);
	}

	public function terminate()
	{
		for (i in 0...8)
			if (!Lambda.empty(patternBtns[i]))
				for (j in 0...3)
					patternBtns[i][j].removeEventListener(MouseEvent.CLICK, patternBtnCallbacks[i][j]);
	}

	private function onPtnBtnClick(abPos:Int, ptnPos:Int, e):Void 
	{
		if (patternBtns[abPos][ptnPos].selected)
			return;

		for (j in 0...3)
			if (j == ptnPos)
				patternBtns[abPos][j].select();
			else 
				patternBtns[abPos][j].deselect();

		ConnectionManager.selectPattern(abilitiesVision[abPos].id, ptnPos);
	}
	
	private static var CELL_W:Float = Assets.INNER_ABILITY_RADIUS * 2;
	
	public function tick():Void 
	{
		for (a in abilitiesVision)
			a.decrementCooldown();
	}
	
	public function turn():Void 
	{
		//skipTurn.redraw(true);//TODO: [Improvements Patch] Move
	}
	
	public function abSelected(num:Int):Void 
	{
		var cell = abilitiesVision[num];
		this.add(selectFilter, cell.x + ABROW_X + Assets.ABILITY_BORDER_THICKNESS, cell.y + ABROW_Y + Assets.ABILITY_BORDER_THICKNESS);
	}
	
	public function abDeselected(num:Int):Void 
	{
		removeChild(selectFilter);
	}
	
	///SHOULD ONLY BE USED IF CASTER IS PLAYER (updates cd on ability icon)
	public function ownAbThrown(id:ID.AbilityID):Void 
	{
		for (a in abilitiesVision)
			if (a.id == id)
			{
				a.renewCooldown();
				break;
			}
		//skipTurn.redraw(false);//TODO: [Improvements Patch] Move
	}
	
	/*private function skipHandler(e:MouseEvent)
	{
		if (selectFilter != null && selectFilter.stage != null)
		{
			removeChild(selectFilter);
			selectFilter = null;
		}
		skipTurn.redraw(false);
		ConnectionManager.skipTurn();
	}
	
	private function leaveHandler(e:MouseEvent)
	{
		ConnectionManager.quit();
	}*///TODO: [Improvements Patch] Move
	
}