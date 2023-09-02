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
}
