package hxraudio;

#if (!cpp && macro)
#error 'RAudio supports only C++ target platforms.'
#end

class Types {} // blank

typedef AudioCallback = cpp.Callable<(bufferData:cpp.RawPointer<cpp.Void>, frames:cpp.UInt32) -> Void>;

// Wave, audio wave data
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Wave')
extern class Wave
{
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
	var sampleRate:cpp.UInt32; // Frequency (samples per second)
	var sampleSize:cpp.UInt32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	var channels:cpp.UInt32; // Number of channels (1-mono, 2-stereo, ...)
	var data:cpp.RawPointer<cpp.Void>; // Buffer data pointer
}

// Opaque structs declaration

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioBuffer')
extern class RAudioBuffer {}

@:buildXml('<include name="${haxelib:hxlua}/project/Build.xml" />')
@:include('lua.hpp')
@:native('rAudioProcessor')
extern class RAudioProcessor {}

// Sound
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Sound')
extern class Sound
{
	var stream:AudioStream; // Audio stream
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
}
