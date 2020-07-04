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
    Inventory;
    Character;
    Challenge;
}

class QuickBarItem extends Sprite
{

    private var nameField:TextField;

    public function onHover(e)
    {
        nameField.filters = [new DropShadowFilter(0, 45, TextFields.quickBarItemActiveShadowColor,1, 5, 5)];
        nameField.textColor = TextFields.quickBarItemActiveColor;
    }

    public function onOut(e)
    {
        nameField.filters = [new DropShadowFilter(4, 45, TextFields.quickBarItemShadowColor)];
        nameField.textColor = TextFields.quickBarItemColor;
    }

    private static function nameOf(item:ItemName):String
    {
        return item.getName(); //can be changed if needed
    }

    public function new(item:ItemName, elWidth:Float)
    {
        super();
        addChild(Shapes.line(0, 42, 0x00424F, 4));
        this.add(Shapes.line(0, 42, 0x00424F, 4), elWidth, 0);
        nameField = TextFields.quickBarItem(nameOf(item));
        nameField.width = elWidth;
        this.add(nameField, 0, 4);
    }
}