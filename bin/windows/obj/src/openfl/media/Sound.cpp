// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime_app_Future
#include <lime/app/Future.h>
#endif
#ifndef INCLUDED_lime_math_Vector4
#include <lime/math/Vector4.h>
#endif
#ifndef INCLUDED_lime_media_AudioBuffer
#include <lime/media/AudioBuffer.h>
#endif
#ifndef INCLUDED_lime_media_AudioSource
#include <lime/media/AudioSource.h>
#endif
#ifndef INCLUDED_lime_utils_ArrayBufferView
#include <lime/utils/ArrayBufferView.h>
#endif
#ifndef INCLUDED_lime_utils_TAError
#include <lime/utils/TAError.h>
#endif
#ifndef INCLUDED_openfl_events_ErrorEvent
#include <openfl/events/ErrorEvent.h>
#endif
#ifndef INCLUDED_openfl_events_Event
#include <openfl/events/Event.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IOErrorEvent
#include <openfl/events/IOErrorEvent.h>
#endif
#ifndef INCLUDED_openfl_events_TextEvent
#include <openfl/events/TextEvent.h>
#endif
#ifndef INCLUDED_openfl_media_ID3Info
#include <openfl/media/ID3Info.h>
#endif
#ifndef INCLUDED_openfl_media_Sound
#include <openfl/media/Sound.h>
#endif
#ifndef INCLUDED_openfl_media_SoundChannel
#include <openfl/media/SoundChannel.h>
#endif
#ifndef INCLUDED_openfl_media_SoundLoaderContext
#include <openfl/media/SoundLoaderContext.h>
#endif
#ifndef INCLUDED_openfl_media_SoundMixer
#include <openfl/media/SoundMixer.h>
#endif
#ifndef INCLUDED_openfl_media_SoundTransform
#include <openfl/media/SoundTransform.h>
#endif
#ifndef INCLUDED_openfl_net_URLRequest
#include <openfl/net/URLRequest.h>
#endif
#ifndef INCLUDED_openfl_utils_ByteArrayData
#include <openfl/utils/ByteArrayData.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataInput
#include <openfl/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataOutput
#include <openfl/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_openfl_utils__ByteArray_ByteArray_Impl_
#include <openfl/utils/_ByteArray/ByteArray_Impl_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_53_new,"openfl.media.Sound","new",0xfdfd1c39,"openfl.media.Sound.new","openfl/media/Sound.hx",53,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_73_close,"openfl.media.Sound","close",0xfbd9cbd1,"openfl.media.Sound.close","openfl/media/Sound.hx",73,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_119_load,"openfl.media.Sound","load",0x3e30ac2d,"openfl.media.Sound.load","openfl/media/Sound.hx",119,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_99_load,"openfl.media.Sound","load",0x3e30ac2d,"openfl.media.Sound.load","openfl/media/Sound.hx",99,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_126_loadCompressedDataFromByteArray,"openfl.media.Sound","loadCompressedDataFromByteArray",0x8f237f2f,"openfl.media.Sound.loadCompressedDataFromByteArray","openfl/media/Sound.hx",126,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_180_loadPCMFromByteArray,"openfl.media.Sound","loadPCMFromByteArray",0xb6cc217a,"openfl.media.Sound.loadPCMFromByteArray","openfl/media/Sound.hx",180,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_202_play,"openfl.media.Sound","play",0x40d33ffb,"openfl.media.Sound.play","openfl/media/Sound.hx",202,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_252_get_id3,"openfl.media.Sound","get_id3",0xac6378e8,"openfl.media.Sound.get_id3","openfl/media/Sound.hx",252,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_257_get_length,"openfl.media.Sound","get_length",0xcc37d5f6,"openfl.media.Sound.get_length","openfl/media/Sound.hx",257,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_288_AudioBuffer_onURLLoad,"openfl.media.Sound","AudioBuffer_onURLLoad",0x80e63186,"openfl.media.Sound.AudioBuffer_onURLLoad","openfl/media/Sound.hx",288,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_83_fromAudioBuffer,"openfl.media.Sound","fromAudioBuffer",0xa9f89285,"openfl.media.Sound.fromAudioBuffer","openfl/media/Sound.hx",83,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_94_fromFile,"openfl.media.Sound","fromFile",0x06bfbe8d,"openfl.media.Sound.fromFile","openfl/media/Sound.hx",94,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_162_loadFromFile,"openfl.media.Sound","loadFromFile",0xb0657a53,"openfl.media.Sound.loadFromFile","openfl/media/Sound.hx",162,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_160_loadFromFile,"openfl.media.Sound","loadFromFile",0xb0657a53,"openfl.media.Sound.loadFromFile","openfl/media/Sound.hx",160,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_173_loadFromFiles,"openfl.media.Sound","loadFromFiles",0xa8658ec0,"openfl.media.Sound.loadFromFiles","openfl/media/Sound.hx",173,0x46a01619)
HX_LOCAL_STACK_FRAME(_hx_pos_5a9f676c476e7e7b_171_loadFromFiles,"openfl.media.Sound","loadFromFiles",0xa8658ec0,"openfl.media.Sound.loadFromFiles","openfl/media/Sound.hx",171,0x46a01619)
namespace openfl{
namespace media{

void Sound_obj::__construct( ::openfl::net::URLRequest stream, ::openfl::media::SoundLoaderContext context){
            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_53_new)
HXLINE(  55)		super::__construct(hx::ObjectPtr<OBJ_>(this));
HXLINE(  57)		this->bytesLoaded = (int)0;
HXLINE(  58)		this->bytesTotal = (int)0;
HXLINE(  59)		this->isBuffering = false;
HXLINE(  60)		this->url = null();
HXLINE(  62)		if (hx::IsNotNull( stream )) {
HXLINE(  64)			this->load(stream,context);
            		}
            	}

Dynamic Sound_obj::__CreateEmpty() { return new Sound_obj; }

void *Sound_obj::_hx_vtable = 0;

Dynamic Sound_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Sound_obj > _hx_result = new Sound_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool Sound_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x16cac3db) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x16cac3db;
	} else {
		return inClassId==(int)0x1b123bf8;
	}
}

