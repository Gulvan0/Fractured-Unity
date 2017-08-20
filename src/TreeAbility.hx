package;

/**
 * ...
 * @author Gulvan
 */
class TreeAbility
{
	
	public var id(default, null):String;
	public var requires(default, null):Array<Int>;
	public var maxLvl(default, null):Int;
	
	public var currentLvl:Int;
	
	public function new(id:String) 
	{
		this.id = id;
		
		this.currentLvl = 0;
	}
	
}