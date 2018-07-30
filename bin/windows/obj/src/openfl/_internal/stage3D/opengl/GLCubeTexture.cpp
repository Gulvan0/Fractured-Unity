// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeGLRenderContext
#include <lime/_backend/native/NativeGLRenderContext.h>
#endif
#ifndef INCLUDED_lime_graphics_Image
#include <lime/graphics/Image.h>
#endif
#ifndef INCLUDED_lime_graphics_opengl_GLObject
#include <lime/graphics/opengl/GLObject.h>
#endif
#ifndef INCLUDED_lime_utils_ArrayBufferView
#include <lime/utils/ArrayBufferView.h>
#endif
#ifndef INCLUDED_lime_utils_BytePointerData
#include <lime/utils/BytePointerData.h>
#endif
#ifndef INCLUDED_lime_utils_TAError
#include <lime/utils/TAError.h>
#endif
#ifndef INCLUDED_lime_utils__DataPointer_DataPointer_Impl_
#include <lime/utils/_DataPointer/DataPointer_Impl_.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_GLCompressedTextureFormats
#include <openfl/_internal/stage3D/GLCompressedTextureFormats.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_GLUtils
#include <openfl/_internal/stage3D/GLUtils.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_SamplerState
#include <openfl/_internal/stage3D/SamplerState.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_atf_ATFReader
#include <openfl/_internal/stage3D/atf/ATFReader.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_opengl_GLCubeTexture
#include <openfl/_internal/stage3D/opengl/GLCubeTexture.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_opengl_GLTextureBase
#include <openfl/_internal/stage3D/opengl/GLTextureBase.h>
#endif
#ifndef INCLUDED_openfl_display_BitmapData
#include <openfl/display/BitmapData.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectRenderer
#include <openfl/display/DisplayObjectRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_OpenGLRenderer
#include <openfl/display/OpenGLRenderer.h>
#endif
#ifndef INCLUDED_openfl_display3D_Context3D
#include <openfl/display3D/Context3D.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_CubeTexture
#include <openfl/display3D/textures/CubeTexture.h>
#endif
#ifndef INCLUDED_openfl_display3D_textures_TextureBase
#include <openfl/display3D/textures/TextureBase.h>
#endif
#ifndef INCLUDED_openfl_errors_Error
#include <openfl/errors/Error.h>
#endif
#ifndef INCLUDED_openfl_errors_IllegalOperationError
#include <openfl/errors/IllegalOperationError.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
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

HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_34_create,"openfl._internal.stage3D.opengl.GLCubeTexture","create",0x48ed39b9,"openfl._internal.stage3D.opengl.GLCubeTexture.create","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",34,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_56_uploadCompressedTextureFromByteArray,"openfl._internal.stage3D.opengl.GLCubeTexture","uploadCompressedTextureFromByteArray",0xdef8954b,"openfl._internal.stage3D.opengl.GLCubeTexture.uploadCompressedTextureFromByteArray","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",56,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_44_uploadCompressedTextureFromByteArray,"openfl._internal.stage3D.opengl.GLCubeTexture","uploadCompressedTextureFromByteArray",0xdef8954b,"openfl._internal.stage3D.opengl.GLCubeTexture.uploadCompressedTextureFromByteArray","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",44,0x3a88686b)
static const bool _hx_array_data_304a1811_4[] = {
	0,
};
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_115_uploadFromBitmapData,"openfl._internal.stage3D.opengl.GLCubeTexture","uploadFromBitmapData",0x29d3c921,"openfl._internal.stage3D.opengl.GLCubeTexture.uploadFromBitmapData","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",115,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_166_uploadFromByteArray,"openfl._internal.stage3D.opengl.GLCubeTexture","uploadFromByteArray",0x83789309,"openfl._internal.stage3D.opengl.GLCubeTexture.uploadFromByteArray","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",166,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_171_uploadFromTypedArray,"openfl._internal.stage3D.opengl.GLCubeTexture","uploadFromTypedArray",0xee62c037,"openfl._internal.stage3D.opengl.GLCubeTexture.uploadFromTypedArray","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",171,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_198_setSamplerState,"openfl._internal.stage3D.opengl.GLCubeTexture","setSamplerState",0x1748244e,"openfl._internal.stage3D.opengl.GLCubeTexture.setSamplerState","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",198,0x3a88686b)
HX_LOCAL_STACK_FRAME(_hx_pos_265aa4370dc0ac3c_229___sideToTarget,"openfl._internal.stage3D.opengl.GLCubeTexture","__sideToTarget",0x9965aec0,"openfl._internal.stage3D.opengl.GLCubeTexture.__sideToTarget","openfl/_internal/stage3D/opengl/GLCubeTexture.hx",229,0x3a88686b)
namespace openfl{
namespace _internal{
namespace stage3D{
namespace opengl{

void GLCubeTexture_obj::__construct() { }

Dynamic GLCubeTexture_obj::__CreateEmpty() { return new GLCubeTexture_obj; }

void *GLCubeTexture_obj::_hx_vtable = 0;

Dynamic GLCubeTexture_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< GLCubeTexture_obj > _hx_result = new GLCubeTexture_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool GLCubeTexture_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0147a12f;
}

void GLCubeTexture_obj::create( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_34_create)
HXLINE(  36)		 ::lime::_backend::native::NativeGLRenderContext gl = renderer->_hx___gl;
HXLINE(  38)		cubeTexture->_hx___textureTarget = gl->TEXTURE_CUBE_MAP;
HXLINE(  39)		cubeTexture->_hx___uploadedSides = (int)0;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(GLCubeTexture_obj,create,(void))

void GLCubeTexture_obj::uploadCompressedTextureFromByteArray( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer, ::openfl::utils::ByteArrayData data,int byteArrayOffset){
            		HX_BEGIN_LOCAL_FUNC_S4(hx::LocalFunc,_hx_Closure_0,::Array< bool >,hasTexture,bool,alpha, ::lime::_backend::native::NativeGLRenderContext,gl, ::openfl::display3D::textures::CubeTexture,cubeTexture) HXARGC(7)
            		void _hx_run(int side,int level,int gpuFormat,int width,int height,int blockLength, ::haxe::io::Bytes bytes){
            			HX_GC_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_56_uploadCompressedTextureFromByteArray)
HXLINE(  58)			int format = ::openfl::_internal::stage3D::opengl::GLTextureBase_obj::_hx___compressedTextureFormats->toTextureFormat(alpha,gpuFormat);
HXLINE(  59)			if ((format == (int)0)) {
HXLINE(  59)				return;
            			}
HXLINE(  61)			hasTexture[(int)0] = true;
HXLINE(  62)			int target = ::openfl::_internal::stage3D::opengl::GLCubeTexture_obj::_hx___sideToTarget(gl,side);
HXLINE(  64)			cubeTexture->_hx___format = format;
HXLINE(  65)			cubeTexture->_hx___internalFormat = format;
HXLINE(  67)			bool _hx_tmp;
HXDLIN(  67)			if (alpha) {
HXLINE(  67)				_hx_tmp = (gpuFormat == (int)2);
            			}
            			else {
HXLINE(  67)				_hx_tmp = false;
            			}
HXDLIN(  67)			if (_hx_tmp) {
HXLINE(  69)				int size = ::Std_obj::_hx_int(((Float)blockLength / (Float)(int)2));
HXLINE(  71)				int cubeTexture1 = cubeTexture->_hx___internalFormat;
HXDLIN(  71)				gl->compressedTexImage2D(target,level,cubeTexture1,width,height,(int)0,size,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromArrayBuffer(bytes));
HXLINE(  72)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE(  74)				 ::openfl::display3D::textures::CubeTexture alphaTexture =  ::openfl::display3D::textures::CubeTexture_obj::__alloc( HX_CTX ,cubeTexture->_hx___context,cubeTexture->_hx___size,(int)3,cubeTexture->_hx___optimizeForRenderToTexture,cubeTexture->_hx___streamingLevels);
HXLINE(  75)				alphaTexture->_hx___format = format;
HXLINE(  76)				alphaTexture->_hx___internalFormat = format;
HXLINE(  78)				gl->bindTexture(alphaTexture->_hx___textureTarget,alphaTexture->_hx___textureID);
HXLINE(  79)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE(  81)				int alphaTexture1 = alphaTexture->_hx___internalFormat;
HXDLIN(  81)				 ::lime::utils::BytePointerData this1 =  ::lime::utils::BytePointerData_obj::__alloc( HX_CTX ,bytes,size);
HXDLIN(  81)				gl->compressedTexImage2D(target,level,alphaTexture1,width,height,(int)0,size,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromBytesPointer(this1));
HXLINE(  82)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE(  84)				cubeTexture->_hx___alphaTexture = alphaTexture;
            			}
            			else {
HXLINE(  88)				int cubeTexture2 = cubeTexture->_hx___internalFormat;
HXDLIN(  88)				gl->compressedTexImage2D(target,level,cubeTexture2,width,height,(int)0,blockLength,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromArrayBuffer(bytes));
HXLINE(  89)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
            			}
            		}
            		HX_END_LOCAL_FUNC7((void))

