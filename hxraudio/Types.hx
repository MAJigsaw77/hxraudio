package hxraudio;

#if !cpp
#error 'RAudio supports only C++ target platforms.'
#end

class Types {} // blank

typedef AudioCallback = cpp.Callable<(bufferData:cpp.RawPointer<cpp.Void>, frames:cpp.UInt32) -> Void>;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Wave')
private extern class WaveImpl
{
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
	var sampleRate:cpp.UInt32; // Frequency (samples per second)
	var sampleSize:cpp.UInt32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	var channels:cpp.UInt32; // Number of channels (1-mono, 2-stereo, ...)
	var data:cpp.RawPointer<cpp.Void>; // Buffer data pointer
}

typedef Wave = cpp.Struct<Wave>;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioBuffer')
extern class RAudioBuffer {}

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioProcessor')
extern class RAudioProcessor {}

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('AudioStream')
private extern class AudioStreamImpl
{
	var buffer:cpp.RawPointer<RAudioBuffer>; // Pointer to internal data used by the audio system
	var processor:cpp.RawPointer<RAudioProcessor>; // Pointer to internal data processor, useful for audio effects
	var sampleRate:cpp.UInt32; // Frequency (samples per second)
	var sampleSize:cpp.UInt32; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	var channels:cpp.UInt32; // Number of channels (1-mono, 2-stereo, ...)
}

typedef AudioStream = cpp.Struct<AudioStreamImpl>;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Sound')
private extern class SoundImpl
{
	var stream:AudioStream; // Audio stream
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
}

typedef Sound = cpp.Struct<SoundImpl>;

@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Music')
private extern class MusicImpl
{
	var stream:AudioStream; // Audio stream
	var frameCount:cpp.UInt32; // Total number of frames (considering channels)
	var looping:Bool; // Music looping enable
	var ctxType:Int; // Type of music context (audio filetype)
	var ctxData:cpp.RawPointer<cpp.Void>; // Audio context data, depends on type
}

typedef Music = cpp.Struct<MusicImpl>;
