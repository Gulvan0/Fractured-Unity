package battle.vision;
import battle.IObservableModel;
import battle.enums.AbilityType;
import battle.Buff;
import battle.enums.StrikeType;
import battle.enums.Team;
import battle.struct.UPair;
import battle.struct.UnitCoords;
import battle.enums.Source;
import openfl.display.DisplayObject;
import openfl.text.TextField;
import openfl.text.TextFormat;

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
 
class UnitStateBar extends SSprite implements IModelObserver 
{
	
	public static var xPos:Float = 0;
	public static var yPos:Float = 0;
	
	private var model:IObservableModel;
	
	private var upperBar:DisplayObject;
	
	private var names:UPair<TextField>;
	private var HPs:UPair<TextField>;
	private var manas:UPair<TextField>;
	
	public function new(allies:Array<Unit>, enemies:Array<Unit>, model:IObservableModel) 
	{
		super();
		this.model = model;
		
		var aNames:Array<TextField> = [for (a in allies) createTF(a.name, "Trebuchet MS", 12)];
		var eNames:Array<TextField> = [for (e in enemies) createTF(e.name, "Trebuchet MS", 12)];
		var aHPs:Array<TextField> = [for (a in allies) createTF(a.hpPool.value + "/" + a.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true)];
		var eHPs:Array<TextField> = [for (e in enemies) createTF(e.hpPool.value + "/" + e.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true)];
		var aManas:Array<TextField> = [for (a in allies) createTF(a.manaPool.value + "/" + a.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true)];
		var eManas:Array<TextField> = [for (e in enemies) createTF(e.manaPool.value + "/" + e.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true)];
		
		names = new UPair(aNames, eNames);
		HPs = new UPair(aHPs, eHPs);
		manas = new UPair(aManas, eManas);
		upperBar = new UpperBattleBar();
	}
	
	public function init(pair:UPair<Unit>) 
	{
		add(upperBar, 4, 0);
		
		for (unit in pair)
		{
			addTFs(names, unit, TextfieldType.Name);
			addTFs(HPs, unit, TextfieldType.HP);
			addTFs(manas, unit, TextfieldType.Mana);
		}
	}
	
	private function createTF(text:String, font:String, size:Int, ?color:Null<Int>, ?bold:Null<Bool>):TextField
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color, bold);
		t.text = text;
		t.setTextFormat(format);
		return t;
	}
	
	private function addTFs(pair:UPair<TextField>, unit:Unit, type:TextfieldType)
	{
		add(pair.getByUnit(unit), textfieldX(unit.team, type), textfieldY(unit.position));
	}
	
	private static inline function textfieldX(team:Team, type:TextfieldType)
	{
		if (type == TextfieldType.Name)
			return (team == Team.Left)? 3 : 564;
		else if (type == TextfieldType.HP)
			return (team == Team.Left)? 180 : 742;
		else if (type == TextfieldType.Mana)
			return (team == Team.Left)? 267 : 828;
		else 
			return -1;
	}
	
	private static inline function textfieldY(pos:Int):Float
	{
		if (pos == 0)
			return 28;
		else if (pos == 1)
			return 53;
		else if (pos == 2)
			return 4;
		else
			return -1;
	}
	
	/* INTERFACE battle.IModelObserver */
	
	public function hpUpdate(target:Unit, dhp:Int, element:Element, crit:Bool, source:Source):Void 
	{
		HPs.getByUnit(target).text = target.hpPool.value + "/" + target.hpPool.maxValue;
	}
	
	public function manaUpdate(target:Unit, dmana:Int, source:Source):Void 
	{
		manas.getByUnit(target).text = target.manaPool.value + "/" + target.manaPool.maxValue;
	}
	
	public function alacUpdate(unit:Unit, dalac:Float, source:Source):Void 
	{
		//no action
	}
	
	public function buffQueueUpdate(unit:UnitCoords, queue:Array<Buff>):Void 
	{
		//Updating buff icons
	}
	
	public function tick(current:Unit):Void 
	{
		//Updating buff durations
	}
	
	public function miss(target:UnitCoords, element:Element):Void 
	{
		//no action
	}
	
	public function death(unit:UnitCoords):Void 
	{
		remove(names.get(unit));
		remove(HPs.get(unit));
		remove(manas.get(unit));
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
	
}