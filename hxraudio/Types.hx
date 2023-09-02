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

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioBuffer')
extern class RAudioBuffer {}

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioProcessor')
extern class RAudioProcessor {}

// AudioStream, custom audio stream
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('AudioStream')
extern class AudioStream
{
	var buffer:cpp.RawPointer<RAudioBuffer>; // Pointer to internal data used by the audio system
	var processor:cpp.RawPointer<RAudioProcessor>; // Pointer to internal data processor, useful for audio effects
	var sampleRate:cpp.UInt32; // Frequency (samples per second)
	var sampleSize:cpp.UInt32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	var channels:cpp.UInt32; // Number of channels (1-mono, 2-stereo, ...)
}

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

// Music, audio stream, anything longer than ~10 seconds should be streamed
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Music')
extern class Music
{
	var stream:AudioStream; // Audio stream
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
	var looping:Bool; // Music looping enable
	var ctxType:Int; // Type of music context (audio filetype)
	var ctxData:cpp.RawPointer<cpp.Void>; // Audio context data, depends on type
}