void Sound_obj::close(){
            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_73_close)
HXDLIN(  73)		if (hx::IsNotNull( this->_hx___buffer )) {
HXLINE(  75)			this->_hx___buffer->dispose();
HXLINE(  76)			this->_hx___buffer = null();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(Sound_obj,close,(void))

void Sound_obj::load( ::openfl::net::URLRequest stream, ::openfl::media::SoundLoaderContext context){
            		HX_BEGIN_LOCAL_FUNC_S1(hx::LocalFunc,_hx_Closure_0, ::openfl::media::Sound,_gthis) HXARGC(1)
            		void _hx_run( ::Dynamic _){
            			HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_119_load)
HXLINE( 119)			_gthis->AudioBuffer_onURLLoad(null());
            		}
            		HX_END_LOCAL_FUNC1((void))

            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_99_load)
HXDLIN(  99)		 ::openfl::media::Sound _gthis = hx::ObjectPtr<OBJ_>(this);
HXLINE( 101)		this->url = stream->url;
HXLINE( 119)		::lime::media::AudioBuffer_obj::loadFromFile(this->url)->onComplete(this->AudioBuffer_onURLLoad_dyn())->onError( ::Dynamic(new _hx_Closure_0(_gthis)));
            	}


HX_DEFINE_DYNAMIC_FUNC2(Sound_obj,load,(void))

void Sound_obj::loadCompressedDataFromByteArray( ::openfl::utils::ByteArrayData bytes,int bytesLength){
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_126_loadCompressedDataFromByteArray)
HXLINE( 128)		bool _hx_tmp;
HXDLIN( 128)		if (hx::IsNotNull( bytes )) {
HXLINE( 128)			_hx_tmp = (bytesLength <= (int)0);
            		}
            		else {
HXLINE( 128)			_hx_tmp = true;
            		}
HXDLIN( 128)		if (_hx_tmp) {
HXLINE( 130)			this->dispatchEvent( ::openfl::events::IOErrorEvent_obj::__alloc( HX_CTX ,HX_("ioError",02,fe,41,76),null(),null(),null(),null()));
HXLINE( 131)			return;
            		}
HXLINE( 135)		if ((::openfl::utils::_ByteArray::ByteArray_Impl__obj::get_length(bytes) > bytesLength)) {
HXLINE( 137)			 ::openfl::utils::ByteArrayData this1 =  ::openfl::utils::ByteArrayData_obj::__alloc( HX_CTX ,bytesLength);
HXDLIN( 137)			 ::openfl::utils::ByteArrayData copy = this1;
HXLINE( 138)			copy->writeBytes(bytes,(int)0,bytesLength);
HXLINE( 139)			bytes = copy;
            		}
