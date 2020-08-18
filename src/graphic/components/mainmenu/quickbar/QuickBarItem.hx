package graphic.components.mainmenu.quickbar;

import openfl.display.Sprite;
import motion.actuators.TransformActuator;
import motion.easing.IEasing;
import openfl.filters.DropShadowFilter;
import motion.Actuate;
import openfl.text.TextFormatAlign;
import openfl.text.TextFormat;
import openfl.text.TextField;
using graphic.SpriteExtension;

enum ItemName
{
    MainScreen;
    Character;
}

enum QuickBarStyle
{
    MainScreen;
    Character;
}

class QuickBarItem extends Sprite
{
    private var QUICKBAR_HEIGHT:Float = 42;

    private var nameField:TextField;
    private var highlighter:Sprite;
    private var style:QuickBarStyle;

    public function onHover(e)
    {
        nameField.filters = [new DropShadowFilter(0, 45, TextFields.quickBarItemActiveShadowColor,1, 5, 5)];
        nameField.textColor = TextFields.quickBarItemActiveColor(style);
        highlighter.visible = true;
    }

    public function onOut(e)
    {
        highlighter.visible = false;
        nameField.filters = [new DropShadowFilter(4, 45, TextFields.quickBarItemShadowColor)];
        nameField.textColor = TextFields.quickBarItemColor(style);
    }

    public function changeStyle(newStyle:QuickBarStyle) 
    {
        if (nameField.textColor == TextFields.quickBarItemActiveColor(style))
            nameField.textColor = TextFields.quickBarItemActiveColor(newStyle);
        else 
            nameField.textColor = TextFields.quickBarItemColor(newStyle);
        style = newStyle;
    }

    private static function nameOf(item:ItemName):String
    {
        return switch item {
            case MainScreen: "Main Screen";
            case Character: "Character";
        }
    }

    public function new(item:ItemName, elWidth:Float, style:QuickBarStyle)
    {
        super();
        this.style = style;

        nameField = TextFields.quickBarItem(nameOf(item), style);
        nameField.width = elWidth;
        nameField.height = QUICKBAR_HEIGHT;

        highlighter = Shapes.hoverHighlighter(elWidth, QUICKBAR_HEIGHT);
        highlighter.visible = false;

        this.add(Shapes.line(0, QUICKBAR_HEIGHT, 0x4F4F4F, 4), 0, 0);
        this.add(Shapes.line(0, QUICKBAR_HEIGHT, 0x4F4F4F, 4), elWidth, 0);
        this.add(nameField, 0, 4);
        this.add(highlighter, 0, 0);
    }
}