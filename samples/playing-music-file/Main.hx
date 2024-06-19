package;

import hxraudio.RAudio;
import hxraudio.Types;
import sys.thread.Thread;

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

	char buffer[256] = { 0 };

	strcpy(buffer, text);
	strcat(buffer, "\\n");

	vprintf(buffer, args);

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
