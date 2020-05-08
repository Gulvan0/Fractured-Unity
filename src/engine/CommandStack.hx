package engine;

class CommandStack 
{
    public var returnStack(default, null):Array<Void->Void>;
    public var repeatStack(default, null):Array<Void->Void>;
    public var pointer(default, null):Int;

    public function addEntry(returnFunc:Void->Void, repeatFunc:Void->Void) 
    {
        if (canForward())
        {
            var truncateLength:Int = returnStack.length - pointer;
            returnStack.splice(pointer, truncateLength);
            repeatStack.splice(pointer, truncateLength);
        }
        returnStack.push(returnFunc);
        repeatStack.push(repeatFunc);
        pointer++;
    }

    public function backward() 
    {
        if (canBackward())
        {
            pointer--;
            returnStack[pointer]();
        }
    }

    public function forward() 
    {
        if (canForward())
        {
            repeatStack[pointer]();
            pointer++;
        }
    }

    public function canBackward():Bool
    {
        return pointer > 0;
    }

    public function canForward():Bool
    {
        return pointer < returnStack.length;
    }

    public function clear() 
    {
        returnStack = [];
        repeatStack = [];
        pointer = 0;
    }

    public function new() 
    {
        clear();
    }
}