package bh;

import graphic.Align;
import graphic.components.VBox;
import ID.BuffID;
import battle.Common.ChooseResult;
import battle.Ability;
import hxassert.Assert;
import graphic.Utils;
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
using graphic.SpriteExtension;
using Lambda;

class BHGame extends Sprite
{
    private var DEFAULT_SOUL_VELOCITY:Int = 7;
    private var SOUL_VELOCITY:Int;
    private var BG_RECT:Rectangle = new Rectangle(0, 0, GameRules.bhRectW, GameRules.bhRectH);
    private var editorReturnPoint:Null<Void->Void>;
    private var bhSkillKeycodes:Map<Int, Ability>;
    private var chooseChecker:Null<Ability->ChooseResult>;
    private var activeSkills:Array<AbilityID>;
    private var effects:Array<BuffID>;

    private var soul:Soul;
    private var innerContainer:Sprite;

    private var particles:Array<Particle> = [];
    private var dispensers:Array<IDispenser> = [];
    private var effectIcons:VBox = new VBox(Assets.FULL_ABILITY_RADIUS*2, null, 5);

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
        if (editorReturnPoint == null)
            ConnectionManager.sendBHTick(tick, soul.x, soul.y);
        tick++;
        if (tick == GameRules.bhTicksDuration)
        {
            if (editorReturnPoint != null)
                terminate(editorReturnPoint);
            else
                ConnectionManager.notifyFinished();
            for (p in particles)
                innerContainer.removeChild(p);
            isOver = true;
        }
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

    private function moveSoul()
    {
        var sv:Point = new Point(soulVel.x, soulVel.y);
        sv.normalize(SOUL_VELOCITY);
        for (id in effects)
            sv = applyEffect(id, sv);
        soul.x = MathUtils.fit(soul.x + sv.x, BG_RECT.x + soul.width, BG_RECT.x + BG_RECT.width - soul.width);
        soul.y = MathUtils.fit(soul.y + sv.y, BG_RECT.y + soul.height, BG_RECT.y + BG_RECT.height - soul.height);
    }

    public function terminate(callback:Void->Void)
    {
        timer.stop();
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, onPressed);
        stage.removeEventListener(KeyboardEvent.KEY_UP, onReleased);
        callback();//replace with: shrink bg; onOver -> callBack. BG should be saved to use it
    }

    private function boom()
    {
        ConnectionManager.notifyBoom();
        soul.blink();
        Sounds.BH_DAMAGE.play();
    }

    private function onPressed(e:KeyboardEvent)
    {
        if (!pressed[e.keyCode])
        {
            pressed[e.keyCode] = true;
            switch (Controls.map.get(e.keyCode))
            {
                case BH_UP: soulVel.y -= 1;
                case BH_DOWN: soulVel.y += 1;
                case BH_LEFT: soulVel.x -= 1;
                case BH_RIGHT: soulVel.x += 1;
                default:
                    var bhSkill = bhSkillKeycodes.get(e.keyCode);
                    if (bhSkill != null)
                        useSkill(bhSkill);
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
        timer = new Timer(GameRules.bhTickInterval);
        timer.run = update;
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

    /**Doesn't filter non-danmaku effects**/
    public function new(dispenserData:Array<BehaviourData>, ?dodgerElement:Element, ?bhSkillKeycodes:Map<Int, Ability>, effects:Array<BuffID>, chooseChecker:Ability->ChooseResult, ?editorReturnPoint:Void->Void)
    {
        super();
        createBGAndMask();
        createSoul(dodgerElement);
        createDispensers(dispenserData);
        this.add(effectIcons, -effectIcons.w - 3, Assets.FULL_ABILITY_RADIUS);
        addEventListener(Event.ADDED_TO_STAGE, init);
        SOUL_VELOCITY = DEFAULT_SOUL_VELOCITY;
        this.editorReturnPoint = editorReturnPoint;
        this.bhSkillKeycodes = bhSkillKeycodes == null? [] : bhSkillKeycodes;
        this.chooseChecker = chooseChecker;
        this.activeSkills = [];
        this.effects = [];
        for (e in effects)
            castEffect(e);
    }

    /**Used to cast new effects during BHGame. Doesn't filter non-danmaku effects**/
    public function castEffect(effect:BuffID)
    {
        effects.push(effect);
        effectIcons.addComponent(Assets.getBuffIcon(effect, true, true), Align.Center);
    }

    /**Used to remove effects during BHGame**/
    public function removeEffect(effect:BuffID)
    {
        var index = effects.findIndex(e->e==effect);
        effectIcons.removeComponentAt(index);
        effects.splice(index, 1);
    }

    //=======================================================================================================================================================

    private function useSkill(ab:Ability) 
    {
        if (chooseChecker(ab) != ChooseResult.BHSkill || activeSkills.has(ab.id))
        {
            Sounds.WARN.play();
            return;
        }
        ConnectionManager.useBHAbility(ab.id);
        switch ab.id
        {
            case LgDash: dash();
            default: Assert.fail('$ab is not a danmaku skill');
        }
    }
    
    private function dash() 
    {
        var timeout:Timer = new Timer(200);
        timeout.run = function () {
            removeEffect(BuffID.LgDash);
            timeout.stop();
            activeSkills.remove(LgDash);
        }
        activeSkills.push(LgDash);
        castEffect(BuffID.LgDash);
    }

    //===========================================================================================================================================================

    private function applyEffect(id:BuffID, sv:Point):Point
    {
        switch id
        {
            case LgMagnetized: return magnetized(sv);
            case LgDash: return dashBuff(sv);
            default: 
                Assert.fail('$id is not a danmaku effect');
                return new Point(0,0);
        }
    }

    private function magnetized(sv:Point):Point
    {
        var soulPos:Point = new Point(soul.x, soul.y);
        var centripetal:Point = GameRules.bhCenter.subtract(soulPos);
        centripetal.normalize(DEFAULT_SOUL_VELOCITY/2);
        return sv.add(centripetal);
    }

    private function dashBuff(sv:Point):Point
    {
        var newVel = new Point(sv.x, sv.y);
        newVel.normalize(sv.length*2);
        return newVel;
    }

}