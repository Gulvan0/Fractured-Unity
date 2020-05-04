package graphic.components.bheditor;

import graphic.Shapes.LineStyle;
import bh.BHParameter;
import openfl.display.DisplayObject;
import openfl.text.TextFormatAlign;
import ConnectionManager.BHParameterUnit;
import openfl.text.TextFormat;
import openfl.text.TextField;
import ConnectionManager.BHParameterDetails;
import openfl.display.Sprite;

using graphic.SpriteExtension;

class ParamBox extends Sprite
{
    private var bg:Sprite;
    private var attNames:Array<TextField> = [];
    private var attValues:Array<Sprite> = [];

    public function init(parameters:Map<String, BHParameter>, paramUpdateCallback:(paramName:String, newValue:Float)->Void, ?warnMultiple:Bool = false)
    {
        clean();
        var i = 0;
        for (name => p in parameters)
        {
            var nameTf:TextField = TextFields.editorParamName(name);
            var input:Sprite = createInputBox(p, paramUpdateCallback.bind(name));
            attNames.push(nameTf);
            attValues.push(input);
            this.add(nameTf, 15, 20 + 40 * i);
            this.add(input, 170, 25 + 40 * i);
            i++;
        }
    }

    private function createInputBox(param:BHParameter, paramUpdateCallback:(newValue:Float)->Void):Sprite
    {
        var s:Sprite = new Sprite();
        s.addChild(new BHInputField());
        s.addChild(TextFields.editorParamValue(param.value, param.leftConstraint, param.rightConstraint, param.intConstrained, paramUpdateCallback));
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
    }

    public function new()
    {
        super();
        bg = Shapes.rect(265, 415, 0x134760, 5, LineStyle.Square, 0x142B33);
        addChild(bg);
    }
}