HXLINE( 143)		this->_hx___buffer = ::lime::media::AudioBuffer_obj::fromBytes(::openfl::utils::_ByteArray::ByteArray_Impl__obj::toArrayBuffer(bytes));
HXLINE( 145)		if (hx::IsNull( this->_hx___buffer )) {
HXLINE( 147)			this->dispatchEvent( ::openfl::events::IOErrorEvent_obj::__alloc( HX_CTX ,HX_("ioError",02,fe,41,76),null(),null(),null(),null()));
            		}
            		else {
HXLINE( 151)			this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("complete",b9,00,c8,7f),null(),null()));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Sound_obj,loadCompressedDataFromByteArray,(void))

void Sound_obj::loadPCMFromByteArray( ::openfl::utils::ByteArrayData bytes,int samples,::String __o_format,hx::Null< bool >  __o_stereo,hx::Null< Float >  __o_sampleRate){
::String format = __o_format.Default(HX_HCSTRING("float","\x9c","\xc5","\x96","\x02"));
bool stereo = __o_stereo.Default(true);
Float sampleRate = __o_sampleRate.Default(44100);
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_180_loadPCMFromByteArray)
HXLINE( 182)		if (hx::IsNull( bytes )) {
HXLINE( 184)			this->dispatchEvent( ::openfl::events::IOErrorEvent_obj::__alloc( HX_CTX ,HX_("ioError",02,fe,41,76),null(),null(),null(),null()));
HXLINE( 185)			return;
            		}
HXLINE( 189)		 ::lime::media::AudioBuffer audioBuffer =  ::lime::media::AudioBuffer_obj::__alloc( HX_CTX );
HXLINE( 190)		int _hx_tmp;
HXDLIN( 190)		if ((format == HX_("float",9c,c5,96,02))) {
HXLINE( 190)			_hx_tmp = (int)32;
            		}
            		else {
HXLINE( 190)			_hx_tmp = (int)16;
            		}
HXDLIN( 190)		audioBuffer->bitsPerSample = _hx_tmp;
HXLINE( 191)		int _hx_tmp1;
HXDLIN( 191)		if (stereo) {
HXLINE( 191)			_hx_tmp1 = (int)2;
            		}
            		else {
HXLINE( 191)			_hx_tmp1 = (int)1;
            		}
HXDLIN( 191)		audioBuffer->channels = _hx_tmp1;
HXLINE( 192)		 ::haxe::io::Bytes buffer = ::openfl::utils::_ByteArray::ByteArray_Impl__obj::toArrayBuffer(bytes);
HXDLIN( 192)		 ::lime::utils::ArrayBufferView this1;
HXDLIN( 192)		if (hx::IsNotNull( buffer )) {
HXLINE( 192)			 ::lime::utils::ArrayBufferView _this =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,(int)0,(int)4);
HXDLIN( 192)			int in_byteOffset = (int)0;
HXDLIN( 192)			if ((in_byteOffset < (int)0)) {
HXLINE( 192)				HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            			}
HXDLIN( 192)			if ((hx::Mod(in_byteOffset,_this->bytesPerElement) != (int)0)) {
HXLINE( 192)				HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            			}
HXDLIN( 192)			int bufferByteLength = buffer->length;
HXDLIN( 192)			int elementSize = _this->bytesPerElement;
HXDLIN( 192)			int newByteLength = bufferByteLength;
HXDLIN( 192)			{
HXLINE( 192)				newByteLength = (bufferByteLength - in_byteOffset);
HXDLIN( 192)				if ((hx::Mod(bufferByteLength,_this->bytesPerElement) != (int)0)) {
HXLINE( 192)					HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            				}
HXDLIN( 192)				if ((newByteLength < (int)0)) {
HXLINE( 192)					HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            				}
            			}
HXDLIN( 192)			_this->buffer = buffer;
HXDLIN( 192)			_this->byteOffset = in_byteOffset;
HXDLIN( 192)			_this->byteLength = newByteLength;
HXDLIN( 192)			_this->length = ::Std_obj::_hx_int(((Float)newByteLength / (Float)_this->bytesPerElement));
HXDLIN( 192)			this1 = _this;
            		}
            		else {
HXLINE( 192)			HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            		}
HXDLIN( 192)		audioBuffer->data = this1;
HXLINE( 193)		audioBuffer->sampleRate = ::Std_obj::_hx_int(sampleRate);
HXLINE( 195)		this->_hx___buffer = audioBuffer;
HXLINE( 197)		this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("complete",b9,00,c8,7f),null(),null()));
            	}