            	HX_GC_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_44_uploadCompressedTextureFromByteArray)
HXLINE(  46)		 ::openfl::_internal::stage3D::atf::ATFReader reader =  ::openfl::_internal::stage3D::atf::ATFReader_obj::__alloc( HX_CTX ,data,byteArrayOffset);
HXLINE(  47)		bool alpha = reader->readHeader(cubeTexture->_hx___size,cubeTexture->_hx___size,true);
HXLINE(  49)		 ::lime::_backend::native::NativeGLRenderContext gl = renderer->_hx___gl;
HXLINE(  51)		gl->bindTexture(cubeTexture->_hx___textureTarget,cubeTexture->_hx___textureID);
HXLINE(  52)		::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE(  54)		::Array< bool > hasTexture = ::Array_obj< bool >::fromData( _hx_array_data_304a1811_4,1);
HXLINE(  56)		reader->readTextures( ::Dynamic(new _hx_Closure_0(hasTexture,alpha,gl,cubeTexture)));
HXLINE(  97)		if (!(hasTexture->__get((int)0))) {
HXLINE(  99)			int _g = (int)0;
HXDLIN(  99)			while((_g < (int)6)){
HXLINE(  99)				_g = (_g + (int)1);
HXDLIN(  99)				int side1 = (_g - (int)1);
HXLINE( 101)				 ::Dynamic elements = ((cubeTexture->_hx___size * cubeTexture->_hx___size) * (int)4);
HXDLIN( 101)				 ::lime::utils::ArrayBufferView this2;
HXDLIN( 101)				if (hx::IsNotNull( elements )) {
HXLINE( 101)					this2 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,elements,(int)4);
            				}
            				else {
HXLINE( 101)					HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            				}
HXDLIN( 101)				 ::lime::utils::ArrayBufferView data1 = this2;
HXLINE( 102)				int _hx_tmp1 = ::openfl::_internal::stage3D::opengl::GLCubeTexture_obj::_hx___sideToTarget(gl,side1);
HXDLIN( 102)				int cubeTexture3 = cubeTexture->_hx___internalFormat;
HXDLIN( 102)				int cubeTexture4 = cubeTexture->_hx___size;
HXDLIN( 102)				int cubeTexture5 = cubeTexture->_hx___size;
HXDLIN( 102)				int cubeTexture6 = cubeTexture->_hx___format;
HXDLIN( 102)				int gl1 = gl->UNSIGNED_BYTE;
HXDLIN( 102)				gl->texImage2D(_hx_tmp1,(int)0,cubeTexture3,cubeTexture4,cubeTexture5,(int)0,cubeTexture6,gl1,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromArrayBufferView(data1));
HXLINE( 103)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
            			}
            		}
HXLINE( 109)		gl->bindTexture(cubeTexture->_hx___textureTarget,null());
HXLINE( 110)		::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(GLCubeTexture_obj,uploadCompressedTextureFromByteArray,(void))

void GLCubeTexture_obj::uploadFromBitmapData( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer, ::openfl::display::BitmapData source,int side,hx::Null< int >  __o_miplevel,hx::Null< bool >  __o_generateMipmap){
int miplevel = __o_miplevel.Default(0);
bool generateMipmap = __o_generateMipmap.Default(false);
            	HX_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_115_uploadFromBitmapData)
HXLINE( 117)		int size = ((int)cubeTexture->_hx___size >> (int)miplevel);
HXLINE( 118)		if ((size == (int)0)) {
HXLINE( 118)			return;
            		}
HXLINE( 120)		 ::lime::graphics::Image image = cubeTexture->_hx___getImage(source);
HXLINE( 121)		if (hx::IsNull( image )) {
HXLINE( 121)			return;
            		}
HXLINE( 150)		::openfl::_internal::stage3D::opengl::GLCubeTexture_obj::uploadFromTypedArray(cubeTexture,renderer,image->get_data(),side,miplevel);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC6(GLCubeTexture_obj,uploadFromBitmapData,(void))

void GLCubeTexture_obj::uploadFromByteArray( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer, ::openfl::utils::ByteArrayData data,int byteArrayOffset,int side,int miplevel){
            	HX_GC_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_166_uploadFromByteArray)
HXDLIN( 166)		 ::haxe::io::Bytes buffer = ::openfl::utils::_ByteArray::ByteArray_Impl__obj::toArrayBuffer(data);
HXDLIN( 166)		 ::lime::utils::ArrayBufferView this1;
HXDLIN( 166)		if (hx::IsNotNull( buffer )) {
HXDLIN( 166)			 ::lime::utils::ArrayBufferView _this =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,(int)0,(int)4);
HXDLIN( 166)			int in_byteOffset = byteArrayOffset;
HXDLIN( 166)			if ((in_byteOffset < (int)0)) {
HXDLIN( 166)				HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            			}
HXDLIN( 166)			if ((hx::Mod(in_byteOffset,_this->bytesPerElement) != (int)0)) {
HXDLIN( 166)				HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            			}
HXDLIN( 166)			int bufferByteLength = buffer->length;
HXDLIN( 166)			int elementSize = _this->bytesPerElement;
HXDLIN( 166)			int newByteLength = bufferByteLength;
HXDLIN( 166)			{
HXDLIN( 166)				newByteLength = (bufferByteLength - in_byteOffset);
HXDLIN( 166)				if ((hx::Mod(bufferByteLength,_this->bytesPerElement) != (int)0)) {
HXDLIN( 166)					HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            				}
HXDLIN( 166)				if ((newByteLength < (int)0)) {
HXDLIN( 166)					HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            				}
            			}
HXDLIN( 166)			_this->buffer = buffer;
HXDLIN( 166)			_this->byteOffset = in_byteOffset;
HXDLIN( 166)			_this->byteLength = newByteLength;
HXDLIN( 166)			_this->length = ::Std_obj::_hx_int(((Float)newByteLength / (Float)_this->bytesPerElement));
HXDLIN( 166)			this1 = _this;
            		}
            		else {
HXDLIN( 166)			HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            		}
HXDLIN( 166)		::openfl::_internal::stage3D::opengl::GLCubeTexture_obj::uploadFromTypedArray(cubeTexture,renderer,this1,side,miplevel);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC6(GLCubeTexture_obj,uploadFromByteArray,(void))

