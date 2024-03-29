package hxraudio;

#if !cpp
#error 'RAudio supports only C++ target platforms.'
#end
import hxraudio.Types;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
extern class RAudio
{
	// Audio device management functions

	// Initialize audio device and context
	@:native('InitAudioDevice')
	static function InitAudioDevice():Void;

	// Close the audio device and context
	@:native('CloseAudioDevice')
	static function CloseAudioDevice():Void;

	// Check if audio device has been initialized successfully
	@:native('IsAudioDeviceReady')
	static function IsAudioDeviceReady():Bool;

	// Set master volume (listener)
	@:native('SetMasterVolume')
	static function SetMasterVolume(volume:Single):Void;

	// Get master volume (listener)
	@:native('GetMasterVolume')
	static function GetMasterVolume():Single;

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

	// Create a new sound that shares the same sample data as the source sound, does not own the sound data
	@:native('LoadSoundAlias')
	static function LoadSoundAlias(source:Sound):Sound;

	// Checks if a sound is ready
	@:native('IsSoundReady')
	static function IsSoundReady(sound:Sound):Bool;

	// Update sound buffer with new data
	@:native('UpdateSound')
	static function UpdateSound(sound:Sound, data:cpp.RawConstPointer<cpp.Void>, frameCount:Int):Void;

	// Unload wave data
	@:native('UnloadWave')
	static function UnloadWave(wave:Wave):Void;

	// Unload sound
	@:native('UnloadSound')
	static function UnloadSound(sound:Sound):Void;

	// Unload a sound alias (does not deallocate sample data)
	@:native('UnloadSoundAlias')
	static function UnloadSoundAlias(alias:Sound):Void;

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
	static function LoadMusicStream(fileName:cpp.ConstCharStar):Music;

	// Load music stream from data
	@:native('LoadMusicStreamFromMemory')
	static function LoadMusicStreamFromMemory(fileType:cpp.ConstCharStar, fileData:cpp.RawConstPointer<cpp.UInt8>, dataSize:Int):Music;

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

	// AudioStream management functions

	// Load audio stream (to stream raw audio pcm data)
	@:native('LoadAudioStream')
	static function LoadAudioStream(sampleRate:cpp.UInt32, sampleSize:cpp.UInt32, channels:cpp.UInt32):AudioStream;

	// Checks if an audio stream is ready
	@:native('IsAudioStreamReady')
	static function IsAudioStreamReady(stream:AudioStream):Bool;

	// Unload audio stream and free memory
	@:native('UnloadAudioStream')
	static function UnloadAudioStream(stream:AudioStream):Void;

	// Update audio stream buffers with data
	@:native('UpdateAudioStream')
	static function UpdateAudioStream(stream:AudioStream, data:cpp.RawConstPointer<cpp.Void>, samplesCount:Int):Void;

	// Check if any audio stream buffers requires refill
	@:native('IsAudioStreamProcessed')
	static function IsAudioStreamProcessed(stream:AudioStream):Bool;

	// Play audio stream
	@:native('PlayAudioStream')
	static function PlayAudioStream(stream:AudioStream):Void;

	// Pause audio stream
	@:native('PauseAudioStream')
	static function PauseAudioStream(stream:AudioStream):Void;

	// Resume audio stream
	@:native('ResumeAudioStream')
	static function ResumeAudioStream(stream:AudioStream):Void;

	// Check if audio stream is playing
	@:native('IsAudioStreamPlaying')
	static function IsAudioStreamPlaying(stream:AudioStream):Bool;

	// Stop audio stream
	@:native('StopAudioStream')
	static function StopAudioStream(stream:AudioStream):Void;

	// Set volume for audio stream (1.0 is max level)
	@:native('SetAudioStreamVolume')
	static function SetAudioStreamVolume(stream:AudioStream, volume:Single):Void;

	// Set pitch for audio stream (1.0 is base level)
	@:native('SetAudioStreamPitch')
	static function SetAudioStreamPitch(stream:AudioStream, pitch:Single):Void;

	// Set pan for audio stream  (0.0 to 1.0, 0.5=center)
	@:native('SetAudioStreamPan')
	static function SetAudioStreamPan(stream:AudioStream, pan:Single):Void;

	// Default size for new audio streams
	@:native('SetAudioStreamBufferSizeDefault')
	static function SetAudioStreamBufferSizeDefault(size:Int):Void;

	// Audio thread callback to request new data
	@:native('SetAudioStreamCallback')
	static function SetAudioStreamCallback(stream:AudioStream, callback:AudioCallback):Void;

	// Attach audio stream processor to stream
	@:native('AttachAudioStreamProcessor')
	static function AttachAudioStreamProcessor(stream:AudioStream, processor:AudioCallback):Void;

	// Detach audio stream processor from stream
	@:native('DetachAudioStreamProcessor')
	static function DetachAudioStreamProcessor(stream:AudioStream, processor:AudioCallback):Void;

	// Attach audio stream processor to the entire audio pipeline
	@:native('AttachAudioMixedProcessor')
	static function AttachAudioMixedProcessor(processor:AudioCallback):Void;

	// Detach audio stream processor from the entire audio pipeline
	@:native('DetachAudioMixedProcessor')
	static function DetachAudioMixedProcessor(processor:AudioCallback):Void;
}
