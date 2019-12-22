package graphic.components.bheditor;

import openfl.display.DisplayObject;
import openfl.text.TextFormatAlign;
import ConnectionManager.BHParameterUnit;
import openfl.text.TextFormat;
import openfl.text.TextField;
import ConnectionManager.BHParameterDetails;
import openfl.display.Sprite;



class ParamBox extends SSprite
{

    private var bg:Sprite;
    private var attNames:Array<TextField> = [];
    private var attValues:Array<Sprite> = [];
    private var attValueTFs:Array<RestrictedIntField> = [];

    private var nameFormat:TextFormat = new TextFormat(Fonts.TAHOMA, 22, 0xdddddd);
    private var inputValueFormat:TextFormat = new TextFormat(Fonts.TAHOMA, 22, 0xdddddd, null, null, null, null, null, TextFormatAlign.CENTER);
    private var choiceValueFormat:TextFormat = new TextFormat(Fonts.TAHOMABOLD, 22, 0xdddddd);

    public function init(parameters:Array<BHParameterDetails>, values:Map<String, Float>, paramUpdateCallback:(paramName:String, newValue:Int)->Void)
    {
        clean();
        var i = 0;
        for (p in parameters)
        {
            var name:TextField = new TextField();
            name.text = p.name;
            name.selectable = false;
            name.setTextFormat(nameFormat);
            var input:Sprite = createInputBox(p, "" + values[p.name], paramUpdateCallback.bind(p.name));
            attNames.push(name);
            attValues.push(input);
            add(name, 15, 20 + 40 * i);
            add(input, 170, 25 + 40 * i);
            i++;
        }
    }

    private function createInputBox(p:BHParameterDetails, ?text:Null<String>, paramUpdateCallback:(newValue:Int)->Void):SSprite
    {
        var s:SSprite = new SSprite();
        var field:DisplayObject = new BHInputField();
        s.addChild(field);
        if (p.unit == BHParameterUnit.Degree)
            s.add(new BHDegreeSign(), field.width - 3, -3);
        var tf:RestrictedIntField = new RestrictedIntField(cast p.from, cast p.to, paramUpdateCallback);
        tf.width = 50;
        tf.height = 22;
        tf.defaultTextFormat = inputValueFormat;
        if (text != null)
            tf.text = text;
        attValueTFs.push(tf);
        s.add(tf, -2, -3);
        return s;
    }

    private function clean()
    {
        //removeEventListeners for CHOOSE type (but they should be removed inside the corresponding class)
        for (n in attNames)
            removeChild(n);
        for (v in attValues)
            removeChild(v);
        attNames = [];
        attValues = [];
        attValueTFs = [];
    }

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