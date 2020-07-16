package graphic.components.hints;

import openfl.text.TextFormatAlign;
import io.AbilityJSONParser;
import hxassert.Assert;
import ID.AbilityID;
import graphic.Shapes.LineStyle;
import openfl.display.Sprite;
import openfl.text.TextField;
using graphic.SpriteExtension;
using StringTools;

enum AbilityHintType
{
    Battle;
    Roaming;
}

class AbilityHint extends Sprite
{
    private var bg:Sprite;
    private var proto:ProtoAbility;
    private var subheadertext:String;
    private var fullBox:VBox;
    
    private var type:AbilityHintType;
    private var id:AbilityID;
    private var level:Int;
    private var boxWidth:Float;

    private static var XOFFSET:Float = 1;
    private static var YOFFSET:Float = 3.5;
    //private static var YINTERVAL:Float = 6;
    
    ///Roaming-only feature
    public function setLevel(newLevel:Int)
    {
        Assert.require(!struct.Utils.isEmpty(id) && type == Roaming && level >= 0);

        removeChild(bg);
        removeChild(fullBox);
        level = newLevel;
        createGeneral(boxWidth);
        draw();
    }

    public function new(id:AbilityID, type:AbilityHintType, level:Int, ?boxWidth:Float = 250) 
    {
        if (type == Battle)
            Assert.require(level > 0);
        else
            Assert.require(level >= 0);

        super();
        this.type = type;
        this.id = id;
        this.level = level;
        this.boxWidth = boxWidth;

        if (struct.Utils.isEmpty(id))
        {
            var name:String = id == EmptyAbility? "Empty slot" : "Locked slot";
            var desc:String = id == EmptyAbility? "There is no ability in this slot" : "This additional ability slot will be unlocked on later levels";

            fullBox = new VBox(boxWidth);
            fullBox.addComponent(formatName(name));
            fullBox.addComponent(formatMainDesc(desc));
        }
        else 
        {
            proto = AbilityJSONParser.getProtoAbility(id);
            createGeneral(boxWidth);
        }
        draw();
    }

    private function createGeneral(boxWidth:Float)
    {
        var compoundDescription:Map<String, String> = AbilityJSONParser.getAbilityDescription(id, level == 0? null : level, type == Battle);

        var headertf = formatName(proto.name);

        var subheaderRaw:String = 'Type: ${proto.typeStr}';
        if (type == Roaming)
            subheaderRaw += ' | Lvl. $level/${proto.maxlvl}';
        var subheaderRString:RichString = new RichString(subheaderRaw, [Fonts.GOTHICHEAVY]);
        var subheadertf = subheaderRString.format(15, boxWidth, 0xCCCCCC, false, TextFormatAlign.CENTER, true);
        subheadertf.height = subheadertf.textHeight + 5;

        var descriptiontf = formatMainDesc(compoundDescription.get("main"));
        compoundDescription.remove("main");

        var parameterTFs:Array<TextField> = [];
        for (param in compoundDescription.keyValueIterator())
            parameterTFs.push(formatParameter(param.key, param.value));

        if (proto.cooldown != null)
        {
            var cdString:String = "";
            for (v in proto.cooldown)
                cdString += v + "/";

            var resultString:String;
            if (level != 0)
                resultString = AbilityJSONParser.highlightNumbers("<" + cdString.substr(0, cdString.length - 1) + ">", level, type == Battle);
            else 
                resultString = "<" + cdString.substr(0, cdString.length - 1) + ">";
            parameterTFs.push(formatParameter("COOLDOWN", resultString));
        }
        if (proto.manacost != null)
        {
            var mcString:String = "";
            for (v in proto.manacost)
                mcString += v + "/";

            var resultString:String;
            if (level != 0)
                resultString = AbilityJSONParser.highlightNumbers("<" + mcString.substr(0, mcString.length - 1) + ">",level, type == Battle);
            else 
                resultString = "<" + mcString.substr(0, mcString.length - 1) + ">";
            parameterTFs.push(formatParameter("MANACOST", resultString));
        }

        fullBox = new VBox(boxWidth);
        fullBox.addComponent(headertf);
        fullBox.addComponent(subheadertf);
        fullBox.addComponent(descriptiontf);
        for (paramtf in parameterTFs)
            fullBox.addComponent(paramtf);
    }

    private function draw() 
    {
        bg = Shapes.rect(boxWidth + 2 * XOFFSET, YOFFSET + fullBox.h + YOFFSET, 0x333333, 3, LineStyle.Square, 0x111111, 0.9);
        this.add(bg, 0, 0);
        this.add(fullBox, XOFFSET, YOFFSET);    
    }

    private function formatParameter(nameRaw:String, valueRaw:String):TextField
    {
        var rawParam:String = "&(1)[" + nameRaw + ":] " + valueRaw;
        var paramRString:RichString = new RichString(rawParam, [Fonts.GOTHICMEDIUM, Fonts.GOTHICHEAVY]);
        var paramtf:TextField = paramRString.format(15, boxWidth, 0xCCCCCC);
        paramtf.height = paramtf.textHeight + 5;
        return paramtf;
    }

    private function formatName(raw:String):TextField
    {
        var nameRString:RichString = new RichString(raw, [Fonts.ERAS]);
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