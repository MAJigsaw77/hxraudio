package;

import hxraudio.RAudio;
import hxraudio.Types;
import sys.thread.Thread;

class Main
{
	public static function main():Void
	{
		// Initialization
		RAudio.InitAudioDevice();

		var music:Music = RAudio.LoadMusicStream("anothermedium.ogg");

		RAudio.PlayMusicStream(music);

		Thread.create(function()
		{
			RAudio.UpdateMusicStream(music);
		});

		Sys.sleep(20); // Wait 20 seconds until deinitialization
		
		// De-Initialization
		RAudio.UnloadMusicStream(music);
		RAudio.CloseAudioDevice();
	}
}
