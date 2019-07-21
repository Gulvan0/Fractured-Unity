package graphic.components;

import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;

class BHGame extends SSprite
{
    private var SOUL_VELOCITY:Int = 2;

    private var callback:Void->Void;
    private var soul:Sprite;
    private var particles:Array<Sprite>;

    private var soulVel:Point = new Point(0, 0);

    private function update()
    {
        //process soulVel by buff queue -> var
        //move soul according to processed soulVel
        //for actual particles (i)
        //  move particle according to trajectory
        //  if !p.getBounds.intersects(BG_RECT)
        //    vanish(p)
        //  else if overlaps soul
        //    vanish(p)
        //    boom()
        //if Lambda.empty(particles)
        //  stop timer
        //  callback()
    }

    private function vanish(particle:Sprite)
    {
        //removeChild
        //particles.splice
    }

    private function boom()
    {
        //Display damage gfx and play damage sfx
        //Display damage value if needed and possible
    }

    private function onPressed(e:KeyboardEvent)
    {
        switch (e.keyCode)
        {
            case 38: soulVel.y -= SOUL_VELOCITY;
            case 40: soulVel.y += SOUL_VELOCITY;
            case 37: soulVel.x -= SOUL_VELOCITY;
            case 39: soulVel.x += SOUL_VELOCITY;
        }
        //normalize soulVel
    }

    private function onReleased(e:KeyboardEvent)
    {
        switch (e.keyCode)
        {
            case 40: soulVel.y -= SOUL_VELOCITY;
            case 38: soulVel.y += SOUL_VELOCITY;
            case 39: soulVel.x -= SOUL_VELOCITY;
            case 37: soulVel.x += SOUL_VELOCITY;
        }
        //normalize soulVel
    }

    private function init()
    {
        //remove ADDED_TO_STAGE listener
        //add soul
        //addChild particles
        //add listeners
        //create and start timer (run = update, interval = 100)
    }

    //Trajectory - class, that contains the Int->Point field ("traj") and public function dir: t++; return traj(t)
    //damageFunc defines the damage that i-th particle deals. It's prerandomed on the server and then sent to the players
    public function new(/*pattern:Array<Point>, onOver:Void->Void, trajectory:Trajectory, damageFunc:Int->Int*/)
    {
        super();
        //callback = onOver;
        //this.trajectory = trajectory;
        //create and dispose soul according to constants
        //create and dispose particles according to pattern
        //create and add background
        //add ADDED_TO_STAGE listener
    }
}