HX_DEFINE_DYNAMIC_FUNC5(Sound_obj,loadPCMFromByteArray,(void))

 ::openfl::media::SoundChannel Sound_obj::play(hx::Null< Float >  __o_startTime,hx::Null< int >  __o_loops, ::openfl::media::SoundTransform sndTransform){
Float startTime = __o_startTime.Default(((Float)0.0));
int loops = __o_loops.Default(0);
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_202_play)
HXLINE( 204)		bool _hx_tmp;
HXDLIN( 204)		if (hx::IsNotNull( this->_hx___buffer )) {
HXLINE( 204)			_hx_tmp = (::openfl::media::SoundMixer_obj::_hx___soundChannels->length >= (int)32);
            		}
            		else {
HXLINE( 204)			_hx_tmp = true;
            		}
HXDLIN( 204)		if (_hx_tmp) {
HXLINE( 206)			return null();
            		}
HXLINE( 210)		if (hx::IsNull( sndTransform )) {
HXLINE( 212)			sndTransform =  ::openfl::media::SoundTransform_obj::__alloc( HX_CTX ,null(),null());
            		}
            		else {
HXLINE( 216)			sndTransform = sndTransform->clone();
            		}
HXLINE( 220)		Float pan = (::openfl::media::SoundMixer_obj::_hx___soundTransform->pan + sndTransform->pan);
HXLINE( 222)		if ((pan > (int)1)) {
HXLINE( 222)			pan = (int)1;
            		}
HXLINE( 223)		if ((pan < (int)-1)) {
HXLINE( 223)			pan = (int)-1;
            		}
HXLINE( 225)		Float volume = (::openfl::media::SoundMixer_obj::_hx___soundTransform->volume * sndTransform->volume);
HXLINE( 227)		 ::lime::media::AudioSource source =  ::lime::media::AudioSource_obj::__alloc( HX_CTX ,this->_hx___buffer,null(),null(),null());
HXLINE( 228)		source->offset = ::Std_obj::_hx_int(startTime);
HXLINE( 229)		if ((loops > (int)1)) {
HXLINE( 229)			source->set_loops((loops - (int)1));
            		}
HXLINE( 231)		source->set_gain(volume);
HXLINE( 233)		 ::lime::math::Vector4 position = source->get_position();
HXLINE( 234)		position->x = pan;
HXLINE( 235)		position->z = ((int)-1 * ::Math_obj::sqrt(((int)1 - ::Math_obj::pow(pan,(int)2))));
HXLINE( 236)		source->set_position(position);
HXLINE( 238)		return  ::openfl::media::SoundChannel_obj::__alloc( HX_CTX ,source,sndTransform);
            	}


HX_DEFINE_DYNAMIC_FUNC3(Sound_obj,play,return )

 ::openfl::media::ID3Info Sound_obj::get_id3(){
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_252_get_id3)
HXDLIN( 252)		return  ::openfl::media::ID3Info_obj::__alloc( HX_CTX );
            	}


HX_DEFINE_DYNAMIC_FUNC0(Sound_obj,get_id3,return )

int Sound_obj::get_length(){
            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_257_get_length)
HXLINE( 259)		if (hx::IsNotNull( this->_hx___buffer )) {
HXLINE( 267)			int samples = (this->_hx___buffer->data->length * (int)8);
HXDLIN( 267)			Float samples1 = ((Float)samples / (Float)(this->_hx___buffer->channels * this->_hx___buffer->bitsPerSample));
HXLINE( 268)			return ::Std_obj::_hx_int((((Float)samples1 / (Float)this->_hx___buffer->sampleRate) * (int)1000));
            		}
HXLINE( 274)		return (int)0;
            	}


HX_DEFINE_DYNAMIC_FUNC0(Sound_obj,get_length,return )

void Sound_obj::AudioBuffer_onURLLoad( ::lime::media::AudioBuffer buffer){
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_288_AudioBuffer_onURLLoad)
HXDLIN( 288)		if (hx::IsNull( buffer )) {
HXLINE( 290)			this->dispatchEvent( ::openfl::events::IOErrorEvent_obj::__alloc( HX_CTX ,HX_("ioError",02,fe,41,76),null(),null(),null(),null()));
            		}
            		else {
HXLINE( 294)			this->_hx___buffer = buffer;
HXLINE( 295)			this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("complete",b9,00,c8,7f),null(),null()));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(Sound_obj,AudioBuffer_onURLLoad,(void))

 ::openfl::media::Sound Sound_obj::fromAudioBuffer( ::lime::media::AudioBuffer buffer){
            	HX_GC_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_83_fromAudioBuffer)
