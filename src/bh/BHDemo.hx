package bh;

import graphic.Sounds;
import graphic.Utils;
import bh.dispensers.IDispenser;
import bh.enums.DispenserType;
import graphic.Shapes;
import struct.Element;
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
using graphic.SpriteExtension;

class BHDemo extends Sprite
{
    private var SOUL_VELOCITY:Int = 7;
    private var BG_RECT:Rectangle = new Rectangle(0, 0, GameRules.bhRectW, GameRules.bhRectH);

    private var soul:Soul;
    private var innerContainer:Sprite;

    private var particles:Array<Particle> = [];
    private var dispensers:Array<IDispenser> = [];

    public function tick(soulx:Float, souly:Float)
    {
        soul.x = soulx;
        soul.y = souly;
        update();
    }

    private function update()
    {
        updateParticles();
        updateDispensers();
    }

    private function addParticles(ar:Array<Particle>)
    {
        for (p in ar)
        {
            particles.push(p);
            innerContainer.addChild(p);
        }
    }

    private function updateParticles()
    {
        var i:Int = 0;
        while (i < particles.length)
        {
            particles[i].tick();
            if (Utils.overlaps(soul, particles[i], stage))
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

    private function boom()
    {
        soul.blink();
        Sounds.BH_DAMAGE.play();
    }

    private function createSoul(?element:Element)
    {
        soul = new Soul(element);
        soul.x = GameRules.bhSoulX;
        soul.y = GameRules.bhSoulY;
        innerContainer.addChild(soul);
    }

    private function createDispensers(data:Array<BehaviourData>)
    {
        for (d in data)
            dispensers = dispensers.concat(DispenserFactory.buildDispensers(d));
        for (disp in dispensers)
            if (disp.getType() != DispenserType.Geyser)
                innerContainer.addChild(cast disp);
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

    public function new(dispenserData:Array<BehaviourData>, ?dodgerElement:Element)
    {
        super();
        createBGAndMask();
        createSoul(dodgerElement);
        createDispensers(dispenserData);
    }
}