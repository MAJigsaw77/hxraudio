package;

import hxraudio.RAudio;
import hxraudio.Types;
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
	switch (level)
	{
		case LIBVLC_DEBUG:
			__android_log_vprint(ANDROID_LOG_DEBUG, "raudio", text, args);
			break;
		case LIBVLC_NOTICE:
			__android_log_vprint(ANDROID_LOG_INFO, "raudio", text, args);
			break;
		case LIBVLC_WARNING:
			__android_log_vprint(ANDROID_LOG_WARN, "raudio", text, args);
			break;
		case LIBVLC_ERROR:
			__android_log_vprint(ANDROID_LOG_ERROR, "raudio", text, args);
			break;
		default:
			__android_log_vprint(ANDROID_LOG_VERBOSE, "raudio", text, args);
			break;
	}
	#else
	vprintf(text, args);

	printf("\\n");
	#endif

	va_end(args);
}')
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
				RAudio.UpdateMusicStream(music);
		});

		Sys.sleep(45); // Wait 45 seconds until deinitialization
		
		// Deinitialization
		RAudio.StopMusicStream(music);
		RAudio.UnloadMusicStream(music);
		RAudio.CloseAudioDevice();
	}
}