HXLINE(  85)		 ::openfl::media::Sound sound =  ::openfl::media::Sound_obj::__alloc( HX_CTX ,null(),null());
HXLINE(  86)		sound->_hx___buffer = buffer;
HXLINE(  87)		return sound;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sound_obj,fromAudioBuffer,return )

 ::openfl::media::Sound Sound_obj::fromFile(::String path){
            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_94_fromFile)
HXDLIN(  94)		return ::openfl::media::Sound_obj::fromAudioBuffer(::lime::media::AudioBuffer_obj::fromFile(path));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sound_obj,fromFile,return )

 ::lime::app::Future Sound_obj::loadFromFile(::String path){
            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            		 ::lime::app::Future _hx_run( ::lime::media::AudioBuffer audioBuffer){
            			HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_162_loadFromFile)
HXLINE( 162)			return ::lime::app::Future_obj::withValue(::openfl::media::Sound_obj::fromAudioBuffer(audioBuffer));
            		}
            		HX_END_LOCAL_FUNC1(return)

            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_160_loadFromFile)
HXDLIN( 160)		return ::lime::media::AudioBuffer_obj::loadFromFile(path)->then( ::Dynamic(new _hx_Closure_0()));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sound_obj,loadFromFile,return )

 ::lime::app::Future Sound_obj::loadFromFiles(::Array< ::String > paths){
            		HX_BEGIN_LOCAL_FUNC_S0(hx::LocalFunc,_hx_Closure_0) HXARGC(1)
            		 ::lime::app::Future _hx_run( ::lime::media::AudioBuffer audioBuffer){
            			HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_173_loadFromFiles)
HXLINE( 173)			return ::lime::app::Future_obj::withValue(::openfl::media::Sound_obj::fromAudioBuffer(audioBuffer));
            		}
            		HX_END_LOCAL_FUNC1(return)

            	HX_STACKFRAME(&_hx_pos_5a9f676c476e7e7b_171_loadFromFiles)
HXDLIN( 171)		return ::lime::media::AudioBuffer_obj::loadFromFiles(paths)->then( ::Dynamic(new _hx_Closure_0()));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Sound_obj,loadFromFiles,return )


hx::ObjectPtr< Sound_obj > Sound_obj::__new( ::openfl::net::URLRequest stream, ::openfl::media::SoundLoaderContext context) {
	hx::ObjectPtr< Sound_obj > __this = new Sound_obj();
	__this->__construct(stream,context);
	return __this;
}

hx::ObjectPtr< Sound_obj > Sound_obj::__alloc(hx::Ctx *_hx_ctx, ::openfl::net::URLRequest stream, ::openfl::media::SoundLoaderContext context) {
	Sound_obj *__this = (Sound_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Sound_obj), true, "openfl.media.Sound"));
	*(void **)__this = Sound_obj::_hx_vtable;
	__this->__construct(stream,context);
	return __this;
}

Sound_obj::Sound_obj()
{
}

void Sound_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Sound);
	HX_MARK_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_MARK_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_MARK_MEMBER_NAME(isBuffering,"isBuffering");
	HX_MARK_MEMBER_NAME(url,"url");
	HX_MARK_MEMBER_NAME(_hx___buffer,"__buffer");
	 ::openfl::events::EventDispatcher_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Sound_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_VISIT_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_VISIT_MEMBER_NAME(isBuffering,"isBuffering");
	HX_VISIT_MEMBER_NAME(url,"url");
	HX_VISIT_MEMBER_NAME(_hx___buffer,"__buffer");
	 ::openfl::events::EventDispatcher_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Sound_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"id3") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_id3() ); }
		if (HX_FIELD_EQ(inName,"url") ) { return hx::Val( url ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"load") ) { return hx::Val( load_dyn() ); }
		if (HX_FIELD_EQ(inName,"play") ) { return hx::Val( play_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"close") ) { return hx::Val( close_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_length() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"get_id3") ) { return hx::Val( get_id3_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__buffer") ) { return hx::Val( _hx___buffer ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { return hx::Val( bytesTotal ); }
		if (HX_FIELD_EQ(inName,"get_length") ) { return hx::Val( get_length_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { return hx::Val( bytesLoaded ); }
		if (HX_FIELD_EQ(inName,"isBuffering") ) { return hx::Val( isBuffering ); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"loadPCMFromByteArray") ) { return hx::Val( loadPCMFromByteArray_dyn() ); }
		break;
	case 21:
		if (HX_FIELD_EQ(inName,"AudioBuffer_onURLLoad") ) { return hx::Val( AudioBuffer_onURLLoad_dyn() ); }
		break;
	case 31:
		if (HX_FIELD_EQ(inName,"loadCompressedDataFromByteArray") ) { return hx::Val( loadCompressedDataFromByteArray_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Sound_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"fromFile") ) { outValue = fromFile_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"loadFromFile") ) { outValue = loadFromFile_dyn(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"loadFromFiles") ) { outValue = loadFromFiles_dyn(); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"fromAudioBuffer") ) { outValue = fromAudioBuffer_dyn(); return true; }
	}
	return false;
}

