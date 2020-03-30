package bh;

import openfl.text.TextField;
import bh.enums.Property;

class Writer
{

    private var object:PropObj;

    public function represent(v:Dynamic, property:Property):TextField
    {
        switch (property)
        {
            
        }
    }

    public function new(object:PropObj) 
    {
        this.object = object;
    }
}