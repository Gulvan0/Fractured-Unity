package graphic.components.bheditor;

import io.AbilityParser;
import graphic.components.TextWindow.TextWindowSize;
import bh.enums.AttackType;
import bh.enums.DispenserType;
import openfl.display.DisplayObject;
import ID.AbilityID;
import engine.Color;
import bh.EasingUtils;
import engine.MathUtils;
import openfl.text.TextField;
import bh.PropObj;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.events.MouseEvent;
import motion.easing.Quad;
import motion.Actuate;
import openfl.display.Sprite;
import graphic.components.hints.UnnamedHint;
using graphic.SpriteExtension;

enum Row
{
    Attack;
    Dispenser;
    Interval;
    Count;
    Easing;
}

class HelpDropper extends Sprite
{
    private var bg:BHHelpDropper;
    private var expandFold:TogglingAnimation;
    private var questions:Array<BHHelpItemQuestion>;
    private var manualLink:TextField;

    private var expanded:Bool;

    private var BODY_WIDTH:Float = 303;
    private var QUESTION_DIAMETER:Float = 20;
    private var BODY_START_X:Float = 69;
    private var orderedRows:Array<Row> = [Attack, Dispenser, Interval, Count, Easing];

    private inline function rowTFWidth():Int
    {
        return Math.round((BODY_WIDTH - QUESTION_DIAMETER)/2);
    }

    private function rowName(row:Row, properties:PropObj):TextField 
    {
        var text:String = switch row 
        {
            case Attack: "Attack type:";
            case Dispenser: "Dispenser:";
            case Interval: "Interval:";
            case Count: properties.dispenser == DispenserType.Geyser? "Count:" : "Max count:";
            case Easing: "Easing:";
        };
        return TextFields.editorHelpGeneral(text, rowTFWidth());
    }

    private function rowValue(row:Row, properties:PropObj):TextField 
    {
        var text:String = switch row 
        {
            case Attack: properties.attack.getName();
            case Dispenser: properties.dispenser.getName();
            case Interval: MathUtils.roundTo(properties.interval, 1) + "s";
            case Count: "" + properties.count;
            case Easing: properties.presetEasing == null? "Custom" : EasingUtils.getName(properties.presetEasing);
        };

        var color:Null<Int> = null;
        if (row == Attack)
            color = Color.helpAttackTypeColor(properties.attack);
        else if (row == Dispenser)
            color = Color.helpDispenserColor(properties.dispenser);

        return TextFields.editorHelpGeneral(text, rowTFWidth(), color);
    }

    private function rowHint(row:Row, properties:PropObj):Null<UnnamedHint>
    {
        var text:String;
        switch(row)
        {
            case Interval: return null;
            case Count: return null;
            case Attack:
                if (properties.attack == AttackType.Instant)
                    text = "Right after you use an instant ability, the enemy is forced to dodge the particles of this ability and also the particles of each delayed ability used on him before";
                else 
                    text = "All delayed abilities are stacked up on the enemy only to be thrown at him together with the first instant ability used on it";
            case Dispenser: 
                if (properties.dispenser == DispenserType.Emitter)
                    text = "Emitters emit particles with a given interval";
                else if (properties.dispenser == DispenserType.Sequential)
                    text = "Each of the sequential dispensers fire one particle one after another";
                else if (properties.dispenser == DispenserType.Obstacle)
                    text = "Obstacles appear according to pattern and behave as normal particles";
                else
                    text = "Particles appear in the random positions with a given interval";
            case Easing: 
                text = "Easing determines how the object's speed changes over time\nWhen the object has IN easing, it takes some time to gather the speed\nWhen the object has OUT easing, it starts to slow down before the destination\nExpo's effect is stronger than Cubic's";
        }
        return new UnnamedHint(new RichString(text));
    }

    private function toggle()
    {
        var deltaX:Float = expanded? BODY_WIDTH +7: -BODY_WIDTH-7;
        var newX:Float = x + deltaX;
        expandFold.toggle();
        Actuate.tween(this, cast(expandFold, MovieClip).totalFrames / Main.FPS, {x:newX}).ease(Quad.easeOut);
        expanded = !expanded;
    }

