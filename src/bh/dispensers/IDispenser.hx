package bh.dispensers;

import bh.enums.DispenserType;

interface IDispenser 
{
    public function tick():Array<Particle>;
    public function getType():DispenserType;
}