void GLCubeTexture_obj::uploadFromTypedArray( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer, ::lime::utils::ArrayBufferView data,int side,int miplevel){
            	HX_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_171_uploadFromTypedArray)
HXLINE( 173)		if (hx::IsNull( data )) {
HXLINE( 173)			return;
            		}
HXLINE( 174)		 ::lime::_backend::native::NativeGLRenderContext gl = renderer->_hx___gl;
HXLINE( 176)		int size = ((int)cubeTexture->_hx___size >> (int)miplevel);
HXLINE( 177)		if ((size == (int)0)) {
HXLINE( 177)			return;
            		}
HXLINE( 179)		int target = ::openfl::_internal::stage3D::opengl::GLCubeTexture_obj::_hx___sideToTarget(gl,side);
HXLINE( 181)		gl->bindTexture(gl->TEXTURE_CUBE_MAP,cubeTexture->_hx___textureID);
HXLINE( 182)		::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE( 184)		int cubeTexture1 = cubeTexture->_hx___internalFormat;
HXDLIN( 184)		int cubeTexture2 = cubeTexture->_hx___format;
HXDLIN( 184)		int gl1 = gl->UNSIGNED_BYTE;
HXDLIN( 184)		gl->texImage2D(target,miplevel,cubeTexture1,size,size,(int)0,cubeTexture2,gl1,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromArrayBufferView(data));
HXLINE( 185)		::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE( 187)		gl->bindTexture(cubeTexture->_hx___textureTarget,null());
HXLINE( 188)		::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE( 190)		 ::openfl::display3D::textures::CubeTexture cubeTexture3 = cubeTexture;
HXDLIN( 190)		cubeTexture3->_hx___uploadedSides = ((int)cubeTexture3->_hx___uploadedSides | (int)((int)(int)1 << (int)side));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC5(GLCubeTexture_obj,uploadFromTypedArray,(void))

