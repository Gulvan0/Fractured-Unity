package battle;

import openfl.media.SoundChannel;
import graphic.Sounds;
import openfl.media.Sound;

class SoundPlayer 
{
    public var bgm:SoundChannel;

	public function init() 
	{
		bgm = Sounds.BATTLEBGM1.play(0, 100);
	}
	
	public function deInit()
	{
		bgm.stop();
	}
	
	public function death():Void 
	{
		
	}
	
	public function abSelected():Void 
	{
		
	}
	
	public function warn():Void 
	{
		
	}

    public function new() 
	{
		
	}
	
}