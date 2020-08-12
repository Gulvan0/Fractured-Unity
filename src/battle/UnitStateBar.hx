package battle;
import graphic.TextFields;
import ID.AbilityID;
import battle.Buff;
import battle.BuffRect;
import battle.enums.AbilityType;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.struct.UnitData;
import graphic.components.ProgressBar;
import haxe.ui.data.DataSource;
import motion.Actuate;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
using graphic.SpriteExtension;

/**
 * Vision of upper battle bar with textfields containing unit hp & mana values and names
 * @author Gulvan
 */
 
class UnitStateBar extends Sprite
{
	private static inline var NAME_SPACE_W:Float = 110;
	private static inline var NAME_ADDITIONAL_Y:Float = 4;
	private static inline var RECT_X_INTERVAL:Float = 6;

	private static function MAIN_Y(pos:Int):Float
	{
		if (pos == 0)
			return 47;
		else if (pos == 1)
			return 81;
		else
			return 13;
	}

	private static function NAME_X(team:Team):Float
	{
		if (team == Left)
			return 0;
		else 
			return Main.screenW - NAME_SPACE_W;
	}

	private static function BAR_X(team:Team):Float
	{
		if (team == Left)
			return NAME_SPACE_W;
		else 
			return Main.screenW - (NAME_SPACE_W + UnitDoubleBar.BAR_W);
	}

	private static function RECT_X(team:Team, num:Int):Float
	{
		var rectW = Assets.INNER_ABILITY_RADIUS * 2 * BuffRect.SCALE;
		if (team == Left)
			return NAME_SPACE_W + UnitDoubleBar.BAR_W + RECT_X_INTERVAL + num * (rectW + RECT_X_INTERVAL);
		else 
			return Main.screenW - (NAME_SPACE_W + UnitDoubleBar.BAR_W + (num + 1) * (rectW + RECT_X_INTERVAL));
	}

	private var units:UPair<UnitData>;
	
	private var upperBar:DisplayObject;
	private var names:UPair<TextField>;
	private var bars:UPair<UnitDoubleBar>;
	private var buffs:UPair<Array<BuffRect>>; //TODO: [Improvements Patch] Display auras
	private var patterns:UPair<Array<BuffRect>>; 

	public function new(units:UPair<UnitData>) 
	{
		super();
		this.units = units;
		
		upperBar = new UpperBattleBar();
		bars = units.map(u -> new UnitDoubleBar(u.hp.maxValue, u.mana.maxValue));
		names = units.map(u -> TextFields.upperBarName(u.isPlayer()? u.playerLogin() : u.name, NAME_SPACE_W));
		buffs = units.map(u -> []);
		patterns = units.map(u -> []);

		this.add(upperBar, 0, 0);
		for (unit in units)
		{
			this.add(names.getByUnit(unit), NAME_X(unit.team), MAIN_Y(unit.pos) + NAME_ADDITIONAL_Y);
			this.add(bars.getByUnit(unit), BAR_X(unit.team), MAIN_Y(unit.pos));
		}
	}
	
	public function tick(coords:UnitCoords)
	{
		var buffArray = buffs.get(coords);
		var ptnArray = patterns.get(coords);

		var shiftDirectionCoeff = coords.team == Left? 1 : -1;
		var shiftPerRect:Float = Assets.INNER_ABILITY_RADIUS * 2 * BuffRect.SCALE + RECT_X_INTERVAL;
		var totalShift:Float = 0;

		var i = 0;
		while (i < buffArray.length + ptnArray.length)
		{
			var rect = i < buffArray.length? buffArray[i] : ptnArray[i - buffArray.length];
			if (rect.tickAndIsOver())
			{
				removeChild(rect);
				if (i < buffArray.length)
					buffArray.splice(i, 1);
				else
					ptnArray.splice(i - buffArray.length, 1);
				totalShift += shiftPerRect;
			}
			else
			{
				rect.x -= totalShift * shiftDirectionCoeff;
				i++;
			}
		}
	}

	public function hpUpdate(target:UnitCoords, dhp:Int, newV:Int, element:struct.Element, crit:Bool):Void 
	{
		bars.get(target).hp = newV;
	}
	
	public function manaUpdate(target:UnitCoords, newV:Int, dmana:Int):Void 
	{
		bars.get(target).mana = newV;
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		var q = queue.copy();
		q.sort((b1, b2) -> (b1.duration - b2.duration));
		for (rect in buffs.get(unit))
			removeChild(rect);
		buffs.get(unit).splice(0,100); //emptying using assignment doesn't work somehow
			
		for (i in 0...q.length)
		{
			var rect:BuffRect = new BuffRect(RectType.Buff, q[i]);
			buffs.get(unit).push(rect);
			this.add(rect, RECT_X(unit.team, i), MAIN_Y(unit.pos));
		}
		for (i in 0...patterns.get(unit).length)
			patterns.get(unit)[i].x = RECT_X(unit.team, q.length + i);
	}

	public function addDelayedPattern(unit:UnitCoords, ability:AbilityID):Void
	{
		var rect = new BuffRect(RectType.DelayedPattern, null, ability);
		this.add(rect, RECT_X(unit.team, buffs.get(unit).length + patterns.get(unit).length), MAIN_Y(unit.pos)); 
		patterns.get(unit).push(rect);
	}

	public function flushDelayedPatterns(unit:UnitCoords):Void 
	{
		for (rect in patterns.get(unit))
			removeChild(rect);
		patterns.get(unit).splice(0,100); //emptying using assignment doesn't work somehow
	}
	
	public function death(unit:UnitCoords):Void 
	{
		removeChild(names.get(unit));
		removeChild(bars.get(unit));
		for (rect in buffs.get(unit))
			removeChild(rect);
	}
	
}