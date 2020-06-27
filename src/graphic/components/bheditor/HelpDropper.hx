package graphic.components.bheditor;

import bh.enums.AttackType;
import bh.enums.DispenserType;
import openfl.display.DisplayObject;
import io.AbilityJSONParser;
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
        //TODO: Fill
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
        var header = TextFields.editorHelpHeader(AbilityJSONParser.getAbilityName(ability));

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