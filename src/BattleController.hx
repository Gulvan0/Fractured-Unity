package;
import data.*;
import openfl.display.Sprite;
import utils.DamageSource;
import utils.Element;
import utils.Team;

/**
 * [ROOT] controller OF APP IN battle
 * @author Gulvan
 */
class BattleController extends Sprite
{
	
	public static var instance:BattleController;
	
	private var model:BattleModel;
	private var vision:BattleVision;
	
	public function changeUnitHP(target:BattleUnit, caster:BattleUnit, delta:Int, element:Element, source:DamageSource)
	{
		var finalValue:Int = model.changeUnitHP(target, caster, delta, source);
		vision.changeUnitHP(target, finalValue, element);
	}
	
	public function changeUnitMana(target:BattleUnit, caster:BattleUnit, delta:Int, source:DamageSource)
	{
		var finalValue:Int = model.changeUnitMana(target, caster, delta, source);
		vision.changeUnitMana(target, finalValue);
	}
	
	public function useAbility(target:BattleUnit, caster:BattleUnit, ability:BattleAbility)
	{
		vision.useAbility(target, caster, AbilityParameters.getElementByID(ability.id));
		ability.use(target, caster);
	}
	
	public function getLeftTeam():Array<BattleUnit>
	{
		return model.getLeftTeam();
	}
	
	public function getRightTeam():Array<BattleUnit>
	{
		return model.getRightTeam();
	}
	
	public function init(zone:Int, stage:Int, allies:Array<BattleUnit>) 
	{
		var enemyIDs:Array<String> = StageEnemies.getIDsByStage(zone, stage);
		var enemies:Array<BattleUnit> = [];
		for (i in 0...enemyIDs.length)
			enemies.push(UnitConstructor.constructBotByID(enemyIDs[i], Team.Right, i));
			
		model = new BattleModel(allies, enemies);
		vision = new BattleVision();
		addChild(vision);
		vision.init(zone, allies, enemies);
	}
	
	public function new() 
	{
		super();
		instance = this;
	}
	
}