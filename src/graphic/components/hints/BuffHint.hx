package graphic.components.hints;

import struct.Element;
import ID.BuffID;
import io.AbilityParser;
import io.DescriptionParser;
import openfl.text.TextFormatAlign;
import hxassert.Assert;
import ID.BuffID;
import graphic.Shapes.LineStyle;
import openfl.display.Sprite;
import openfl.text.TextField;
using graphic.SpriteExtension;
using StringTools;

class BuffHint extends Sprite
{
    private var bg:Sprite;
    private var fullBox:VBox;
    
    private var boxWidth:Float;

    private static var XOFFSET:Float = 1;
    private static var YOFFSET:Float = 3.5;

    public function new(name:String, descText:String, element:Element, ?properties:Map<String, String>, ?boxWidth:Float = 250) 
    {
        super();
        this.boxWidth = boxWidth;

        var headertf = formatName(name);
        var descriptiontf = formatMainDesc(descText);

        var subheaderRaw:String = 'Element: ${element.getName()}';
        var subheaderRString:RichString = new RichString(subheaderRaw, [Fonts.GOTHICHEAVY], properties);
        var subheadertf = subheaderRString.format(15, boxWidth, 0xCCCCCC, false, TextFormatAlign.CENTER, true, true);
        subheadertf.height = subheadertf.textHeight + 5;

        fullBox = new VBox(boxWidth);
        fullBox.addComponent(headertf);
        fullBox.addComponent(subheadertf);
        fullBox.addComponent(descriptiontf);
        draw();
    }

    private function draw() 
    {
        bg = Shapes.rect(boxWidth + 2 * XOFFSET, YOFFSET + fullBox.h + YOFFSET, 0x333333, 3, LineStyle.Square, 0x111111, 0.9);
        this.add(bg, 0, 0);
        this.add(fullBox, XOFFSET, YOFFSET);    
    }

    private function formatName(raw:String):TextField
    {
        var nameRString:RichString = new RichString(raw);
        var header = nameRString.format(18, boxWidth, 0xCCCCCC, false, TextFormatAlign.CENTER, true);
        header.height = header.textHeight + 5;
        return header;
    }

    private function formatMainDesc(raw:String):TextField
    {
        var mainDescRString = new RichString(raw, [Fonts.GOTHICMEDIUM, Fonts.GOTHICHEAVY]);
        var desc = mainDescRString.format(15, boxWidth, 0xCCCCCC);
        desc.height = desc.textHeight + 5;
        return desc;
    }
}