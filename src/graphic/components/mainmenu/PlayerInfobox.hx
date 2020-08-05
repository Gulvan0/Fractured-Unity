package graphic.components.mainmenu;

import graphic.Shapes.LineStyle;
import struct.Element;
import openfl.display.Sprite;

typedef ClassRecord = {element:Element, wins:Int, losses:Int}

class PlayerInfobox 
{
    public static var INFOBOX_WIDTH:Int = 340;
    public static var INFOBOX_HEIGHT:Int = 470;

    public static function unranked():Sprite
    {
        var s:Sprite = new Sprite();
        var box:VBox = new VBox(INFOBOX_WIDTH, INFOBOX_HEIGHT);

        s.addChild(bgBox());
        s.addChild(box);
        return s;
    }
    
    public static function ranked(name:String, rating:Int, record:Array<ClassRecord>):Sprite
    {
        var s:Sprite = new Sprite();
        var box:VBox = new VBox(INFOBOX_WIDTH, INFOBOX_HEIGHT);

        box.addComponent(TextFields.infoboxPlayerName(name), Align.Center, INFOBOX_WIDTH, 25);
        box.addComponent(TextFields.infoboxRating('Rating: $rating'), Align.Center, INFOBOX_WIDTH, 20);
        box.addComponent(TextFields.infoboxMostplayedHeader(), Align.Left, INFOBOX_WIDTH, 20);
        box.addComponent(recordGrid(record), 166*2, 165*2 + 5);

        s.addChild(bgBox());
        s.addChild(box);
        return s;
    }  

    private static function bgBox():Sprite
    {
        return Shapes.rect(INFOBOX_WIDTH, INFOBOX_HEIGHT, 0x333333, 1, LineStyle.Square, 0x666666);
    }

    private static function recordGrid(record:Array<ClassRecord>):Sprite
    {
        var grid:Grid = new Grid(2, 166, 165, 0x333333, 3);
        for (i in 0...4)
            if (i < record.length)
            {
                var r = record[i];
                grid.addComponent(classRecord(r.element, r.wins, r.losses));
            }
            else 
                grid.addComponent(new EmptyRecordSlot());
        return grid;
    }

    private static function classRecord(element:Element, wins:Int, losses:Int):Sprite
    {
        var box:VBox = new VBox(162, 158);
        box.addComponent(Assets.getPlayer(element), Align.Center);
        box.addComponent(TextFields.classRecord('$wins wins/$losses losses'), Align.Left, 166, 18);
        return box;
    }  
}