hx::Val Sound_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"url") ) { url=inValue.Cast< ::String >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__buffer") ) { _hx___buffer=inValue.Cast<  ::lime::media::AudioBuffer >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { bytesTotal=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { bytesLoaded=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"isBuffering") ) { isBuffering=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Sound_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99"));
	outFields->push(HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45"));
	outFields->push(HX_HCSTRING("id3","\xf8","\x03","\x50","\x00"));
	outFields->push(HX_HCSTRING("isBuffering","\x98","\x26","\x10","\x90"));
	outFields->push(HX_HCSTRING("length","\xe6","\x94","\x07","\x9f"));
	outFields->push(HX_HCSTRING("url","\x6f","\x2b","\x59","\x00"));
	outFields->push(HX_HCSTRING("__buffer","\x20","\x28","\xc4","\x78"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Sound_obj_sMemberStorageInfo[] = {
	{hx::fsInt,(int)offsetof(Sound_obj,bytesLoaded),HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99")},
	{hx::fsInt,(int)offsetof(Sound_obj,bytesTotal),HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45")},
	{hx::fsBool,(int)offsetof(Sound_obj,isBuffering),HX_HCSTRING("isBuffering","\x98","\x26","\x10","\x90")},
	{hx::fsString,(int)offsetof(Sound_obj,url),HX_HCSTRING("url","\x6f","\x2b","\x59","\x00")},
	{hx::fsObject /*::lime::media::AudioBuffer*/ ,(int)offsetof(Sound_obj,_hx___buffer),HX_HCSTRING("__buffer","\x20","\x28","\xc4","\x78")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Sound_obj_sStaticStorageInfo = 0;
#endif

static ::String Sound_obj_sMemberFields[] = {
	HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99"),
	HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45"),
	HX_HCSTRING("isBuffering","\x98","\x26","\x10","\x90"),
	HX_HCSTRING("url","\x6f","\x2b","\x59","\x00"),
	HX_HCSTRING("__buffer","\x20","\x28","\xc4","\x78"),
	HX_HCSTRING("close","\xb8","\x17","\x63","\x48"),
	HX_HCSTRING("load","\x26","\x9a","\xb7","\x47"),
	HX_HCSTRING("loadCompressedDataFromByteArray","\xd6","\x4f","\x5d","\xa0"),
	HX_HCSTRING("loadPCMFromByteArray","\x73","\x51","\xe4","\xc4"),
	HX_HCSTRING("play","\xf4","\x2d","\x5a","\x4a"),
	HX_HCSTRING("get_id3","\x8f","\xcc","\xc4","\x26"),
	HX_HCSTRING("get_length","\xaf","\x04","\x8f","\x8f"),
	HX_HCSTRING("AudioBuffer_onURLLoad","\x6d","\xfb","\xf7","\xc7"),
	::String(null()) };

static void Sound_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Sound_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Sound_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Sound_obj::__mClass,"__mClass");
};

#endif

hx::Class Sound_obj::__mClass;

static ::String Sound_obj_sStaticFields[] = {
	HX_HCSTRING("fromAudioBuffer","\x2c","\x65","\xe0","\xcd"),
	HX_HCSTRING("fromFile","\x06","\x9d","\x87","\xa1"),
	HX_HCSTRING("loadFromFile","\x4c","\x89","\xf0","\x5a"),
	HX_HCSTRING("loadFromFiles","\xa7","\x99","\x87","\x37"),
	::String(null())
};

void Sound_obj::__register()
{
	hx::Object *dummy = new Sound_obj;
	Sound_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl.media.Sound","\xc7","\x8b","\xe2","\x7e");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Sound_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Sound_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Sound_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Sound_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Sound_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Sound_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Sound_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Sound_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace media
