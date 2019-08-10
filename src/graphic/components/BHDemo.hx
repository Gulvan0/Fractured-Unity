package graphic.components;

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
    private var BG_RECT:Rectangle = new Rectangle(0, 0, 750, 250);

    private var soul:Sprite;
    private var particles:Array<Array<Sprite>>;
    private var innerContainer:Sprite = new Sprite();

    private var trajectory:Array<Int->Point>;

    private var tick:Int = 0;
    private var timer:Timer;

    private function update()
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
        var j = 0;
        for (i in 0...particles.length)
            while (j < particles[i].length)
            {
                var p = particles[i][j];
                var traj:Point = trajectory[i](tick);
                p.x += traj.x;
                p.y += traj.y;
            }
    }

    public function terminate(callback:Void->Void)
    {
        timer.stop();
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
        timer = new Timer(25);
        timer.run = update;
    }

    public function new(ability:ID, pattern:Array<Array<Point>>, trajectory:Array<Int->Point>)
    {
        super();
        this.trajectory = trajectory;
        soul = Assets.getSoul();
        soul.x = soul.width * 2;
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