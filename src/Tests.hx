package;

import graphic.components.bheditor.BHEditor;
import bh.Pattern;
import ID.AbilityID;
import openfl.display.Stage;

class Tests 
{
    public static function bhEditor(stage:Stage) 
    {
        var ab:AbilityID = AbilityID.LgHighVoltage;
		var patternsJson:String = '[[{"x": 100, "y": 100, "easing": None, "Rotation": 0}], [], []]';
		var p1:bh.Pattern = bh.Pattern.fromJson(ab, patternsJson, 0);
		var p2:bh.Pattern = bh.Pattern.fromJson(ab, patternsJson, 1);
		var p3:bh.Pattern = bh.Pattern.firstTimeCreate(ab);
		var editor:BHEditor = new BHEditor(ab, 1, [p1, p2, p3], (s)->{trace(s);});
		stage.addChild(editor);
		editor.init(Main.screenW/2, Main.screenH/2);
	}
	
	public static function gradButton(stage:Stage) 
    {
		var format:TextFormat = new TextFormat(Fonts.ERAS, 22, null, null, null, null, null, null, TextFormatAlign.CENTER);
		stage.addChild(new graphic.components.GradButton(0x333333, 2, 0xCCCCCC, 0x666666, "Push me", format, 300, 40));
	}
}