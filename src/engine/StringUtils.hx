package engine;

import hxassert.Assert;

class StringIterator 
{
    var s:String;
    var i:Int;
  
    public function new(s:String) 
    {
        this.s = s;
        i = 0;
    }
  
    public function hasNext() 
    {
        return i < s.length;
    }
  
    public function next() 
    {
        return s.charAt(i++);
    }
}

class StringUtils 
{

    public inline static function insert(s:String, pos:Int, block:String):String
    {
        return s.substring(0, pos) + block + s.substring(pos);
    }

    public inline static function lastChar(s:String):String
    {
        return s.charAt(s.length-1);
    }

    public inline static function firstChar(s:String):String
    {
        return s.charAt(0);
    }

    public static function countChars(s:String, char:String):Int
    {
        Assert.require(char.length == 1);
        var count:Int = 0;
        for (i in 0...s.length)
            if (s.charAt(i) == char)
                count++;
        return count;
    }

    public static function iterator(s:String):StringIterator
    {
        return new StringIterator(s);
    }
}