    private function openManual()
    {
        var text:String = "Over a half of the damaging abilities in this game are particle-based. To deal damage, they use the Danmaku mode, in which the enemy" +
    " is forced to dodge the particles. Every time the particle hits the enemy, it deals damage to him and may apply the negative effect.\n\n" +
        "Each particle-based ability has its own unique particle shape. Depending on the value of the property called 'Dispenser', particles can be placed" +
    " in the danmaku box directly or emitted by dispensers. Particles and dispensers are called Danmaku objects.\n\n" +
        "Objects come in patterns. This editor is used to dispose objects of particle-based abilities.\n\n" +
        "To add the object, enter the Add mode by clicking the button on the left of the screen, then click where you want to place the object. Remember that" +
    " the total number of objects is limited for each ability. The number on the Add button indicates the number of objects left\n\n" +
        "You can edit the properties of the objects to modify their trajectory. To do this, first enter the Edit mode by clicking the button on the left of the" +
    " screen, then select the objects you want to edit and then use the parameter box in the bottom left corner of the screen.\n\n" +
        "To remove the object, enter the Delete mode, then click on the object you wish to remove. To delete multiple objects, click and drag.\n\n" +
        "To move the object, enter the Move mode, then drag the desired object across the screen.\n\n" +
        "Finally, to see your pattern in action, enter the Playtest mode. This will start the Danmaku mode.\n\n" +
        "Each ability has 3 patterns. During the battle, you can choose the pattern you want to draw upon the enemy before using the ability. To switch between" +
    " patterns in the editor, use the number buttons in the top left corner of the screen. When you accept the changes, all 3 patterns are saved.\n\n" +
        "You can zoom in and out using your mouse wheel.\n\n" +
        "To undo, press Ctrl-Z; to redo, press Ctrl-Y.\n\n" +
        "Right panel, which is opened by clicking the question mark, holds important information about the danmaku properties of the ability you are editing. For" +
    " example, 'Attack type' and 'Dispenser' greatly affect the behavior of the ability. To learn more, hover the question mark to the right of the value of the" +
    " property";
        var manualWindow:TextWindow = new TextWindow(new RichString(''), []);
        manualWindow = new TextWindow(new RichString(text), TextWindowSize.Manual, [Cross(stage.removeChild.bind(manualWindow))]);
        stage.addChild(manualWindow);
    }

    private function onClick(e:MouseEvent)
    {
        if (MathUtils.insideC(e.stageX, e.stageY, manualLink.getBounds(stage)))
            openManual();
        else if (MathUtils.insideC(e.stageX, e.stageY, cast(expandFold, MovieClip).getBounds(stage)))
            toggle();
    }

    private function terminate(?e) 
    {
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
        removeEventListener(MouseEvent.CLICK, onClick);
        for (q in questions)
            q.disableHint();
    }

    private function init(?e) 
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        addEventListener(MouseEvent.CLICK, onClick);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new(ability:AbilityID, properties:PropObj) 
    {
        super();
        expanded = false;

        bg = new BHHelpDropper();
        expandFold = new BHHelpQuestionMark();
        cast(expandFold, MovieClip).stop();
        questions = [];
        manualLink = TextFields.editorHelpManualLink();
        var header = TextFields.editorHelpHeader(AbilityParser.abilities.get(ability).name);

        this.add(bg, 0, 0);
        this.add(expandFold, 37.3, 289.65);
        this.add(Assets.getBattleAbility(ability), 191.3, 29.2);
        this.add(header, BODY_START_X, 96.2);

        if (properties.dispenser == Obstacle)
            orderedRows.remove(Interval);
        else if (properties.dispenser == Geyser)
            orderedRows.remove(Easing);

        var yPos:Float = 170;
        for (row in orderedRows)
        {
            this.add(rowName(row, properties), BODY_START_X, yPos);
            this.add(rowValue(row, properties), BODY_START_X + rowTFWidth(), yPos);
            var hint = rowHint(row, properties);
            if (hint != null)
            {
                var question = new BHHelpItemQuestion();
                question.setHint(hint);
                questions.push(question);
                this.add(question, BODY_START_X + BODY_WIDTH - QUESTION_DIAMETER, yPos + 5.85);
            }
            yPos += 48;
        }

        this.add(manualLink, BODY_START_X, 503.45);

        addEventListener(Event.ADDED_TO_STAGE, init);
    }    
}