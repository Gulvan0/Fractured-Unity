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

enum WarnType
{
    Multiple;
    Empty;
}

class ParamBox extends Sprite
{
    private var bg:Sprite;
    private var attNames:Array<TextField> = [];
    private var attValues:Array<Sprite> = [];
    private var warning:Null<Sprite>;

    public function init(parameters:Map<String, BHParameter>, paramUpdateCallback:(paramName:String, newValue:Float)->Void, ?warnType:Null<WarnType>)
    {
        clean();
        if (warnType != null)
        {
            warning = createWarning(warnType);
            this.add(warning, 6.5, 6);
        }

        var i = 0;
        for (name => p in parameters)
        {
            var nameTf:TextField = TextFields.editorParamName(name);
            var input:Sprite = createInputBox(p, paramUpdateCallback.bind(name));
            attNames.push(nameTf);
            attValues.push(input);
            var addend = warning != null? 75 : 0;
            this.add(nameTf, 15, 20 + addend + 40 * i);
            this.add(input, 170, 25 + addend + 40 * i);
            i++;
        }
    }

    private function createWarning(type:WarnType):Sprite
    {
        var s:Sprite = new Sprite();
        var text:String = switch type {
            case Multiple: "Multiple objects are selected. Only parameters of the first object are displayed. Changing the values will affect all the selected objects.";
            case Empty: "This ability has no changeable parameters.";
        }
        s.add(new ParamboxYellowWarnBG(), 0, 0);
        s.add(new ExclamationCircle(), 12, 12);
        s.add(TextFields.editorParamboxWarn(text), 1.5, 1.5);
        return s;
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
        if (warning != null && warning.stage != null)
            removeChild(warning);
        attNames = [];
        attValues = [];
        warning = null;
    }

    public function new()
    {
        super();
        bg = Shapes.rect(265, 415, 0x134760, 5, LineStyle.Square, 0x142B33);
        addChild(bg);
    }
}