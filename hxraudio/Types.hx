package hxraudio;

/**
 * Dummy class for importing RAudio types.
 */
#if !cpp
#error 'RAudio supports only C++ target platforms.'
#end
class Types {}

/**
 * Callback for audio data processing.
 */
typedef AudioCallback = cpp.Callable<(bufferData:cpp.RawPointer<cpp.Void>, frames:cpp.UInt32) -> Void>;

/**
 * Wave, audio wave data.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Wave')
extern class Wave
{
	/**
	 * Allocates a new Wave object.
	 */
	function new():Void;

	/**
	 * Total number of frames (considering channels).
	 */
	var frameCount:cpp.UInt32;

	/**
	 * Frequency (samples per second).
	 */
	var sampleRate:cpp.UInt32;

	/**
	 * Bit depth (bits per sample): 8, 16, 32 (24 not supported).
	 */
	var sampleSize:cpp.UInt32;

	/**
	 * Number of channels (1-mono, 2-stereo, ...).
	 */
	var channels:cpp.UInt32;

	/**
	 * Buffer data pointer.
	 */
	var data:cpp.RawPointer<cpp.Void>;
}

/**
 * rAudioBuffer, opaque audio buffer struct.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioBuffer')
extern class RAudioBuffer {}

/**
 * rAudioProcessor, opaque audio processor struct.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioProcessor')
extern class RAudioProcessor {}

/**
 * AudioStream, custom audio stream.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('AudioStream')
extern class AudioStream
{
	/**
	 * Allocates a new AudioStream object.
	 */
	function new():Void;

	/**
	 * Pointer to internal data used by the audio system.
	 */
	var buffer:cpp.RawPointer<RAudioBuffer>;

	/**
	 * Pointer to internal data processor, useful for audio effects.
	 */
	var processor:cpp.RawPointer<RAudioProcessor>;

	/**
	 * Frequency (samples per second).
	 */
	var sampleRate:cpp.UInt32;

	/**
	 * Bit depth (bits per sample): 8, 16, 32 (24 not supported).
	 */
	var sampleSize:cpp.UInt32;

	/**
	 * Number of channels (1-mono, 2-stereo, ...).
	 */
	var channels:cpp.UInt32;
}

/**
 * Sound.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Sound')
extern class Sound
{
	/**
	 * Allocates a new Sound object.
	 */
	function new():Void;

	/**
	 * Audio stream.
	 */
	var stream:AudioStream;

	/**
	 * Total number of frames (considering channels).
	 */
	var frameCount:cpp.UInt32;
}

/**
 * Music, audio stream, anything longer than ~10 seconds should be streamed.
 */
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Music')
extern class Music
{
	/**
	 * Allocates a new Music object.
	 */
	function new():Void;

	/**
	 * Audio stream.
	 */
	var stream:AudioStream;

	/**
	 * Total number of frames (considering channels).
	 */
	var frameCount:cpp.UInt32;

	/**
	 * Music looping enable.
	 */
	var looping:Bool;

	/**
	 * Type of music context (audio filetype).
	 */
	var ctxType:Int;

	/**
	 * Audio context data, depends on type.
	 */
	var ctxData:cpp.RawPointer<cpp.Void>;
}
