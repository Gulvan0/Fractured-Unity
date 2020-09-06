package battle;
import graphic.components.abilityscreen.BHPreviewBox;
import io.KeyConverter;
import graphic.TextFields;
import openfl.text.TextField;
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
	private var CELL_Y:Float = 668;
	private var Y_INTERVAL:Float = 5;
	private var KEY_TEXT_OFFSET:Float = 20;
	private var ABROW_X:Float;
	private var ABROW_Y:Float;
	private var Y_OFFSET_DUE_TO_BORDER:Float = 2;

	private var bottomBar:DisplayObject;
	private var keyTFs:Array<TextField>;
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
		var bary = Main.screenH - bottomBar.height + Y_OFFSET_DUE_TO_BORDER;

		selectFilter = Shapes.fillOnlyRect(Assets.INNER_ABILITY_RADIUS * 2, Assets.INNER_ABILITY_RADIUS * 2, 0x00FF00, 0, 0, 0.5);
		selectFilter.mouseEnabled = false;
		var abilityRow:HBox = new HBox(Assets.FULL_ABILITY_RADIUS * 2, ROW_W);
		var btnRows:Array<HBox> = [];

		abilitiesVision = []; 
		patternBtns = [];
		
		for (i in 0...8)
		{
			var processedAbility = wheel[i];
			abilitiesVision[i] = new AbilityCell(processedAbility, "" + (i + 1));
			abilityRow.addComponent(abilitiesVision[i]);
			patternBtns[i] = [];
			if (!processedAbility.checkEmpty() && AbilityParser.isDanmakuBasedByID(processedAbility.id))
			{
				btnRows[i] = new HBox(PatternChooseBtn.RECT_H, Assets.FULL_ABILITY_RADIUS * 2);
				for (j in 0...3)
				{
					patternBtns[i][j] = new PatternChooseBtn(j + 1);
					patternBtns[i][j].buttonMode = true;
					btnRows[i].addComponent(patternBtns[i][j]);
					
					var pattern = j < processedAbility.patterns.length? processedAbility.patterns[j] : "";
					var box = new BHPreviewBox(200, 200);
					box.redraw(pattern, processedAbility.id);
					patternBtns[i][j].setHint(box);
				}
				patternBtns[i][0].select();
			}
			else
				btnRows[i] = null;
		}

		keyTFs = [];
		for (key => action in Controls.map)
			switch (action)
			{
				case UseAbility(pos):
					if (!wheel[pos].checkEmpty() && wheel[pos].isActive())
						keyTFs[pos] = TextFields.abilityKey(KeyConverter.getKeyName(key));
				default:
			}

		this.add(bottomBar, barx, bary);
		ABROW_X = barx + LEFT_RELATIVE_X;
		ABROW_Y = CELL_Y;
		this.add(abilityRow, ABROW_X, ABROW_Y);

		for (i in 0...8)
		{
			if (btnRows[i] != null)
				this.add(btnRows[i], abilityRow.x + abilitiesVision[i].x, CELL_Y + Assets.FULL_ABILITY_RADIUS * 2 + Y_INTERVAL);
			if (keyTFs[i] != null)
				this.add(keyTFs[i], abilityRow.x + abilitiesVision[i].x, CELL_Y - KEY_TEXT_OFFSET);
		}
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
				{
					patternBtns[i][j].removeEventListener(MouseEvent.CLICK, patternBtnCallbacks[i][j]);
					patternBtns[i][j].disableHint();
				}
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
	
	public function abSelected(num:Int):Void 
	{
		var cell = abilitiesVision[num];
		this.add(selectFilter, cell.x + ABROW_X + Assets.ABILITY_BORDER_THICKNESS, cell.y + ABROW_Y + Assets.ABILITY_BORDER_THICKNESS);
	}
	
	public function abDeselected():Void 
	{
		if (selectFilter.stage != null)
			removeChild(selectFilter);
	}
	
	///SHOULD ONLY BE USED AFTER PLAYER'S TURN (updates cd on ability icon)
	public function playerTurnOver(abCasted:Null<ID.AbilityID>):Void 
	{
		abDeselected();
		if (abCasted != null)
			for (a in abilitiesVision)
				if (a.id == abCasted)
				{
					a.renewCooldown();
					return;
				}
	}
	
}