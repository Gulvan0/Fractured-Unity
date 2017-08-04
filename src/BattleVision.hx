package;
import openfl.text.TextField;
import openfl.text.TextFormat;
import utils.Element;
import data.Assets;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import utils.Team;

/**
 * [ROOT] vision OF APP IN battle
 * @author Gulvan
 */
class BattleVision extends Sprite
{

	private var bg:DisplayObject;
	private var upperBar:DisplayObject;
	private var bottomBar:DisplayObject;
	private var skipTurn:DisplayObject;
	private var leaveBattle:DisplayObject;
	
	private var alliesVision:Array<DisplayObject>;
	private var enemiesVision:Array<DisplayObject>;
	private var abilitiesVision:Array<DisplayObject>;
	
	private var allyNames:Array<TextField>;
	private var allyHPs:Array<TextField>;
	private var allyManas:Array<TextField>;
	private var enemyNames:Array<TextField>;
	private var enemyHPs:Array<TextField>;
	private var enemyManas:Array<TextField>;
	
	public function changeUnitHP(target:BattleUnit, delta:Int, element:Element)
	{
		if (target.team == Team.Left)
			allyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
		else if (target.team == Team.Right)
			enemyHPs[target.position].text = target.hpPool.value + "/" + target.hpPool.maxValue;
	}
	
	public function changeUnitMana(target:BattleUnit, delta:Int)
	{
		if (target.team == Team.Left)
			allyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
		else if (target.team == Team.Right)
			enemyManas[target.position].text = target.manaPool.value + "/" + target.manaPool.maxValue;
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, element:Element)
	{
		
	}
	
	public function init(zone:Int, allies:Array<BattleUnit>, enemies:Array<BattleUnit>) 
	{
		bg = Assets.getBattleBGByZone(zone);
		upperBar = Assets.getAssetByID("gui_battle_upper_bar");
		bottomBar = Assets.getAssetByID("gui_battle_bottom_bar");
		skipTurn = Assets.getAssetByID("gui_battle_skip_turn");
		leaveBattle = Assets.getAssetByID("gui_battle_leave_battle");
		
		alliesVision = [];
		enemiesVision = [];
		abilitiesVision = [];
		
		allyNames = [];
		allyHPs = [];
		allyManas = [];
		enemyNames = [];
		enemyHPs = [];
		enemyManas = [];
		
		for (ally in allies)
			alliesVision.push(Assets.getAssetByID(ally.id));
		for (enemy in enemies)
			enemiesVision.push(Assets.getAssetByID(enemy.id));
		for (i in 0...10)
			abilitiesVision.push(Assets.getAssetByID(allies[0].wheel.get(i).id));
			
		for (ally in allies)
		{
			addTextfield(allyNames, ally.name, "Trebuchet MS", 12);
			addTextfield(allyHPs, ally.hpPool.value + "/" + ally.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true);
			addTextfield(allyManas, ally.manaPool.value + "/" + ally.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true);
		}
		for (enemy in enemies)
		{
			addTextfield(enemyNames, enemy.name, "Trebuchet MS", 12);
			addTextfield(enemyHPs, enemy.hpPool.value + "/" + enemy.hpPool.maxValue, "Tw Cen MT Condensed", 16, 0x009900, true);
			addTextfield(enemyManas, enemy.manaPool.value + "/" + enemy.manaPool.maxValue, "Tw Cen MT Condensed", 16, 0x006699, true);
		}
			
		add(bg, -37.5, -17.5);
		add(upperBar, 4, 0);
		add(bottomBar, 4.85, 515.7);
		add(skipTurn, 766, 537);
		add(leaveBattle, 830, 537);
		
		for (i in 0...alliesVision.length)
			add(alliesVision[i], unitX(i, Team.Left), unitY(i));
		for (i in 0...enemiesVision.length)
			add(enemiesVision[i], unitX(i, Team.Right), unitY(i));
		for (i in 0...10)
			add(abilitiesVision[i], abilityX(i), 533);
			
		for (i in 0...allies.length)
		{
			add(allyNames[i], unitInfoX(Team.Left, "name"), unitInfoY(i));
			add(allyHPs[i], unitInfoX(Team.Left, "hp"), unitInfoY(i));
			add(allyManas[i], unitInfoX(Team.Left, "mana"), unitInfoY(i));
		}
		
		for (i in 0...enemies.length)
		{
			add(enemyNames[i], unitInfoX(Team.Right, "name"), unitInfoY(i));
			add(enemyHPs[i], unitInfoX(Team.Right, "hp"), unitInfoY(i));
			add(enemyManas[i], unitInfoX(Team.Right, "mana"), unitInfoY(i));
		}
		
	}
	
	public function new()
	{
		super();
	}
	
	private function addTextfield(targetArray:Array<TextField>, text:String, font:String, size:Int, color:Null<Int> = null, bold:Null<Bool> = null)
	{
		var t:TextField = new TextField();
		var format:TextFormat = new TextFormat(font, size, color, bold);
		t.text = text;
		t.setTextFormat(format);
		targetArray.push(t);
	}
	
	
	
	
	
	private static inline function abilityX(i:Int):Float
	{
		return 15 + i * 70;
	}
	
	private static inline function unitX(pos:Int, team:Team):Float
	{
		if (pos == 0)
			return (team == Team.Left)? 235 : 600;
		else if (pos == 1 || pos == 2)
			return (team == Team.Left)? 100 : 735;
		else
			return -1;
	}
	
	private static inline function unitY(pos:Int):Float
	{
		if (pos == 0)
			return 215;
		else if (pos == 1)
			return 355;
		else if (pos == 2)
			return 105;
		else
			return -1;
	}
	
	private static inline function unitInfoX(team:Team, type:String)
	{
		if (type == "name")
			return (team == Team.Left)? 3 : 564;
		else if (type == "hp")
			return (team == Team.Left)? 180 : 742;
		else if (type == "mana")
			return (team == Team.Left)? 267 : 828;
		else 
			return -1;
	}
	
	private static inline function unitInfoY(pos:Int):Float
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
	
	
	
	
	public function add(object:DisplayObject, x:Float, y:Float)
	{
		addChild(object);
		object.x = x;
		object.y = y;
	}
	
	public function remove(object:DisplayObject)
	{
		removeChild(object);
	}
	
}