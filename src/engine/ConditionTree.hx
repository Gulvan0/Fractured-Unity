package engine;
import hxassert.Assert;
using Lambda;

enum TreeVertice<T, L>
{
    Node(condition:T->Bool, children:Array<TreeVertice<T, L>>);
    Leaf(condition:T->Bool, data:L);
}

class ConditionTree<T, L>
{
    public var root:TreeVertice<T, L>;

    public function retrieve(arg:T):Null<L>
    {
        return retrieveFrom(arg, root);
    }

    private function retrieveFrom(arg:T, departure:TreeVertice<T, L>):Null<L>
    {
        switch departure 
        {
            case Node(condition, children):
                if (condition(arg))
                    for (child in children)
                    {
                        var result = retrieveFrom(arg, child);
                        if (result != null)
                            return result;
                    }
                return null; 
            case Leaf(condition, data): 
                if (condition(arg))
                    return data;
                else
                    return null; 
        }
    }

    public function addNode(condition:T->Bool, parentPosition:Array<Int>) 
    {
        addVert(Node(condition, []), parentPosition);
    }

    public function addLeaf(condition:T->Bool, data:L, parentPosition:Array<Int>) 
    {
        addVert(Leaf(condition, data), parentPosition);
    }

    private function addVert(vert:TreeVertice<T, L>, parentPosition:Array<Int>) 
    {
        var current:TreeVertice<T, L> = root;
        for (ind in parentPosition)
            switch current 
            {
                case Node(_, children) if (children.length <= ind): Assert.fail("Not enough children");
                case Node(_, children): current = children[ind];
                case Leaf(_, data): Assert.fail("Expected node, but found leaf");
            }
        switch current 
        {
            case Node(condition, children): children.push(vert);
            case Leaf(condition, data): Assert.fail("Expected node, but found leaf");
        }
    }

    public function new() 
    {
        root = Node(t->true, []);
    }
}