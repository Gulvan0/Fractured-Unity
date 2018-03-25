package battle.struct;

/**
 * Iterator for UPair class
 * @author Gulvan
 */
class UPairIterator<T>
{
	private var pair:UPair<T>;
	private var i:Int;
	
	public function hasNext()
	{
		return i < pair.left.length + pair.right.length;
	}
	
	public function next()
	{
		if (i < pair.left.length)
			return pair.left[i++];
		else
			return pair.right[i++ - pair.left.length];
	}
	
	public function new(pair:UPair<T>) 
	{
		this.pair = pair;
		this.i = 0;
	}
	
}