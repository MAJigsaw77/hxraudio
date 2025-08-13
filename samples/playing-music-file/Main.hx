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

		RAudio.SetMusicPitch(music, 0.5);

		RAudio.PlayMusicStream(music);

		Thread.create(function()
		{
			while (RAudio.IsMusicStreamPlaying(music))
			{
				RAudio.UpdateMusicStream(music);

				Sys.sleep(0.001);
			}
		});

		Sys.sleep(30);
		
		// Deinitialization
		RAudio.StopMusicStream(music);
		RAudio.UnloadMusicStream(music);
		RAudio.CloseAudioDevice();
	}
}