void GLCubeTexture_obj::setSamplerState( ::openfl::display3D::textures::CubeTexture cubeTexture, ::openfl::display::OpenGLRenderer renderer, ::openfl::_internal::stage3D::SamplerState state){
            	HX_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_198_setSamplerState)
HXLINE( 200)		if (!(state->equals(cubeTexture->_hx___samplerState))) {
HXLINE( 202)			 ::lime::_backend::native::NativeGLRenderContext gl = renderer->_hx___gl;
HXLINE( 204)			bool _hx_tmp;
HXDLIN( 204)			bool _hx_tmp1;
HXDLIN( 204)			if ((state->minFilter != gl->NEAREST)) {
HXLINE( 204)				_hx_tmp1 = (state->minFilter != gl->LINEAR);
            			}
            			else {
HXLINE( 204)				_hx_tmp1 = false;
            			}
HXDLIN( 204)			if (_hx_tmp1) {
HXLINE( 204)				_hx_tmp = !(state->mipmapGenerated);
            			}
            			else {
HXLINE( 204)				_hx_tmp = false;
            			}
HXDLIN( 204)			if (_hx_tmp) {
HXLINE( 206)				gl->generateMipmap(gl->TEXTURE_CUBE_MAP);
HXLINE( 207)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
HXLINE( 209)				state->mipmapGenerated = true;
            			}
HXLINE( 213)			if ((state->maxAniso != ((Float)0.0))) {
HXLINE( 215)				gl->texParameterf(gl->TEXTURE_CUBE_MAP,::openfl::display3D::Context3D_obj::TEXTURE_MAX_ANISOTROPY_EXT,state->maxAniso);
HXLINE( 216)				::openfl::_internal::stage3D::GLUtils_obj::CheckGLError();
            			}
            		}
HXLINE( 222)		::openfl::_internal::stage3D::opengl::GLTextureBase_obj::setSamplerState(cubeTexture,renderer,state);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(GLCubeTexture_obj,setSamplerState,(void))

