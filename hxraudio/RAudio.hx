package hxraudio;

#if !cpp
#error 'RAudio supports only C++ target platforms.'
#end
import hxraudio.Types;

/**
 * This class provides static methods to interact with the RAudio library.
 * It allows for the creation and management of audio devices, wave and sound data,
 * music streams, and audio streams. Additionally, it offers various utility functions
 * for managing audio playback, volume, pitch, and more.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
extern class RAudio
{
	/**
	 * Initialize audio device and context
	 */
	@:native('InitAudioDevice')
	static function InitAudioDevice():Void;

	/**
	 * Close the audio device and context
	 */
	@:native('CloseAudioDevice')
	static function CloseAudioDevice():Void;

	/**
	 * Check if audio device has been initialized successfully
	 *
	 * @return `true` if the audio device is ready, `false` otherwise
	 */
	@:native('IsAudioDeviceReady')
	static function IsAudioDeviceReady():Bool;

	/**
	 * Set master volume (listener)
	 *
	 * @param volume The master volume level (0.0 to 1.0)
	 */
	@:native('SetMasterVolume')
	static function SetMasterVolume(volume:Single):Void;

	/**
	 * Get master volume (listener)
	 *
	 * @return The master volume level (0.0 to 1.0)
	 */
	@:native('GetMasterVolume')
	static function GetMasterVolume():Single;

	/**
	 * Load wave data from file
	 *
	 * @param fileName The path to the wave file
	 * @return The loaded Wave object
	 */
	@:native('LoadWave')
	static function LoadWave(fileName:cpp.ConstCharStar):Wave;

	/**
	 * Load wave from memory buffer, fileType refers to extension: i.e. ".wav"
	 *
	 * @param fileType The file extension
	 * @param fileData The memory buffer containing the wave data
	 * @param dataSize The size of the data in the buffer
	 * @return The loaded Wave object
	 */
	@:native('LoadWaveFromMemory')
	static function LoadWaveFromMemory(fileType:cpp.ConstCharStar, fileData:cpp.RawConstPointer<cpp.UInt8>, dataSize:Int):Wave;

	/**
	 * Checks if wave data is ready
	 *
	 * @param wave The Wave object to check
	 * @return `true` if the wave data is ready, `false` otherwise
	 */
	@:native('IsWaveReady')
	static function IsWaveReady(wave:Wave):Bool;

	/**
	 * Load sound from file
	 *
	 * @param fileName The path to the sound file
	 * @return The loaded Sound object
	 */
	@:native('LoadSound')
	static function LoadSound(fileName:cpp.ConstCharStar):Sound;

	/**
	 * Load sound from wave data
	 *
	 * @param wave The Wave object containing the sound data
	 * @return The loaded Sound object
	 */
	@:native('LoadSoundFromWave')
	static function LoadSoundFromWave(wave:Wave):Sound;

	/**
	 * Create a new sound that shares the same sample data as the source sound, does not own the sound data
	 *
	 * @param source The source Sound object
	 * @return The new Sound alias
	 */
	@:native('LoadSoundAlias')
	static function LoadSoundAlias(source:Sound):Sound;

	/**
	 * Checks if a sound is ready
	 *
	 * @param sound The Sound object to check
	 * @return `true` if the sound is ready, `false` otherwise
	 */
	@:native('IsSoundReady')
	static function IsSoundReady(sound:Sound):Bool;

	/**
	 * Update sound buffer with new data
	 *
	 * @param sound The Sound object to update
	 * @param data The new data to update the sound buffer with
	 * @param frameCount The number of frames in the data
	 */
	@:native('UpdateSound')
	static function UpdateSound(sound:Sound, data:cpp.RawConstPointer<cpp.Void>, frameCount:Int):Void;

	/**
	 * Unload wave data
	 *
	 * @param wave The Wave object to unload
	 */
	@:native('UnloadWave')
	static function UnloadWave(wave:Wave):Void;

	/**
	 * Unload sound
	 *
	 * @param sound The Sound object to unload
	 */
	@:native('UnloadSound')
	static function UnloadSound(sound:Sound):Void;

	/**
	 * Unload a sound alias (does not deallocate sample data)
	 *
	 * @param alias The Sound alias to unload
	 */
	@:native('UnloadSoundAlias')
	static function UnloadSoundAlias(alias:Sound):Void;

	/**
	 * Export wave data to file
	 *
	 * @param wave The Wave object to export
	 * @param fileName The path to the file to export to
	 * @return `true` if the export was successful, `false` otherwise
	 */
	@:native('ExportWave')
	static function ExportWave(wave:Wave, fileName:cpp.ConstCharStar):Bool;

	/**
	 * Export wave sample data to code (.h)
	 *
	 * @param wave The Wave object to export
	 * @param fileName The path to the file to export to
	 * @return `true` if the export was successful, `false` otherwise
	 */
	@:native('ExportWaveAsCode')
	static function ExportWaveAsCode(wave:Wave, fileName:cpp.ConstCharStar):Bool;

	/**
	 * Play a sound
	 *
	 * @param sound The Sound object to play
	 */
	@:native('PlaySound')
	static function PlaySound(sound:Sound):Void;

	/**
	 * Stop playing a sound
	 *
	 * @param sound The Sound object to stop
	 */
	@:native('StopSound')
	static function StopSound(sound:Sound):Void;

	/**
	 * Pause a sound
	 *
	 * @param sound The Sound object to pause
	 */
	@:native('PauseSound')
	static function PauseSound(sound:Sound):Void;

	/**
	 * Resume a paused sound
	 *
	 * @param sound The Sound object to resume
	 */
	@:native('ResumeSound')
	static function ResumeSound(sound:Sound):Void;

	/**
	 * Check if a sound is currently playing
	 *
	 * @param sound The Sound object to check
	 * @return `true` if the sound is playing, `false` otherwise
	 */
	@:native('IsSoundPlaying')
	static function IsSoundPlaying(sound:Sound):Bool;

	/**
	 * Set volume for a sound (1.0 is max level)
	 *
	 * @param sound The Sound object to set the volume for
	 * @param volume The volume level (0.0 to 1.0)
	 */
	@:native('SetSoundVolume')
	static function SetSoundVolume(sound:Sound, volume:Single):Void;

	/**
	 * Set pitch for a sound (1.0 is base level)
	 *
	 * @param sound The Sound object to set the pitch for
	 * @param pitch The pitch level (1.0 is base level)
	 */
	@:native('SetSoundPitch')
	static function SetSoundPitch(sound:Sound, pitch:Single):Void;

	/**
	 * Set pan for a sound (0.0 to 1.0, 0.5=center)
	 *
	 * @param sound The Sound object to set the pan for
	 * @param pan The pan level (0.0 to 1.0, 0.5=center)
	 */
	@:native('SetSoundPan')
	static function SetSoundPan(sound:Sound, pan:Single):Void;

	/**
	 * Copy a wave to a new wave
	 *
	 * @param wave The Wave object to copy
	 * @return The copied Wave object
	 */
	@:native('WaveCopy')
	static function WaveCopy(wave:Wave):Wave;

	/**
	 * Crop a wave to defined samples range
	 *
	 * @param wave The Wave object to crop
	 * @param initSample The initial sample index
	 * @param finalSample The final sample index
	 */
	@:native('WaveCrop')
	static function WaveCrop(wave:cpp.RawPointer<Wave>, initSample:Int, finalSample:Int):Void;

	/**
	 * Convert wave data to desired format
	 *
	 * @param wave The Wave object to convert
	 * @param initSample The initial sample index
	 * @param finalSample The final sample index
	 * @param channels The number of channels
	 */
	@:native('WaveFormat')
	static function WaveFormat(wave:cpp.RawPointer<Wave>, initSample:Int, finalSample:Int, channels:Int):Void;

	/**
	 * Load samples data from wave as a floats array
	 *
	 * @param wave The Wave object to load samples from
	 * @return A pointer to the loaded samples data
	 */
	@:native('LoadWaveSamples')
	static function LoadWaveSamples(wave:Wave):cpp.RawPointer<Single>;

	/**
	 * Unload samples data loaded with LoadWaveSamples()
	 *
	 * @param samples The pointer to the samples data to unload
	 */
	@:native('UnloadWaveSamples')
	static function UnloadWaveSamples(samples:cpp.RawPointer<Single>):Void;

	/**
	 * Load music stream from file
	 *
	 * @param fileName The path to the music file
	 * @return The loaded Music object
	 */
	@:native('LoadMusicStream')
	static function LoadMusicStream(fileName:cpp.ConstCharStar):Music;

	/**
	 * Load music stream from data
	 *
	 * @param fileType The file extension
	 * @param fileData The memory buffer containing the music data
	 * @param dataSize The size of the data in the buffer
	 * @return The loaded Music object
	 */
	@:native('LoadMusicStreamFromMemory')
	static function LoadMusicStreamFromMemory(fileType:cpp.ConstCharStar, fileData:cpp.RawConstPointer<cpp.UInt8>, dataSize:Int):Music;

	/**
	 * Checks if a music stream is ready
	 *
	 * @param music The Music object to check
	 * @return `true` if the music stream is ready, `false` otherwise
	 */
	@:native('IsMusicReady')
	static function IsMusicReady(music:Music):Bool;

	/**
	 * Unload music stream
	 *
	 * @param music The Music object to unload
	 */
	@:native('UnloadMusicStream')
	static function UnloadMusicStream(music:Music):Void;

	/**
	 * Start music playing
	 *
	 * @param music The Music object to play
	 */
	@:native('PlayMusicStream')
	static function PlayMusicStream(music:Music):Void;

	/**
	 * Check if music is playing
	 *
	 * @param music The Music object to check
	 * @return `true` if the music is playing, `false` otherwise
	 */
	@:native('IsMusicStreamPlaying')
	static function IsMusicStreamPlaying(music:Music):Bool;

	/**
	 * Updates buffers for music streaming
	 *
	 * @param music The Music object to update
	 */
	@:native('UpdateMusicStream')
	static function UpdateMusicStream(music:Music):Void;

	/**
	 * Stop music playing
	 *
	 * @param music The Music object to stop
	 */
	@:native('StopMusicStream')
	static function StopMusicStream(music:Music):Void;

	/**
	 * Pause music playing
	 *
	 * @param music The Music object to pause
	 */
	@:native('PauseMusicStream')
	static function PauseMusicStream(music:Music):Void;

	/**
	 * Resume playing paused music
	 *
	 * @param music The Music object to resume
	 */
	@:native('ResumeMusicStream')
	static function ResumeMusicStream(music:Music):Void;

	/**
	 * Seek music to a position (in seconds)
	 *
	 * @param music The Music object to seek
	 * @param position The position to seek to (in seconds)
	 */
	@:native('SeekMusicStream')
	static function SeekMusicStream(music:Music, position:Single):Void;

	/**
	 * Set volume for music (1.0 is max level)
	 *
	 * @param music The Music object to set the volume for
	 * @param volume The volume level (0.0 to 1.0)
	 */
	@:native('SetMusicVolume')
	static function SetMusicVolume(music:Music, volume:Single):Void;

	/**
	 * Set pitch for a music (1.0 is base level)
	 *
	 * @param music The Music object to set the pitch for
	 * @param pitch The pitch level (1.0 is base level)
	 */
	@:native('SetMusicPitch')
	static function SetMusicPitch(music:Music, pitch:Single):Void;

	/**
	 * Set pan for a music (0.0 to 1.0, 0.5=center)
	 *
	 * @param music The Music object to set the pan for
	 * @param pan The pan level (0.0 to 1.0, 0.5=center)
	 */
	@:native('SetMusicPan')
	static function SetMusicPan(music:Music, pan:Single):Void;

	/**
	 * Get music time length (in seconds)
	 *
	 * @param music The Music object to get the time length for
	 * @return The music time length (in seconds)
	 */
	@:native('GetMusicTimeLength')
	static function GetMusicTimeLength(music:Music):Single;

	/**
	 * Get current music time played (in seconds)
	 *
	 * @param music The Music object to get the current time played for
	 * @return The current music time played (in seconds)
	 */
	@:native('GetMusicTimePlayed')
	static function GetMusicTimePlayed(music:Music):Single;

	/**
	 * Load audio stream (to stream raw audio PCM data)
	 *
	 * @param sampleRate The sample rate of the audio stream
	 * @param sampleSize The sample size of the audio stream
	 * @param channels The number of channels in the audio stream
	 * @return The loaded AudioStream object
	 */
	@:native('LoadAudioStream')
	static function LoadAudioStream(sampleRate:cpp.UInt32, sampleSize:cpp.UInt32, channels:cpp.UInt32):AudioStream;

	/**
	 * Checks if an audio stream is ready
	 *
	 * @param stream The AudioStream object to check
	 * @return `true` if the audio stream is ready, `false` otherwise
	 */
	@:native('IsAudioStreamReady')
	static function IsAudioStreamReady(stream:AudioStream):Bool;

	/**
	 * Unload audio stream and free memory
	 *
	 * @param stream The AudioStream object to unload
	 */
	@:native('UnloadAudioStream')
	static function UnloadAudioStream(stream:AudioStream):Void;

	/**
	 * Update audio stream buffers with data
	 *
	 * @param stream The AudioStream object to update
	 * @param data The data to update the audio stream buffers with
	 * @param samplesCount The number of samples in the data
	 */
	@:native('UpdateAudioStream')
	static function UpdateAudioStream(stream:AudioStream, data:cpp.RawConstPointer<cpp.Void>, samplesCount:Int):Void;

	/**
	 * Check if any audio stream buffers require refill
	 *
	 * @param stream The AudioStream object to check
	 * @return `true` if any buffers require refill, `false` otherwise
	 */
	@:native('IsAudioStreamProcessed')
	static function IsAudioStreamProcessed(stream:AudioStream):Bool;

	/**
	 * Play audio stream
	 *
	 * @param stream The AudioStream object to play
	 */
	@:native('PlayAudioStream')
	static function PlayAudioStream(stream:AudioStream):Void;

	/**
	 * Pause audio stream
	 *
	 * @param stream The AudioStream object to pause
	 */
	@:native('PauseAudioStream')
	static function PauseAudioStream(stream:AudioStream):Void;

	/**
	 * Resume audio stream
	 *
	 * @param stream The AudioStream object to resume
	 */
	@:native('ResumeAudioStream')
	static function ResumeAudioStream(stream:AudioStream):Void;

	/**
	 * Check if audio stream is playing
	 *
	 * @param stream The AudioStream object to check
	 * @return `true` if the audio stream is playing, `false` otherwise
	 */
	@:native('IsAudioStreamPlaying')
	static function IsAudioStreamPlaying(stream:AudioStream):Bool;

	/**
	 * Stop audio stream
	 *
	 * @param stream The AudioStream object to stop
	 */
	@:native('StopAudioStream')
	static function StopAudioStream(stream:AudioStream):Void;

	/**
	 * Set volume for audio stream (1.0 is max level)
	 *
	 * @param stream The AudioStream object to set the volume for
	 * @param volume The volume level (0.0 to 1.0)
	 */
	@:native('SetAudioStreamVolume')
	static function SetAudioStreamVolume(stream:AudioStream, volume:Single):Void;

	/**
	 * Set pitch for audio stream (1.0 is base level)
	 *
	 * @param stream The AudioStream object to set the pitch for
	 * @param pitch The pitch level (1.0 is base level)
	 */
	@:native('SetAudioStreamPitch')
	static function SetAudioStreamPitch(stream:AudioStream, pitch:Single):Void;

	/**
	 * Set pan for audio stream (0.0 to 1.0, 0.5=center)
	 *
	 * @param stream The AudioStream object to set the pan for
	 * @param pan The pan level (0.0 to 1.0, 0.5=center)
	 */
	@:native('SetAudioStreamPan')
	static function SetAudioStreamPan(stream:AudioStream, pan:Single):Void;

	/**
	 * Default size for new audio streams
	 *
	 * @param size The default size for new audio streams
	 */
	@:native('SetAudioStreamBufferSizeDefault')
	static function SetAudioStreamBufferSizeDefault(size:Int):Void;

	/**
	 * Audio thread callback to request new data
	 *
	 * @param stream The AudioStream object to set the callback for
	 * @param callback The callback to request new data
	 */
	@:native('SetAudioStreamCallback')
	static function SetAudioStreamCallback(stream:AudioStream, callback:AudioCallback):Void;

	/**
	 * Attach audio stream processor to stream
	 *
	 * @param stream The AudioStream object to attach the processor to
	 * @param processor The processor to attach
	 */
	@:native('AttachAudioStreamProcessor')
	static function AttachAudioStreamProcessor(stream:AudioStream, processor:AudioCallback):Void;

	/**
	 * Detach audio stream processor from stream
	 *
	 * @param stream The AudioStream object to detach the processor from
	 * @param processor The processor to detach
	 */
	@:native('DetachAudioStreamProcessor')
	static function DetachAudioStreamProcessor(stream:AudioStream, processor:AudioCallback):Void;

	/**
	 * Attach audio stream processor to the entire audio pipeline
	 *
	 * @param processor The processor to attach
	 */
	@:native('AttachAudioMixedProcessor')
	static function AttachAudioMixedProcessor(processor:AudioCallback):Void;

	/**
	 * Detach audio stream processor from the entire audio pipeline
	 *
	 * @param processor The processor to detach
	 */
	@:native('DetachAudioMixedProcessor')
	static function DetachAudioMixedProcessor(processor:AudioCallback):Void;
}
