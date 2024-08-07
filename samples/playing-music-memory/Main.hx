package;

import haxe.io.BytesData;
import haxe.io.Path;
import hxraudio.RAudio;
import hxraudio.Types;
import sys.io.File;
import sys.thread.Thread;

#if android
@:headerInclude('android/log.h')
#end
@:headerInclude('stdarg.h')
@:headerCode('
#undef TRACELOG

#define TRACELOG(level, ...) TraceLog(__VA_ARGS__)
')
@:headerNamespaceCode('
static void TraceLog(const char *text, ...)
{
	va_list args;

	va_start(args, text);

	#ifdef __ANDROID__
	__android_log_vprint(ANDROID_LOG_INFO, "raudio", text, args);
	#else
	vprintf(text, args);
	printf("\\n");
	#endif

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