int GLCubeTexture_obj::_hx___sideToTarget( ::lime::_backend::native::NativeGLRenderContext gl,int side){
            	HX_GC_STACKFRAME(&_hx_pos_265aa4370dc0ac3c_229___sideToTarget)
HXDLIN( 229)		switch((int)(side)){
            			case (int)0: {
HXLINE( 231)				return gl->TEXTURE_CUBE_MAP_NEGATIVE_X;
            			}
            			break;
            			case (int)1: {
HXLINE( 232)				return gl->TEXTURE_CUBE_MAP_POSITIVE_X;
            			}
            			break;
            			case (int)2: {
HXLINE( 233)				return gl->TEXTURE_CUBE_MAP_NEGATIVE_Y;
            			}
            			break;
            			case (int)3: {
HXLINE( 234)				return gl->TEXTURE_CUBE_MAP_POSITIVE_Y;
            			}
            			break;
            			case (int)4: {
HXLINE( 235)				return gl->TEXTURE_CUBE_MAP_NEGATIVE_Z;
            			}
            			break;
            			case (int)5: {
HXLINE( 236)				return gl->TEXTURE_CUBE_MAP_POSITIVE_Z;
            			}
            			break;
            			default:{
HXLINE( 237)				HX_STACK_DO_THROW( ::openfl::errors::IllegalOperationError_obj::__alloc( HX_CTX ,null()));
            			}
            		}
HXLINE( 229)		return (int)0;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(GLCubeTexture_obj,_hx___sideToTarget,return )


GLCubeTexture_obj::GLCubeTexture_obj()
{
}

bool GLCubeTexture_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { outValue = create_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"__sideToTarget") ) { outValue = _hx___sideToTarget_dyn(); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"setSamplerState") ) { outValue = setSamplerState_dyn(); return true; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"uploadFromByteArray") ) { outValue = uploadFromByteArray_dyn(); return true; }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"uploadFromBitmapData") ) { outValue = uploadFromBitmapData_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"uploadFromTypedArray") ) { outValue = uploadFromTypedArray_dyn(); return true; }
		break;
	case 36:
		if (HX_FIELD_EQ(inName,"uploadCompressedTextureFromByteArray") ) { outValue = uploadCompressedTextureFromByteArray_dyn(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *GLCubeTexture_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *GLCubeTexture_obj_sStaticStorageInfo = 0;
#endif

static void GLCubeTexture_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(GLCubeTexture_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void GLCubeTexture_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(GLCubeTexture_obj::__mClass,"__mClass");
};

#endif

hx::Class GLCubeTexture_obj::__mClass;

static ::String GLCubeTexture_obj_sStaticFields[] = {
	HX_HCSTRING("create","\xfc","\x66","\x0f","\x7c"),
	HX_HCSTRING("uploadCompressedTextureFromByteArray","\xce","\xc7","\x86","\xc5"),
	HX_HCSTRING("uploadFromBitmapData","\xa4","\x85","\x65","\x0d"),
	HX_HCSTRING("uploadFromByteArray","\xe6","\x17","\x1b","\xee"),
	HX_HCSTRING("uploadFromTypedArray","\xba","\x7c","\xf4","\xd1"),
	HX_HCSTRING("setSamplerState","\xab","\xb6","\x75","\xda"),
	HX_HCSTRING("__sideToTarget","\x03","\x57","\x2b","\x63"),
	::String(null())
};

void GLCubeTexture_obj::__register()
{
	hx::Object *dummy = new GLCubeTexture_obj;
	GLCubeTexture_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._internal.stage3D.opengl.GLCubeTexture","\x11","\x18","\x4a","\x30");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &GLCubeTexture_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = GLCubeTexture_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(GLCubeTexture_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< GLCubeTexture_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = GLCubeTexture_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = GLCubeTexture_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = GLCubeTexture_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace _internal
} // end namespace stage3D
} // end namespace opengl
