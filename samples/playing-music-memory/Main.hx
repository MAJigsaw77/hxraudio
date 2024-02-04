package;

import haxe.io.BytesData;
import haxe.io.Path;
import hxraudio.RAudio;
import hxraudio.Types;
import sys.io.File;
import sys.thread.Thread;

@:headerInclude('stdarg.h')
@:cppInclude('raudio.h')
@:cppFileCode('
#undef TRACELOG
#define TRACELOG(level, ...) TraceLog(__VA_ARGS__)')
@:cppNamespaceCode('
void TraceLog(const char *text, ...)
{
	va_list args;

	va_start(args, text);

	char buffer[256] = { 0 };

	strcpy(buffer, text);
	strcat(buffer, "\\n");

	vprintf(buffer, args);

	va_end(args);
}')
class Main
{
	private static final path:String = 'star.ogg';

	public static function main():Void
	{
		final data:BytesData = File.getBytes(path).getData();

		// Initialization
		RAudio.InitAudioDevice();

		var music:Music = RAudio.LoadMusicStreamFromMemory("." + Path.extension(path), cpp.Pointer.ofArray(data).constRaw, data.length);

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
