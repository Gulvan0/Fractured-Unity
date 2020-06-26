package graphic.components.bheditor;

import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.events.MouseEvent;
import motion.easing.Quad;
import motion.Actuate;
import openfl.display.Sprite;

class HelpDropper extends Sprite
{
    private var bg:BHHelpDropper;
    private var expandFold:TogglingAnimation;

    private var expanded:Bool;

    private var BODY_WIDTH:Float = 310;

    private function toggle(?e)
    {
        var deltaX:Float = expanded? BODY_WIDTH : -BODY_WIDTH;
        var newX:Float = x + deltaX;
        expandFold.toggle();
        Actuate.tween(this, cast(expandFold, MovieClip).totalFrames / Main.FPS, {x:newX}).ease(Quad.easeOut);
        expanded = !expanded;
    }

    private function terminate(?e) 
    {
        cast(expandFold, MovieClip).removeEventListener(MouseEvent.CLICK, toggle);
        removeEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    private function init(?e) 
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        cast(expandFold, MovieClip).addEventListener(MouseEvent.CLICK, toggle);
        addEventListener(Event.REMOVED_FROM_STAGE, terminate);
    }

    public function new() 
    {
        super();
        expanded = false;

        bg = new BHHelpDropper();
        expandFold = new BHHelpQuestionMark();

        addEventListener(Event.ADDED_TO_STAGE, init);
    }    
}