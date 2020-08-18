package bh.trajectories;

import engine.Vect;
import openfl.geom.Point;

interface ITrajectory 
{
    public function nextPos(localTime:Int):Point;
    public function rotate(angle:Float):Void; 
    public function move(dr:Vect):Void;
    public function copy():ITrajectory;     
}