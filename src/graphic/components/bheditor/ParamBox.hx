package graphic.components.bheditor;

import bh.EasingUtils;
import bh.EasingUtils.Easing;
import motion.easing.IEasing;
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

typedef UpdateCallback = (paramName:String, newValue:Float, ?valueIfEasing:IEasing)->Void;

class ParamBox extends Sprite
{
    private var bg:Sprite;
    private var attNames:Array<TextField> = [];
    private var attValues:Array<Sprite> = [];
    private var warning:Null<Sprite>;

    private var BORDER_THICKNESS:Int = 5;

    public function init(parameters:Map<String, BHParameter>, easing:Null<IEasing>, paramUpdateCallback:UpdateCallback, ?warnType:Null<WarnType>)
    {
        clean();
        if (warnType != null)
        {
            warning = createWarning(warnType);
            this.add(warning, 6.5, 6);
        }

        var i = 0;
        for (pname => p in parameters)
        {
            createParameterInput(pname, i, warning != null, createInputBox(p, paramUpdateCallback.bind(pname)));
            i++;
        }
        if (easing != null)
            createParameterInput("Easing", i, warning != null, createEasingSelect(easing, paramUpdateCallback.bind("Easing", 0, _)));
    }

    private function createParameterInput(pname:String, i:Int, hasWarning:Bool, input:Sprite) 
    {
        var nameTf:TextField = TextFields.editorParamName(pname);
        attNames.push(nameTf);
        attValues.push(input);
        var addend = hasWarning? 75 : 0;
        var inputX = pname == "Easing" && input.width + 170 + BORDER_THICKNESS * 2 > width? width - input.width - BORDER_THICKNESS * 2 : 170;
        this.add(nameTf, 15, 20 + addend + 40 * i);
        this.add(input, inputX, 25 + addend + 40 * i);
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

    private function createEasingSelect(currentValue:IEasing, paramUpdateCallback:(newValue:IEasing)->Void):Sprite
    {
        var enumConstructors = Easing.createAll();
        var enumNames = enumConstructors.map(e -> e.getName());

        function callback(s:String)
        {
            paramUpdateCallback(EasingUtils.getEasing(Easing.createByName(s)));
        }

        return new OptionSelector(enumNames, callback, EasingUtils.getName(currentValue));
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
        bg = Shapes.rect(265, 415, 0x134760, BORDER_THICKNESS, LineStyle.Square, 0x142B33);
        addChild(bg);
    }
}