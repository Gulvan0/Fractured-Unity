package graphic.components;

import openfl.text.TextFormat;
import graphic.Shapes;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.display.SimpleButton;
using graphic.Utils;

class GradButton extends SimpleButton
{
    public function new(borderColor:Int, borderThickness:Int, fillColour1:Int, fillColour2:Int, text:String, textFormat:TextFormat, width:Float, height:Float)
    {
        function getBase(?inversed:Bool = false)
        {
            var direction:LinearGradientDirection = inversed? Up : Down;
            var s:Sprite = Shapes.gradRect(width, height, borderColor, borderThickness, Square, fillColour1, fillColour2, direction);
            var tf = new TextField();
            tf.text = text;
            tf.setTextFormat(textFormat);
            tf.width = width;
            tf.height = tf.textHeight + 5;
            s.addChild(tf);
            return s;
        }
        var upstate:Sprite = getBase();
        var overstate:Sprite = getBase();
        overstate.addChild(Shapes.hoverHighlighter(width, height));
        var downstate:Sprite = getBase(true);
        var hitstate:Sprite = getBase();
        super(upstate, overstate, downstate, hitstate);
    }
}