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
using MathUtils;

class BHGame extends SSprite
{
    private var SOUL_VELOCITY:Int = 7;
    private var BG_RECT:Rectangle = new Rectangle(0, 0, 750, 250);

    private var soul:Sprite;
    private var particles:Array<Array<Sprite>>;
    private var innerContainer:Sprite = new Sprite();
    private var debugTF:TextField = new TextField(); //debugTF code should be removed on release
    private var particleActivated:Array<Array<Bool>>;

    private var trajectory:Array<Int->Point>;

    private var soulVel:Point = new Point(0, 0);
    private var tick:Int = 0;
    private var free:Bool = false;
    private var pressed:Array<Null<Bool>> = [];

    private var timer:Timer;

    private function update()
    {
        moveSoul();
        if (!free)
        {
            ConnectionManager.sendBHTick(tick, soul.x, soul.y);
            moveParticles();
            tick++;
            if (tick % 100 == 75)
                ConnectionManager.requestAdditionalTrajBuffer(Math.ceil(tick / 100), function (a:Array<Array<Point>>)
                {
                    var trajcopy = trajectory.copy();
                    trajectory = [for (i in 0...a.length) function (tick) {return (tick >= 100 * Math.ceil(tick / 100))? a[i][tick] : trajcopy[i](tick);}];
                });
            for (a in particles)
                if (!Lambda.empty(a))
                    return;
            free = true;
        }
    }

    private function moveSoul()
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
                
                var intersects:Bool = p.getBounds(this).intersects(BG_RECT);
                if (intersects && !particleActivated[i][j])
                    particleActivated[i][j] = true;
                if (!intersects && particleActivated[i][j])
                    vanish(i, j);
                else if (overlaps(soul, p))
                {
                    vanish(i, j);
                    boom();
                }
                else
                    j++;
            }
    }

    public function terminate(callback:Void->Void)
    {
        timer.stop();
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.removeEventListener(KeyboardEvent.KEY_UP, onReleased);
        //new listeners for BH abilities removal point --------> ALPHA 8.0
        callback();//replace with: shrink bg; onOver -> callBack. BG should be saved to use it
    }

    private function vanish(i:Int, j:Int)
    {
        ConnectionManager.notifyVanish(tick, i, j);
        innerContainer.removeChild(particles[i][j]);
        particles[i].splice(j, 1);
    }

    private function boom()
    {
        ConnectionManager.notifyBoom();
        var timer:Timer;
        var t:Int = 0;
        function blink()
        {
            soul.alpha = t % 2 == 0? 0.3 : 1;
            if (t == 3)
                timer.stop();
            else 
                t++;
        }
        timer = new Timer(80);
        timer.run = blink;
        Sounds.BH_DAMAGE.play();
    }

    private function overlaps(soul:Sprite, particle:Sprite):Bool
    {
        var intersection:Rectangle = soul.getBounds(stage).intersection(particle.getBounds(stage));   
        if (!intersection.isEmpty()) 
        {
            for (dx in 0...(cast intersection.width))
                for (dy in 0...(cast intersection.height))
                    if (soul.hitTestPoint(intersection.x + dx, intersection.y + dy, true) && particle.hitTestPoint(intersection.x + dx, intersection.y + dy, true))
                        return true;
        }
        return false;
    }

    private function onPressed(e:KeyboardEvent)
    {
        if (!pressed[e.keyCode])
        {
            pressed[e.keyCode] = true;
            switch (e.keyCode)
            {
                case 38: soulVel.y -= 1;
                case 40: soulVel.y += 1;
                case 37: soulVel.x -= 1;
                case 39: soulVel.x += 1;
            }
        }
        debugTF.text = "PRESSED; " + soulVel;
    }

    private function onReleased(e:KeyboardEvent)
    {
        if (pressed[e.keyCode])
        {
            pressed[e.keyCode] = false;
            switch (e.keyCode)
            {
                case 40: soulVel.y -= 1;
                case 38: soulVel.y += 1;
                case 39: soulVel.x -= 1;
                case 37: soulVel.x += 1;
            }
        }
        debugTF.text = "RELEASED; " + soulVel;
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        innerContainer.addChild(soul);
        for (a in particles)
            for (p in a)
                innerContainer.addChild(p);
        add(debugTF, 1000, 300);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.addEventListener(KeyboardEvent.KEY_UP, onReleased);
        //there will be new listeners for BH abilities -------------> ALPHA 8.0
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
        particleActivated = [];
        for (i in 0...pattern.length)
        {
            particles[i] = [];
            particleActivated[i] = [];
            for (j in 0...pattern[i].length)
            {
                var particle = Assets.getParticle(ability);
                particle.x = pattern[i][j].x;
                particle.y = pattern[i][j].y;
                particles[i].push(particle);
                particleActivated[i].push(false);
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