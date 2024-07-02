package hxraudio;

/**
 * Dummy class for importing RAudio types.
 */
#if !cpp
#error 'RAudio supports only C++ target platforms.'
#end
class Types {}

@:dox(hide)
typedef AudioCallback = cpp.Callable<(bufferData:cpp.RawPointer<cpp.Void>, frames:cpp.UInt32) -> Void>;

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Wave')
extern class Wave
{
	/**
	 * Allocates a new Wave object.
	 *
	 * @return A new Wave object.
	 */
	@:native('Wave')
	static function alloc():Wave;

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

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioBuffer')
extern class RAudioBuffer {}

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:native('rAudioProcessor')
extern class RAudioProcessor {}

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('AudioStream')
extern class AudioStream
{
	/**
	 * Allocates a new AudioStream object.
	 *
	 * @return A new AudioStream object.
	 */
	@:native('AudioStream')
	static function alloc():AudioStream;

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

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Sound')
extern class Sound
{
	/**
	 * Allocates a new Sound object.
	 *
	 * @return A new Sound object.
	 */
	@:native('Sound')
	static function alloc():Sound;

	/**
	 * Audio stream.
	 */
	var stream:AudioStream;

	/**
	 * Total number of frames (considering channels).
	 */
	var frameCount:cpp.UInt32;
}

@:dox(hide)
@:buildXml('<include name="${haxelib:hxraudio}/project/Build.xml" />')
@:include('raudio.h')
@:unreflective
@:structAccess
@:native('Music')
extern class Music
{
	/**
	 * Allocates a new Music object.
	 *
	 * @return A new Music object.
	 */
	@:native('Music')
	static function alloc():Music;

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
