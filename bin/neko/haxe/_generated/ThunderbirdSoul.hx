package ; #if !flash


import openfl._internal.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.Assets;


class ThunderbirdSoul extends MovieClip {
	
	
	
	
	public function new () {
		
		super ();
		
		/*
		if (!SWFLite.instances.exists ("lib/AssetSource/AssetSource.bin")) {
			
			SWFLite.instances.set ("lib/AssetSource/AssetSource.bin", SWFLite.unserialize (Assets.getText ("lib/AssetSource/AssetSource.bin")));
			
		}
		*/
		
		var swfLite = SWFLite.instances.get ("lib/AssetSource/AssetSource.bin");
		var symbol = swfLite.symbols.get (23);
		
		__fromSymbol (swfLite, cast symbol);
		
	}
	
	
}


#else
@:bind @:native("ThunderbirdSoul") class ThunderbirdSoul extends flash.display.MovieClip {
	
	
	
	
	public function new () {
		
		super ();
		
	}
	
	
}
#end