package;

import haxe.io.BytesData;
import hxraudio.RAudio;
import hxraudio.Types;
import sys.io.File;
import sys.thread.Thread;

class Main
{
	public static function main():Void
	{
		var data:BytesData = File.getBytes("star.ogg").getData();

		// Initialization
		RAudio.InitAudioDevice();

		var music:Music = RAudio.LoadMusicStreamFromMemory(".ogg", untyped __cpp__('&({0}[0])', data), data.length);

		RAudio.PlayMusicStream(music);

		Thread.create(function()
		{
			while (RAudio.IsMusicStreamPlaying(music))
				RAudio.UpdateMusicStream(music);
		});

		Sys.sleep(30); // Wait 30 seconds until deinitialization
		
		// De-Initialization
		RAudio.StopMusicStream(music);
		RAudio.UnloadMusicStream(music);
		RAudio.CloseAudioDevice();
	}
}
