package;

import haxe.io.Bytes;
import haxe.io.BytesData;
import haxe.Http;
import hxraudio.RAudio;
import hxraudio.Types;
import sys.thread.Thread;

class Main
{
	public static function main():Void
	{
		// Initialization
		RAudio.InitAudioDevice();

		var http:Http = new Http('https://github.com/Rovoska/undertale/raw/master/sound/audio/mus_mysteriousroom2.ogg');
		http.onBytes = function(bytes:Bytes)
		{
			final data:BytesData = bytes.getData();

			var music:Music = RAudio.LoadMusicStreamFromMemory(".ogg", cpp.Pointer.ofArray(data).constRaw, data.length);

			RAudio.PlayMusicStream(music);

			Thread.create(function()
			{
				while (RAudio.IsMusicStreamPlaying(music))
					RAudio.UpdateMusicStream(music);
			});

			Sys.sleep(30); // Wait 30 seconds until deinitializatinon.

			// De-Initialization
			RAudio.StopMusicStream(music);
			RAudio.UnloadMusicStream(music);
		}
		http.onError = (message:String) -> Sys.println('Encountered a error: $message');
		http.request(true);

		Sys.sleep(10); // Wait 10 seconds until deinitializatinon.

		RAudio.CloseAudioDevice();
	}
}
