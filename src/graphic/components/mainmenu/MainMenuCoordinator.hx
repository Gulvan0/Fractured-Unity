package graphic.components.mainmenu;

import graphic.components.abilityscreen.SAbility;
import graphic.components.mainmenu.quickbar.QuickBarItem.ItemName;
import graphic.components.mainmenu.quickbar.QuickBarItem.QuickBarStyle;
import graphic.components.mainmenu.quickbar.QuickBar;
import openfl.display.Sprite;

enum Screen
{
	Main;
	Character;
}

class MainMenuCoordinator extends Sprite
{
    private var quickBar:QuickBar;
	private var screen:Sprite;
	private var screenType:Screen;
	
	/*public static function battleStarted(data)
	{
		//deInitRoam();
		//ConnectionManager.setCommon(initBattle(common, personal));
	}*/

	/*public function battleFinished()
	{
		//removeChild(displayMap["battle"]);
		//displayMap.remove("battle");
		//ConnectionManager.updatePlayerAndReturn(initRoam);
	}*/
	
	/*private function initBattle(c:Array<UnitData>, p:Array<Ability>):Common
	{
		var common:Common = new Common(Zone.NullSpace, c, p, login);
		displayMap["battle"] = common;
		addChild(displayMap["battle"]);
		common.init();
		return common;
	}*///TODO: Move to Main, rewrite, check setCommon() usage

	public function initMain() 
	{
		screen.removeChildren();
		screen.addChild(new MainScreen((d)->{}));//TODO: Reroute to Main/Common
		screenType = Main;
	}

	private function initCharScreen() 
	{
		screen.removeChildren();
		screen.addChild(new SAbility());
		screenType = Character;
	}

    public function new()
    {
		super();
		screen = new Sprite();
        quickBar = new QuickBar(QuickBarStyle.MainScreen, [MainScreen => initMain, Character => initCharScreen]); //TODO: Exit button
        addChild(screen);
        addChild(quickBar);
	}
	
	/*private function displayPromo()
	{
		displayMap["promo"] = new PromoA23();
		displayMap["promoClose"] = new ClosePromoCross();
		displayMap["promo"].centre();
		Sounds.INFO_APPEAR.play();
		addChild(displayMap["promo"]);
		this.add(displayMap["promoClose"], displayMap["promo"].x + 426, displayMap["promo"].y + 5.5);
		stage.addEventListener(MouseEvent.CLICK, closePromo);
	}

	private function closePromo(e:MouseEvent)
	{
		if (new Point(e.stageX, e.stageY).inside(displayMap["promoClose"].getBounds(stage)))
		{
			stage.removeEventListener(MouseEvent.CLICK, closePromo);
			Sounds.CLICK.play();
			Sounds.WINDOW_CLOSE.play();
			removeChild(displayMap["promo"]);
			removeChild(displayMap["promoClose"]);
			addRoamListeners();
		}
	}*/
}