package;

import io.AbilityParser;
import io.DescriptionParser;
import io.DescriptionParser;
import graphic.components.mainmenu.quickbar.QuickBarItem;
import struct.Utils;
import graphic.components.mainmenu.quickbar.QuickBarItem.QuickBarStyle;
import graphic.components.mainmenu.quickbar.QuickBar;
import graphic.components.hints.AbilityHint.AbilityHintType;
import graphic.RichString;
import graphic.components.Grid;
import openfl.display.DisplayObject;
import openfl.text.TextFormatAlign;
import graphic.Fonts;
import openfl.text.TextFormat;
import graphic.components.bheditor.BHEditor;
import bh.Pattern;
import ID.AbilityID;
import openfl.display.Stage;
using graphic.SpriteExtension;

class Tests 
{
    public static function bhEditor(stage:Stage) 
    {
        var ab:AbilityID = AbilityID.LgHighVoltage;
		var pattern1:String = '[{"x": 100, "y": 100, "easing": None, "Rotation": 0}]';
		var pattern2:String = '[]';
		var p1:bh.Pattern = bh.Pattern.fromJson(ab, pattern1);
		var p2:bh.Pattern = bh.Pattern.fromJson(ab, pattern2);
		var p3:bh.Pattern = bh.Pattern.firstTimeCreate(ab);
		var editor:BHEditor = new BHEditor(ab, 1, [p1, p2, p3], (ps)->{trace(ps);});
		stage.addChild(editor);
		editor.init(Main.screenW/2, Main.screenH/2);
	}
	
	public static function gradButton(stage:Stage) 
    {
		var format:TextFormat = new TextFormat(Fonts.ERAS, 22, null, null, null, null, null, null, TextFormatAlign.CENTER);
		stage.addChild(new graphic.components.GradButton(0x333333, 2, 0xCCCCCC, 0x666666, "Push me", format, 300, 40));
	}

	public static function abilityGrid(stage:Stage) 
	{
		var sample = Assets.getBattleAbility(AbilityID.LgLightningBolt);
		var g:Grid = new Grid(5, sample.width, sample.height, 0x333333, 2);
		for (id in AbilityID.createAll())
			g.addComponent(Assets.getBattleAbility(id, true, AbilityHintType.Roaming, 1));
		g.x = 100;
		g.y = 100;
		stage.addChild(g);
	}

	public static function richString(stage:Stage) 
	{
		var source = "Hello, &FF0000[my] &(1)00FF00[dear] little &(2)0000FF[friend], there is 100 and <100>% In and &(1)FFFF00[in it there is <200>% of In as well].";
		var rs:RichString = new RichString(source, [Fonts.TAHOMA, Fonts.TREBUCHETBOLD, Fonts.ERASMEDIUM]);
		var tf = rs.format(20, 1000, 0x000000, false, TextFormatAlign.CENTER, true);
		stage.add(tf, 200, 200);
	}

	public static function descriptionReader(id:AbilityID) 
	{
		var desc = AbilityParser.abilities.get(id).description;
		trace(DescriptionParser.convertAbilityDescription(desc));
		trace(DescriptionParser.convertAbilityDescription(desc, 1));
		trace(DescriptionParser.convertAbilityDescription(desc, 2));
		trace(DescriptionParser.convertAbilityDescription(desc, 2, true));
	}

	public static function roundAbilities(stage:Stage) 
	{
		var sample = Assets.getBattleAbility(AbilityID.LgLightningBolt);
		var g:Grid = new Grid(5, sample.width, sample.height);
		for (i in 0...10)
			g.addComponent(Assets.getRoundAbility(AbilityID.createByIndex(i), true, AbilityHintType.Roaming, 1));
		g.x = 100;
		g.y = 100;
		stage.addChild(g);
	}

	public static function quickBar(stage:Stage) 
    {
		var qb:QuickBar = new QuickBar(MainScreen, [for (k in ItemName.createAll()) k => Utils.stubFunc()]);
		stage.addChild(qb);
	}
}