package ;


import format.swf.lite.MovieClip;
import format.swf.lite.SWFLite;
import openfl.Assets;


class HighVoltage extends MovieClip {
	
	
	
	
	
	public function new () {
		
		if (!SWFLite.instances.exists ("lib/AssetSource/AssetSource.dat")) {
			
			SWFLite.instances.set ("lib/AssetSource/AssetSource.dat", SWFLite.unserialize (Assets.getText ("lib/AssetSource/AssetSource.dat")));
			
		}
		
		var swfLite = SWFLite.instances.get ("lib/AssetSource/AssetSource.dat");
		var symbol = swfLite.symbols.get (29);
		
		super (swfLite, cast symbol);
		
	}
	
	
}