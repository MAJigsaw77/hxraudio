package hxraudio;

#if (!cpp && macro)
#error 'RAudio supports only C++ target platforms.'
#end
import hxraudio.Types;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
extern class RAudio
{
	// Audio device management functions

	@:native('InitAudioDevice')
	static function InitAudioDevice():Void;

	@:native('CloseAudioDevice')
	static function CloseAudioDevice():Void;

	@:native('IsAudioDeviceReady')
	static function IsAudioDeviceReady():Bool;

	// Set master volume (listener)
	@:native('SetMasterVolume')
	static function IsAudioDeviceReady(volume:Single):Void;

	// Wave/Sound loading/unloading functions

	// Load wave data from file
	@:native('LoadWave')
	static function LoadWave(fileName:cpp.ConstCharStar):Wave;

	// Load wave from memory buffer, fileType refers to extension: i.e. ".wav"
	@:native('LoadWaveFromMemory')
	static function LoadWaveFromMemory(fileType:cpp.ConstCharStar, fileData:cpp.RawConstPointer<cpp.UInt8>, dataSize:Int):Wave;

	// Checks if wave data is ready
	@:native('IsWaveReady')
	static function IsWaveReady(wave:Wave):Bool;

	// Load sound from file
	@:native('LoadSound')
	static function LoadSound(fileName:cpp.ConstCharStar):Sound;

	// Load sound from wave data
	@:native('LoadSoundFromWave')
	static function LoadSoundFromWave(wave:Wave):Sound;

	// Checks if a sound is ready
	@:native('IsSoundReady')
	static function IsSoundReady(sound:Sound):Bool;

	// Update sound buffer with new data
	@:native('UpdateSound')
	static function UpdateSound(sound:Sound, data:cpp.RawConstPointer<cpp.Void>, samplesCount:Int):Void;

	// Unload wave data
	@:native('UnloadWave')
	static function UnloadWave(wave:Wave):Void;

	// Unload sound
	@:native('UnloadSound')
	static function UnloadSound(sound:Sound):Void;

	// Export wave data to file, returns true on success
	@:native('ExportWave')
	static function ExportWave(wave:Wave, fileName:cpp.ConstCharStar):Bool;

	// Export wave sample data to code (.h), returns true on success
	@:native('ExportWaveAsCode')
	static function ExportWaveAsCode(wave:Wave, fileName:cpp.ConstCharStar):Bool;
	
	// Wave/Sound management functions

	// Play a sound
	@:native('PlaySound')
	static function PlaySound(sound:Sound):Void;

	// Stop playing a sound
	@:native('StopSound')
	static function StopSound(sound:Sound):Void;

	// Pause a sound
	@:native('PauseSound')
	static function PauseSound(sound:Sound):Void;

	// Resume a paused sound
	@:native('ResumeSound')
	static function ResumeSound(sound:Sound):Void;

	// Check if a sound is currently playing
	@:native('IsSoundPlaying')
	static function IsSoundPlaying(sound:Sound):Bool;

	// Set volume for a sound (1.0 is max level)
	@:native('SetSoundVolume')
	static function SetSoundVolume(sound:Sound, volume:Single):Void;

	// Set pitch for a sound (1.0 is base level)
	@:native('SetSoundPitch')
	static function SetSoundPitch(sound:Sound, pitch:Single):Void;

	// Set pan for a sound (0.0 to 1.0, 0.5=center)
	@:native('SetSoundPan')
	static function SetSoundPan(sound:Sound, pan:Single):Void;

	// Copy a wave to a new wave
	@:native('WaveCopy')
	static function WaveCopy(wave:Wave):Wave;

	// Crop a wave to defined samples range
	@:native('WaveCrop')
	static function WaveCrop(wave:cpp.RawPointer<Wave>, initSample:Int, finalSample:Int):Void;

	// Convert wave data to desired format
	@:native('WaveFormat')
	static function WaveFormat(wave:cpp.RawPointer<Wave>, initSample:Int, finalSample:Int, channels:Int):Void;

	// Load samples data from wave as a floats array
	@:native('LoadWaveSamples')
	static function LoadWaveSamples(wave:Wave):cpp.RawPointer<Single>;

	// Unload samples data loaded with LoadWaveSamples()
	@:native('UnloadWaveSamples')
	static function UnloadWaveSamples(samples:cpp.RawPointer<Single>):Void;
	
	// Music management functions

	// Load music stream from file
	@:native('LoadMusicStream')
	static function LoadWave(fileName:cpp.ConstCharStar):Music;

	// Load music stream from data
	@:native('LoadMusicStreamFromMemory')
	static function LoadWaveFromMemory(fileType:cpp.ConstCharStar, fileData:cpp.RawConstPointer<cpp.UInt8>, dataSize:Int):Music;

	// Checks if a music stream is ready
	@:native('IsMusicReady')
	static function IsMusicReady(music:Music):Bool;

	// Unload music stream
	@:native('UnloadMusicStream')
	static function UnloadMusicStream(music:Music):Void;

	// Start music playing
	@:native('PlayMusicStream')
	static function PlayMusicStream(music:Music):Void;

	// Check if music is playing
	@:native('IsMusicStreamPlaying')
	static function IsMusicStreamPlaying(music:Music):Bool;

	// Updates buffers for music streaming
	@:native('UpdateMusicStream')
	static function UpdateMusicStream(music:Music):Void;

	// Stop music playing
	@:native('StopMusicStream')
	static function StopMusicStream(music:Music):Void;

	// Pause music playing
	@:native('PauseMusicStream')
	static function PauseMusicStream(music:Music):Void;

	// Resume playing paused music
	@:native('ResumeMusicStream')
	static function ResumeMusicStream(music:Music):Void;

	// Seek music to a position (in seconds)
	@:native('SeekMusicStream')
	static function SeekMusicStream(music:Music, position:Single):Void;

	// Set volume for music (1.0 is max level)
	@:native('SetMusicVolume')
	static function SetMusicVolume(music:Music, volume:Single):Void;

	// Set pitch for a music (1.0 is base level)
	@:native('SetMusicPitch')
	static function SetMusicPitch(music:Music, pitch:Single):Void;

	// Set pan for a music (0.0 to 1.0, 0.5=center)
	@:native('SetMusicPan')
	static function SetMusicPan(music:Music, pan:Single):Void;

	// Get music time length (in seconds)
	@:native('GetMusicTimeLength')
	static function GetMusicTimeLength(music:Music):Single;

	// Get current music time played (in seconds)
	@:native('GetMusicTimePlayed')
	static function GetMusicTimePlayed(music:Music):Single;
}
