package graphic.components;

import haxe.Timer;
import openfl.events.Event;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;
using MathUtils;

class BHGame extends SSprite
{
    private var SOUL_VELOCITY:Int = 2;
    private var BG_RECT:Rectangle = new Rectangle(0, 0, 500, 200); //width and height are not final

    private var callback:Void->Void;
    private var soul:Sprite;
    private var particles:Array<Array<Sprite>>;
    private var trajectory:Array<Int->Point>;

    private var soulVel:Point = new Point(0, 0);
    private var tick:Int = 0;

    private var timer:Timer;

    private function update()
    {
        var sv:Point = new Point(soulVel.x, soulVel.y);
        sv.normalize(SOUL_VELOCITY);
        //process sv by buff queue -> var ----------------------------------> ALPHA 6.0
        if (soul.x + sv.x - soul.width < BG_RECT.x)
            soul.x = soul.width;
        else if (soul.x + sv.x + soul.width > BG_RECT.x + BG_RECT.width)
            soul.x = BG_RECT.x + BG_RECT.width - soul.width;
        else
            soul.x = soul.x + sv.x;
        if (soul.y + sv.y - soul.height < BG_RECT.y)
            soul.y = soul.height;
        else if (soul.y + sv.y + soul.height > BG_RECT.y + BG_RECT.height)
            soul.y = BG_RECT.y + BG_RECT.height - soul.height;
        else
            soul.y = soul.y + sv.y;
            
        for (i in 0...particles.length)
            for (j in 0...particles[i].length)
            {
                var p = particles[i][j];
                var traj:Point = trajectory[i](tick);
                p.x += traj.x;
                p.y += traj.y;
                if (!p.getBounds(this).intersects(BG_RECT))
                    vanish(i, j);
                else if (overlaps(soul, p))
                {
                    vanish(i, j);
                    boom();
                }
            }
        tick++;
        for (a in particles)
            if (!Lambda.empty(a))
                return;
        timer.stop();
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.removeEventListener(KeyboardEvent.KEY_UP, onReleased);
        //there the new listeners for BH abilities will be removed --------> ALPHA 8.0
        callback();
    }

    private function vanish(i:Int, j:Int)
    {
        removeChild(particles[i][j]);
        particles[i].splice(j, 1);
    }

    private function boom()
    {
        //Fill after the first successful tests:
        //   Display damage gfx and play damage sfx
        //   Display damage value if needed and possible
    }

    private function overlaps(soul:Sprite, particle:Sprite):Bool //Argument types can be changed when the body will be filled (also change in all other occurencies in BHGame and in Assets)
    {
        var intersection:Rectangle = soul.getBounds(this).intersection(particle.getBounds(this));
        if (intersection.isEmpty())
            return false
        else 
        {
            return true; //replace with real body
        }
    }

    private function onPressed(e:KeyboardEvent)
    {
        switch (e.keyCode)
        {
            case 38: soulVel.y -= 1;
            case 40: soulVel.y += 1;
            case 37: soulVel.x -= 1;
            case 39: soulVel.x += 1;
        }
    }

    private function onReleased(e:KeyboardEvent)
    {
        switch (e.keyCode)
        {
            case 40: soulVel.y -= 1;
            case 38: soulVel.y += 1;
            case 39: soulVel.x -= 1;
            case 37: soulVel.x += 1;
        }
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        addChild(soul);
        for (a in particles)
            for (p in a)
                addChild(p);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.addEventListener(KeyboardEvent.KEY_UP, onReleased);
        //there will be new listeners for BH abilities -------------> ALPHA 8.0
        timer = new Timer(100);
        timer.run = update;
    }

    //damageFunc defines the damage that i-th particle deals. It's prerandomed on the server and then sent to the players
    public function new(ability:ID, pattern:Array<Array<Point>>, onOver:Void->Void, trajectory:Array<Int->Point>, damageFunc:Int->Int)
    {
        super();
        callback = onOver;
        this.trajectory = trajectory;
        //this.damageFunc = damageFunc; -------------> WHEN (AND IF) boom() WILL NEED THESE VALUES
        soul = Assets.getSoul();
        soul.x = soul.width;
        soul.y = BG_RECT.height / 2;
        for (i in 0...pattern.length)
        {
            particles[i] = [];
            for (j in 0...pattern[i].length)
            {
                var particle = Assets.getParticle(ability);
                particle.x = pattern[i][j].x;
                particle.y = pattern[i][j].y;
                particles[i].push(particle);
            }
        }
        var bg:Sprite = new Sprite();
        bg.graphics.lineStyle(5, 0xDDDDDD, null, null, null, CapsStyle.SQUARE, JointStyle.MITER);
        bg.graphics.beginFill(0x111111);
        bg.graphics.drawRect(BG_RECT.x, BG_RECT.y, BG_RECT.width, BG_RECT.height);
        bg.graphics.endFill();
        addChild(bg);
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}