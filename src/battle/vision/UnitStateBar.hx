package battle.vision;
import battle.IObservableModel;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.enums.Source;
import graphic.ProgressBar;
import motion.Actuate;
import openfl.display.DisplayObject;
import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.text.Font;
import openfl.text.FontType;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import battle.IModelObserver;
import battle.Unit;

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
 
class UnitStateBar extends SSprite implements IModelObserver 
{
	
	private var model:IObservableModel;
	
	private var upperBar:DisplayObject;
	
	private var names:UPair<TextField>;
	private var boxes:UPair<BarValuesBox>;
	private var HPbars:UPair<ProgressBar>;
	private var HPs:UPair<TextField>;
	private var manas:UPair<TextField>;
	private var manaBars:UPair<ProgressBar>;
	private var buffs:UPair<Array<BuffRect>>;
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>, model:IObservableModel) 
	{
		super();
		this.model = model;
		
		var aHPBs:Array<ProgressBar> = [for (a in allies) new ProgressBar(BARW, BARH, -1, 3)];
		var eHPBs:Array<ProgressBar> = [for (e in enemies) new ProgressBar(BARW, BARH, -1, 3)];
		var aManaBars:Array<ProgressBar> = [for (a in allies) new ProgressBar(BARW, BARH, 0x00CCFF, 3)];
		var eManaBars:Array<ProgressBar> = [for (e in enemies) new ProgressBar(BARW, BARH, 0x00CCFF, 3)];
		
		var aNames:Array<TextField> = [for (a in allies) createTF(a, TextfieldType.Name)];
		var eNames:Array<TextField> = [for (e in enemies) createTF(e, TextfieldType.Name)];
		var aHPs:Array<TextField> = [for (a in allies) createTF(a, TextfieldType.HP)];
		var eHPs:Array<TextField> = [for (e in enemies) createTF(e, TextfieldType.HP)];
		var aManas:Array<TextField> = [for (a in allies) createTF(a, TextfieldType.Mana)];
		var eManas:Array<TextField> = [for (e in enemies) createTF(e, TextfieldType.Mana)];
		
		var aBuffs:Array<Array<BuffRect>> = [for (a in allies) [for (buff in a.buffQueue.queue) new BuffRect(buff)]];
		var eBuffs:Array<Array<BuffRect>> = [for (e in enemies) [for (buff in e.buffQueue.queue) new BuffRect(buff)]];
		
		HPbars = new UPair(aHPBs, eHPBs);
		manaBars = new UPair(aManaBars, eManaBars);
		boxes = new UPair([for (a in allies) new BarValuesBox()], [for (e in enemies) new BarValuesBox()]);
		names = new UPair(aNames, eNames);
		HPs = new UPair(aHPs, eHPs);
		manas = new UPair(aManas, eManas);
		buffs = new UPair(aBuffs, eBuffs);
		
		upperBar = new UpperBattleBar();
	}
	
	public function init(pair:UPair<Unit>) 
	{
		add(upperBar, 0, 0);
		
		for (unit in pair)
		{
			add(HPbars.getByUnit(unit), BARX(unit.team), BARY(unit.position, BarType.HP));
			add(manaBars.getByUnit(unit), BARX(unit.team), BARY(unit.position, BarType.Mana));
			add(boxes.getByUnit(unit), BARBOXX(unit.team), MAINY(unit.position) - 1);
			
			add(names.getByUnit(unit), TEXTFIELDX(unit.team, TextfieldType.Name), TEXTFIELDY(unit.position, TextfieldType.Name));
			add(HPs.getByUnit(unit), TEXTFIELDX(unit.team, TextfieldType.HP), TEXTFIELDY(unit.position, TextfieldType.HP));
			add(manas.getByUnit(unit), TEXTFIELDX(unit.team, TextfieldType.Mana), TEXTFIELDY(unit.position, TextfieldType.Mana));
		}
	}
	
	private function createTF(unit:Unit, type:TextfieldType):TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat();
		switch (type)
		{
			case TextfieldType.Name:
				format.font = "Trebuchet MS";
				format.size = 12;
				format.color = 0x000000;
				t.text = unit.name;
			case TextfieldType.HP:
				format.font = "Trebuchet MS";
				format.size = 11;
				format.align = TextFormatAlign.CENTER;
				format.color = 0xffffff;
				t.width = BARBOXW;
				t.text = unit.hpPool.value + "/" + unit.hpPool.maxValue;
			case TextfieldType.Mana:
				format.font = "Trebuchet MS";
				format.size = 11;
				format.align = TextFormatAlign.CENTER;
				format.color = 0xffffff;
				t.width = BARBOXW;
				t.text = unit.manaPool.value + "/" + unit.manaPool.maxValue;
		}
		format.bold = false;
		t.selectable = false;
		t.setTextFormat(format);
		return t;
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, caster:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		HPs.getByUnit(target).text = target.hpPool.value + "/" + target.hpPool.maxValue;
		Actuate.tween(HPbars.getByUnit(target), 0.4, {progress: target.hpPool.value / target.hpPool.maxValue});
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		manas.getByUnit(target).text = target.manaPool.value + "/" + target.manaPool.maxValue;
		Actuate.tween(manaBars.getByUnit(target), 0.2, {progress: target.manaPool.value / target.manaPool.maxValue});
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		//no action
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		for (i in 0...buffs.get(unit).length)
		{
			remove(buffs.get(unit)[0]);
			buffs.get(unit).splice(0, 1);
		}
			
		for (i in 0...queue.length)
		{
			var rect:BuffRect = new BuffRect(queue[i]);
			buffs.get(unit).push(rect);
			add(rect, BUFFX(unit.team, i), MAINY(unit.pos));
		}
	}
	
	public function preTick(current:Unit):Void
	{
		//no action
	}
	
	public function tick(current:Unit):Void 
	{
		for (rect in buffs.get(UnitCoords.get(current)))
			if (rect.tickAndIsOver())
				buffQueueUpdate(UnitCoords.get(current), current.buffQueue.queue);
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		//no action1
	}
	
	public function death(unit:UnitCoords):Void 
	{
		remove(names.get(unit));
		remove(HPs.get(unit));
		remove(boxes.get(unit));
		remove(manas.get(unit));
		remove(HPbars.get(unit));
		remove(manaBars.get(unit));
	}
	
	public function abSelected(num:Int):Void 
	{
		//no action
	}
	
	public function abDeselected(num:Int):Void 
	{
		//no action
	}
	
	public function abThrown(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		model.respond();
	}
	
	public function abStriked(target:UnitCoords, caster:UnitCoords, id:ID, type:StrikeType, element:Element):Void 
	{
		model.respond();
	}
	
	public function warn(text:String):Void 
	{
		//no action
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
		var a:Float = BARBOXX(team) + BARBOXW + BUFFOFFSET * (n + 1) + BUFFW * n;
		
		return (team == Team.Left)? a : Main.screenW - a - BUFFW;
	}
	
	private static function BUFFY(pos:Int):Float
	{
		return MAINY(pos);
	}
	
}