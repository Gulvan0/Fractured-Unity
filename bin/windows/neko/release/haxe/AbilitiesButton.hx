package ;


import format.swf.lite.MovieClip;
import format.swf.lite.SWFLite;
import openfl.Assets;


class AbilitiesButton extends MovieClip {
	
	
	
	
	
	public function new () {
		
		if (!SWFLite.instances.exists ("lib/gfx/gfx.dat")) {
			
			SWFLite.instances.set ("lib/gfx/gfx.dat", SWFLite.unserialize (Assets.getText ("lib/gfx/gfx.dat")));
			
		}
		
		var swfLite = SWFLite.instances.get ("lib/gfx/gfx.dat");
		var symbol = swfLite.symbols.get (18);
		
		super (swfLite, cast symbol);
		
	}
	
	
}