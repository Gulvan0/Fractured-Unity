package bh;

import bh.dispensers.IDispenser;
import bh.enums.DispenserType;
import graphic.Shapes;
import struct.Element;
import ID.AbilityID;
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
import graphic.Sounds;
using engine.MathUtils;

class BHGame extends SSprite
{
    private var SOUL_VELOCITY:Int = 7;
    private var BG_RECT:Rectangle = new Rectangle(0, 0, GameRules.bhRectW, GameRules.bhRectH);

    private var soul:Soul;
    private var innerContainer:Sprite;

    private var particles:Array<Particle> = [];
    private var dispensers:Array<IDispenser> = [];

    private var soulVel:Point = new Point(0, 0);
    private var tick:Int = 0;
    private var isOver:Bool = false;
    private var pressed:Array<Null<Bool>> = [];

    private var timer:Timer;

    private function update()
    {
        moveSoul();
        if (isOver)
            return;

        updateParticles();
        updateDispensers();
        ConnectionManager.sendBHTick(tick, soul.x, soul.y); //TODO: Change bhdemo networking
        tick++;
        if (tick == GameRules.bhTicksDuration)
        {
            ConnectionManager.notifyFinished();
            isOver = true;
        }
    }

    private function addParticles(ar:Array<Particle>)
    {
        for (p in ar)
        {
            particles.push(p);
            addChild(p);
        }
    }

    private function updateParticles()
    {
        var i:Int = 0;
        while (i < particles.length)
        {
            particles[i].tick();
            if (overlaps(soul, particles[i]))
            {
                innerContainer.removeChild(particles[i]);
                particles.splice(i, 1);
                boom();
            }
            else
                i++;
        }
    }

    private function updateDispensers()
    {
        var i:Int = 0;
        while (i < dispensers.length)
        {
            addParticles(dispensers[i].tick());
            if (dispensers[i].getType() == DispenserType.Obstacle)
                dispensers.splice(i, 1);
            else
                i++;
        }
    }

    private function moveSoul()
    {
        var sv:Point = new Point(soulVel.x, soulVel.y);
        sv.normalize(SOUL_VELOCITY);
        //process sv by buff queue -> var ----------------------------------> ALPHA 5.0
        soul.x = MathUtils.fit(soul.x + sv.x, BG_RECT.x + soul.width, BG_RECT.x + BG_RECT.width - soul.width);
        soul.y = MathUtils.fit(soul.y + sv.y, BG_RECT.y + soul.height, BG_RECT.y + BG_RECT.height - soul.height);
    }

    public function terminate(callback:Void->Void)
    {
        timer.stop();
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.removeEventListener(KeyboardEvent.KEY_UP, onReleased);
        //new listeners for BH abilities removal point --------> ALPHA 8.0
        callback();//replace with: shrink bg; onOver -> callBack. BG should be saved to use it
    }

    private function boom()
    {
        ConnectionManager.notifyBoom();
        soul.blink();
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
    }

    private function init(e)
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.addEventListener(KeyboardEvent.KEY_UP, onReleased);
        //there will be new listeners for BH abilities -------------> ALPHA 8.0
        timer = new Timer(GameRules.bhTickInterval);
        timer.run = update;
    }

    private function createSoul(element:Element)
    {
        soul = new Soul(element);
        soul.x = BG_RECT.width / 2;
        soul.y = BG_RECT.height / 2;
        innerContainer.addChild(soul);
    }

    private function createDispensers(data:Array<BehaviourData>)
    {
        for (d in data)
            dispensers.concat(DispenserFactory.buildDispensers(d));
        for (disp in dispensers)
            addChild(cast disp);
    }

    private function createBGAndMask()
    {
        var bg:Sprite = Shapes.rect(BG_RECT.width, BG_RECT.height, 0xDDDDDD, 5, LineStyle.Square, 0x111111);
        addChild(bg);
        innerContainer = new Sprite();
        var msk:Sprite = Shapes.fillOnlyRect(BG_RECT.width - 5, BG_RECT.height - 5, 0x111111, BG_RECT.x + 2.5, BG_RECT.y + 2.5);
        innerContainer.addChild(msk);
        innerContainer.mask = msk;
        addChild(innerContainer);
    }

    public function new(dispenserData:Array<BehaviourData>, dodgerElement:Element)
    {
        super();
        createSoul(dodgerElement);
        createDispensers(dispenserData);
        createBGAndMask();
        addEventListener(Event.ADDED_TO_STAGE, init);
    }
}