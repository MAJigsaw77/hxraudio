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
}
