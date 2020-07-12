package graphic.components.mainmenu;

import graphic.components.mainmenu.quickbar.QuickBar;
import openfl.display.Sprite;

class MainMenuCoordinator extends Sprite
{
    private var quickBar:QuickBar;
    private var screen:Sprite;
	
	/*private function dndFinding(e)
	{
		displayMap["dndBtn"].removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/inventoryBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/abilityBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/mapBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/settingsBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/logoutBtn").removeVocalListener(MouseEvent.CLICK, 1);
		ConnectionManager.findMatch();
		displayMap["lfgwindow"] = new TextWindow(new RichString("Looking for an enemy..."));
		displayMap["lfgwindow"].centre();
		addChild(displayMap["lfgwindow"]);
	}

	private function openInventory(e)
	{
		displayMap["notImplemented"] = new TextWindow(new RichString("This feature isn't available yet"), function ()
		{
			removeChild(displayMap["notImplemented"]);
			displayMap.remove("notImplemented");
		});
		displayMap["notImplemented"].centre();
		addChild(displayMap["notImplemented"]);
	}

	private function openAbility(e)
	{
		deInitRoam();
		displayMap["abilityScreen"] = new SAbility(closeAbility, renewSAbility);
		addChild(displayMap["abilityScreen"]);
	}

	private function renewSAbility()
	{
		removeChild(displayMap["abilityScreen"]);
		displayMap["abilityScreen"] = new SAbility(closeAbility, renewSAbility);
		addChild(displayMap["abilityScreen"]);
	}

	private function closeAbility() 
	{
		removeChild(displayMap["roamingScreen"]);
		removeChild(displayMap["abilityScreen"]);
		initRoam();
	}

	private function openMap(e)
	{
		displayMap["notImplemented"] = new TextWindow(new RichString("This feature isn't available yet"), function ()
		{
			removeChild(displayMap["notImplemented"]);
			displayMap.remove("notImplemented");
		});
		displayMap["notImplemented"].centre();
		addChild(displayMap["notImplemented"]);
	}

	private function openSettings(e)
	{
		displayMap["notImplemented"] = new TextWindow(new RichString("This feature isn't available yet"), function ()
		{
			removeChild(displayMap["notImplemented"]);
			displayMap.remove("notImplemented");
		});
		displayMap["notImplemented"].centre();
		addChild(displayMap["notImplemented"]);
	}

	private function initRoam()
	{
		if (ConnectionManager.state == ConnectionManager.ClientState.NotConnected)
			return;
		
		var reader:LayoutReader = new LayoutReader("runtimeLayouts/roaming.xml");
		var scr:graphic.LayoutReader.Screen = reader.generate(["portrait" => Assets.getPlayer(player.element)]);
		displayMap = scr.map;
		cast(displayMap.get("upperBar/playerData/name"), TextField).text = login;
		cast(displayMap.get("upperBar/playerData/desc"), TextField).text = player.element.getName() + " Lvl. " + player.level;
		cast(displayMap.get("upperBar/playerData/xpbar/valueText"), TextField).text = player.xp.value + "/" + GameRules.xpToLvlup(player.level);
		cast(displayMap.get("upperBar/playerData/xpbar/progressbar"), ProgressBar).progress = player.xp.value / GameRules.xpToLvlup(player.level);
		cast(displayMap.get("upperBar/playerData/rating"), TextField).text = "Rating: " + rating;
		cast(displayMap.get("upperBar/progressData/zonetext"), TextField).text = progress.getZoneName();
		cast(displayMap.get("upperBar/progressData/stagetext"), TextField).text = "Stage " + (progress.getStage() + 1);
		cast(displayMap.get("upperBar/progressData/progressbar"), ProgressBar).progress = progress.getStage() / progress.getCurrentMaxStageCount();
		
		displayMap["roamingScreen"] = scr.cont;
		addChild(displayMap["roamingScreen"]);
		if (FileSystem.exists(Main.exePath() + "updated.bool"))
		{
			FileSystem.deleteFile(Main.exePath() + "updated.bool");
			//displayPromo();
		}
		//else
			addRoamListeners();
	}

	private function deInitRoam()
	{
		displayMap.get("exitBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("dndBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/inventoryBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/abilityBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/mapBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/settingsBtn").removeVocalListener(MouseEvent.CLICK, 1);
		displayMap.get("upperBar/logoutBtn").removeVocalListener(MouseEvent.CLICK, 1);
	}
	
	private function initBattle(c:Array<UnitData>, p:Array<Ability>):Common
	{
		var common:Common = new Common(Zone.NullSpace, c, p, login);
		displayMap["battle"] = common;
		addChild(displayMap["battle"]);
		common.init();
		return common;
	}

	private function addRoamListeners()
	{
		displayMap.get("exitBtn").addVocalListener(MouseEvent.CLICK, exit, 1);
		displayMap.get("dndBtn").addVocalListener(MouseEvent.CLICK, dndFinding, 1);
		displayMap.get("upperBar/inventoryBtn").addVocalListener(MouseEvent.CLICK, openInventory, 1);
		displayMap.get("upperBar/abilityBtn").addVocalListener(MouseEvent.CLICK, openAbility, 1);
		displayMap.get("upperBar/mapBtn").addVocalListener(MouseEvent.CLICK, openMap, 1);
		displayMap.get("upperBar/settingsBtn").addVocalListener(MouseEvent.CLICK, openSettings, 1);
		displayMap.get("upperBar/logoutBtn").addVocalListener(MouseEvent.CLICK, logout, 1);
	}*/

	private function initMain() 
	{
		
	}

    public function new()
    {
		super();
		screen = new Sprite();
        //TODO: Fill
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