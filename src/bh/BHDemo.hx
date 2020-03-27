package bh;

import openfl.display.MovieClip;
import haxe.ui.components.TextField;
import haxe.Timer;
import openfl.events.Event;
import openfl.display.JointStyle;
import openfl.display.CapsStyle;
import openfl.geom.Rectangle;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;

class BHDemo extends SSprite
{
    private var BG_RECT:Rectangle = new Rectangle(0, 0, GameRules.bhRectW, GameRules.bhRectH);

    private var soul:Sprite;
    private var particles:Array<Array<MovieClip>>;
    private var innerContainer:Sprite = new Sprite();

    private var trajectory:Array<Array<Point>>;

    private var tick:Int = 0;

    public function update()
    {
        moveParticles();
        tick++;
    }

    public function moveSoul(newx:Float, newy:Float)
    {
        soul.x = newx;
        soul.y = newy;
    }

    private function moveParticles()
    {
        for (i in 0...particles.length)
            for (p in particles[i])
            {
                var traj:Point = trajectory[i][tick];
                p.x += traj.x;
                p.y += traj.y;
            }
    }

    public function terminate(callback:Void->Void)
    {
        callback();//replace with: shrink bg; onOver -> callBack. BG should be saved to use it
    }

    public function vanish(i:Int, j:Int)
    {
        innerContainer.removeChild(particles[i][j]);
        particles[i].splice(j, 1);
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        innerContainer.addChild(soul);
        for (a in particles)
            for (p in a)
                innerContainer.addChild(p);
    }

    public function new(ability:ID, pattern:Array<Array<Point>>, trajectory:Array<Array<Point>>, dodgerElement:Element)
    {
        super();
        this.trajectory = trajectory;
        soul = Assets.getSoul(dodgerElement);
        soul.x = BG_RECT.width / 2;
        soul.y = BG_RECT.height / 2;
        particles = [];
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
        bg.graphics.lineStyle(5, 0xDDDDDD, 1, false, null, CapsStyle.SQUARE, JointStyle.MITER);
        bg.graphics.beginFill(0x111111);
        bg.graphics.drawRect(BG_RECT.x, BG_RECT.y, BG_RECT.width, BG_RECT.height);
        bg.graphics.endFill();
        addChild(bg);
        addChild(innerContainer);
        var msk:Sprite = new Sprite();
        msk.graphics.beginFill(0x111111);
        msk.graphics.drawRect(BG_RECT.x + 2.5, BG_RECT.y + 2.5, BG_RECT.width - 5, BG_RECT.height - 5);
        msk.graphics.endFill();
        innerContainer.addChild(msk);
        innerContainer.mask = msk;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}