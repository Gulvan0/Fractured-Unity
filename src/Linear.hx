package;

/**
 * Represents a linear equation
 * @author Gulvan
 */
class Linear 
{
	
	public var k:Float;
	public var b:Float;
	
	public static function combination(linears:Array<Linear>):Linear
	{
		var result:Linear = new Linear(1, 0);
		
		for (lin in linears)
		{
			result.k *= lin.k;
			result.b += lin.b;
		}
		
		return result;
	}
	
	public function apply(x:Float):Float
	{
		return k * x + b;
	}
	
	public function combine(lin2:Linear)
	{
		this.k *= lin2.k;
		this.b += lin2.b;
	}
	
	public function detach(lin2:Linear)
	{
		this.k /= lin2.k;
		this.b -= lin2.b;
	}
	
	public function toString():String
	{
		return "" + k + "x + " + b; 
	}
	
	public function new(k:Float, b:Float) 
	{
		this.k = k;
		this.b = b;
	}
	
}