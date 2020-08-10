package battle;
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
enum TextfieldType 
{
	Name;
	HP;
	Mana;
}

enum BarType 
{
	HP;
	Mana;
}
 
class UnitStateBar extends Sprite
{
	
	private var units:UPair<UnitData>;
	
	private var upperBar:DisplayObject;
	private var names:UPair<TextField>;
	private var bars:UPair<UnitDoubleBar>;
	private var buffs:UPair<Array<BuffRect>>; //TODO: Display auras
	private var patterns:UPair<Array<BuffRect>>; 
	
	//TODO: Refactor (using UPair) and maybe rewrite some parts of the class

	public function new(units:UPair<UnitData>) 
	{
		super();
		this.units = units;
		
		upperBar = new UpperBattleBar();
		bars = units.map(u -> new UnitDoubleBar(u.hp.maxValue, u.mana.maxValue));
		names = units.map(u -> createTF(u, TextfieldType.Name));
		buffs = units.map(u -> []);
		patterns = units.map(u -> []);

		this.add(upperBar, 0, 0);
		for (unit in units)
		{
			//TODO: add everything
		}
	}
	
	private function createTF(unit:UnitData, type:TextfieldType):TextField //TODO: Change format
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat();
		switch (type)
		{
			case TextfieldType.Name:
				format.font = "Trebuchet MS";
				format.size = 12;
				format.color = 0x000000;
				t.text = unit.isPlayer()? unit.playerLogin() : unit.name;
			case TextfieldType.HP:
				format.font = "Trebuchet MS";
				format.size = 11;
				format.align = TextFormatAlign.CENTER;
				format.color = 0xffffff;
				t.width = BARBOXW;
				t.text = unit.hp.value + "/" + unit.hp.maxValue;
			case TextfieldType.Mana:
				format.font = "Trebuchet MS";
				format.size = 11;
				format.align = TextFormatAlign.CENTER;
				format.color = 0xffffff;
				t.width = BARBOXW;
				t.text = unit.mana.value + "/" + unit.mana.maxValue;
		}
		format.bold = false;
		t.selectable = false;
		t.setTextFormat(format);
		return t;
	}
	//TODO: Tick
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
		buffs.get(unit).splice(0,100);
			
		for (i in 0...q.length)
		{
			var rect:BuffRect = new BuffRect(RectType.Buff, q[i]);
			buffs.get(unit).push(rect);
			this.add(rect, BUFFX(unit.team, i), MAINY(unit.pos));
		}
		for (i in 0...patterns.get(unit).length)
			patterns.get(unit)[i].x = BUFFX(unit.team, q.length + i);
	}

	public function addDelayedPattern(unit:UnitCoords, ability:AbilityID):Void 
	{
		var rect = new BuffRect(RectType.DelayedPattern, null, ability);
		this.add(rect, BUFFX(unit.team, buffs.get(unit).length + patterns.get(unit).length), MAINY(unit.pos)); 
		patterns.get(unit).push(rect);
	}

	public function flushDelayedPatterns(unit:UnitCoords):Void 
	{
		for (rect in patterns.get(unit))
			removeChild(rect);
		patterns.get(unit).splice(0,100);
	}
	
	public function death(unit:UnitCoords):Void 
	{
		removeChild(names.get(unit));
		removeChild(bars.get(unit));
		for (rect in buffs.get(unit))
			removeChild(rect);
	}
	
	//-------------------------------------------------------------------------------------------------------------
	
	private static inline var XMAINOFFSET:Float = 3;
	
	private static inline var BARW:Float = 200;
	private static inline var BARH:Float = 14;
	private static inline var BARBOXW:Float = 71;
	private static inline var BARBOXH:Float = BARH * 2;
	private static inline var BUFFW:Float = 18;
	private static inline var BUFFH:Float = 30;
	private static inline var BUFFOFFSET:Float = 6;
	private static inline var SPACEX:Float = 622;
	private static inline var SPACEY:Float = 36;
	private static inline var SPACEW:Float = 118;
	private static inline var SPACEH:Float = 60;
	private static inline var TIMEH:Float = 36;
	
	private static function MAINY(pos:Int):Float
	{
		return switch (pos)
		{
			case 0: 43;
			case 1: 80;
			case 2: 6;
			default: -1;
		}
	}
	
	private static function BARX(team:Team):Float
	{
		return (team == Team.Left)? XMAINOFFSET : Main.screenW - XMAINOFFSET - BARW;
	}
	
	private static function BARBOXX(team:Team):Float
	{
		var a:Float = BARX(Team.Left) + BARW + 2;
		return (team == Team.Left)? a : Main.screenW - a - BARBOXW;
	}
	
	private static function TEXTFIELDX(team:Team, type:TextfieldType):Float
	{
		return switch (type)
		{
			case TextfieldType.Name: BARX(team);
			case TextfieldType.HP: BARBOXX(team);
			case TextfieldType.Mana: BARBOXX(team);
		}
	}
	
	private static function TEXTFIELDY(pos:Int, type:TextfieldType):Float
	{
		return ((type == TextfieldType.Mana)? BARH : 0) + MAINY(pos) - ((type == TextfieldType.Name)? 1 : 0);
	}
	
	private static function TEXTFIELDW(type:TextfieldType):Float
	{
		return (type == TextfieldType.Name)? BARW : BARBOXW;
	}
	
	private static function BARY(pos:Int, type:BarType):Float
	{
		return ((type == BarType.Mana)? BARH : 0) + MAINY(pos);
	}
	
	private static function BUFFX(team:Team, n:Int):Float
	{
		var prevLen:Float = (BUFFOFFSET + BUFFW) * n;
		return BARBOXX(team) + (team == Team.Left? BARBOXW + BUFFOFFSET + prevLen : -prevLen - BUFFW) - 3;
	}
	
	private static function BUFFY(pos:Int):Float
	{
		return MAINY(pos) + 2;
	}
	
}