package ; #if !flash


import format.swf.instance.MovieClip;
import format.SWF;
import openfl.Assets;


class Buff5 extends MovieClip {
	
	
	public function new () {
		
		if (!SWF.instances.exists ("libraries/gfx/gfx.swf")) {
			
			SWF.instances.set ("libraries/gfx/gfx.swf", new SWF (Assets.getBytes ("libraries/gfx/gfx.swf")));
			
		}
		
		var swf = SWF.instances.get ("libraries/gfx/gfx.swf");
		var symbol = swf.data.getCharacter (46);
		
		super (cast symbol);
		
	}
	
	
}


#else
@:bind class Buff5 extends flash.display.MovieClip {
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end