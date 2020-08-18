package;

import hxassert.Assert;

class Biection<V1, V2>
{
    private static var array1:Array<V1> = [];
    private static var array2:Array<V2> = [];

    public function getV2(v1:V1):V2
    {
        return array2[array1.indexOf(v1)];
    }
    
    public function getV1(v2:V2):V1
    {
        return array1[array2.indexOf(v2)];
    }
    
    public function set(v1:V1, v2:V2) 
    {
        array1.push(v1);
        array2.push(v2);
    }

    public function removeByV1(v1:V1) 
    {
        removeByIndex(array1.indexOf(v1));
    }

    public function removeByV2(v2:V2) 
    {
        removeByIndex(array2.indexOf(v2));
    }

    private function removeByIndex(i:Int)
    {
        array1.splice(i, 1);
        array2.splice(i, 1);
    }

    public function v1keys():Array<V1>
    {
        return array1.copy();
    }

    public function v2keys():Array<V2>
    {
        return array2.copy();
    }

    public function empty():Bool
    {
        return Lambda.empty(array1);
    }

    public function new(?values1:Array<V1>, ?values2:Array<V2>)
    {
        if (values1 != null && values2 != null)
        {
            Assert.assert(values1.length == values2.length);
            array1 = values1.copy();
            array2 = values2.copy();
        }
    }
}