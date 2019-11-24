package graphic.components.bheditor;

import openfl.display.Sprite;

class ParamBox extends SSprite
{

    private var bg:Sprite;

    public function new()
    {
        super();
        bg = new Sprite();
        bg.graphics.lineStyle(5, 0x003B59);
        bg.graphics.beginFill(0x004B72);
        bg.graphics.drawRect(0, 0, 246, 414);
        bg.graphics.endFill();
        addChild(bg);
    }
}