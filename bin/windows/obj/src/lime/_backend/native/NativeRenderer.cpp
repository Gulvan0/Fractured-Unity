// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeCFFI
#include <lime/_backend/native/NativeCFFI.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeGLRenderContext
#include <lime/_backend/native/NativeGLRenderContext.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeRenderer
#include <lime/_backend/native/NativeRenderer.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeWindow
#include <lime/_backend/native/NativeWindow.h>
#endif
#ifndef INCLUDED_lime_graphics_Image
#include <lime/graphics/Image.h>
#endif
#ifndef INCLUDED_lime_graphics_ImageBuffer
#include <lime/graphics/ImageBuffer.h>
#endif
#ifndef INCLUDED_lime_graphics_ImageType
#include <lime/graphics/ImageType.h>
#endif
#ifndef INCLUDED_lime_graphics_RenderContext
#include <lime/graphics/RenderContext.h>
#endif
#ifndef INCLUDED_lime_graphics_Renderer
#include <lime/graphics/Renderer.h>
#endif
#ifndef INCLUDED_lime_graphics_RendererType
#include <lime/graphics/RendererType.h>
#endif
#ifndef INCLUDED_lime_graphics_cairo_Cairo
#include <lime/graphics/cairo/Cairo.h>
#endif
#ifndef INCLUDED_lime_graphics_cairo__CairoImageSurface_CairoImageSurface_Impl_
#include <lime/graphics/cairo/_CairoImageSurface/CairoImageSurface_Impl_.h>
#endif
#ifndef INCLUDED_lime_graphics_cairo__CairoSurface_CairoSurface_Impl_
#include <lime/graphics/cairo/_CairoSurface/CairoSurface_Impl_.h>
#endif
#ifndef INCLUDED_lime_graphics_opengl_GL
#include <lime/graphics/opengl/GL.h>
#endif
#ifndef INCLUDED_lime_math_Rectangle
#include <lime/math/Rectangle.h>
#endif
#ifndef INCLUDED_lime_ui_Window
#include <lime/ui/Window.h>
#endif
#ifndef INCLUDED_lime_utils_ArrayBufferView
#include <lime/utils/ArrayBufferView.h>
#endif
#ifndef INCLUDED_lime_utils_TAError
#include <lime/utils/TAError.h>
#endif
#ifndef INCLUDED_lime_utils__DataPointer_DataPointer_Impl_
#include <lime/utils/_DataPointer/DataPointer_Impl_.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_49_new,"lime._backend.native.NativeRenderer","new",0x43f11223,"lime._backend.native.NativeRenderer.new","lime/_backend/native/NativeRenderer.hx",49,0x398cc96c)
HX_LOCAL_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_54_create,"lime._backend.native.NativeRenderer","create",0x10556119,"lime._backend.native.NativeRenderer.create","lime/_backend/native/NativeRenderer.hx",54,0x398cc96c)
HX_LOCAL_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_105_dispatch,"lime._backend.native.NativeRenderer","dispatch",0xcbb24a17,"lime._backend.native.NativeRenderer.dispatch","lime/_backend/native/NativeRenderer.hx",105,0x398cc96c)
HX_LOCAL_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_112_flip,"lime._backend.native.NativeRenderer","flip",0x29ba5b8a,"lime._backend.native.NativeRenderer.flip","lime/_backend/native/NativeRenderer.hx",112,0x398cc96c)
HX_LOCAL_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_134_readPixels,"lime._backend.native.NativeRenderer","readPixels",0x008f9fc0,"lime._backend.native.NativeRenderer.readPixels","lime/_backend/native/NativeRenderer.hx",134,0x398cc96c)
HX_LOCAL_STACK_FRAME(_hx_pos_9902e55c2a6c6eb8_224_render,"lime._backend.native.NativeRenderer","render",0x996f6573,"lime._backend.native.NativeRenderer.render","lime/_backend/native/NativeRenderer.hx",224,0x398cc96c)
namespace lime{
namespace _backend{
namespace native{

void NativeRenderer_obj::__construct( ::lime::graphics::Renderer parent){
            	HX_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_49_new)
HXDLIN(  49)		this->parent = parent;
            	}

Dynamic NativeRenderer_obj::__CreateEmpty() { return new NativeRenderer_obj; }

void *NativeRenderer_obj::_hx_vtable = 0;

Dynamic NativeRenderer_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< NativeRenderer_obj > _hx_result = new NativeRenderer_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool NativeRenderer_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x063914db;
}

void NativeRenderer_obj::create(){
            	HX_GC_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_54_create)
HXLINE(  57)		this->handle = ( ( ::Dynamic)(::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_create(hx::DynamicPtr(this->parent->window->backend->handle))) );
HXLINE(  59)		Float _hx_tmp = ::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_get_scale(hx::DynamicPtr(this->handle));
HXDLIN(  59)		this->parent->window->_hx___scale = _hx_tmp;
HXLINE(  69)		::String type = ( ( ::Dynamic)(::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_get_type(hx::DynamicPtr(this->handle))) );
HXLINE(  71)		if ((type == HX_("opengl",6f,64,94,21))) {
HXLINE(  75)			 ::lime::_backend::native::NativeGLRenderContext context =  ::lime::_backend::native::NativeGLRenderContext_obj::__alloc( HX_CTX );
HXLINE(  77)			this->useHardware = true;
HXLINE(  78)			this->parent->context = ::lime::graphics::RenderContext_obj::OPENGL(context);
HXLINE(  79)			this->parent->type = ::lime::graphics::RendererType_obj::OPENGL_dyn();
HXLINE(  81)			if (hx::IsNull( ::lime::graphics::opengl::GL_obj::context )) {
HXLINE(  83)				::lime::graphics::opengl::GL_obj::context = context;
            			}
            		}
            		else {
HXLINE(  89)			this->useHardware = false;
HXLINE(  92)			this->render();
HXLINE(  93)			this->parent->context = ::lime::graphics::RenderContext_obj::CAIRO(this->cairo);
HXLINE(  95)			this->parent->type = ::lime::graphics::RendererType_obj::CAIRO_dyn();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(NativeRenderer_obj,create,(void))

void NativeRenderer_obj::dispatch(){
            	HX_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_105_dispatch)
            	}


HX_DEFINE_DYNAMIC_FUNC0(NativeRenderer_obj,dispatch,(void))

void NativeRenderer_obj::flip(){
            	HX_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_112_flip)
HXLINE( 115)		if (!(this->useHardware)) {
HXLINE( 118)			if (hx::IsNotNull( this->cairo )) {
HXLINE( 120)				::lime::graphics::cairo::_CairoSurface::CairoSurface_Impl__obj::flush(this->primarySurface);
            			}
HXLINE( 124)			::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_unlock(hx::DynamicPtr(this->handle));
            		}
HXLINE( 128)		::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_flip(hx::DynamicPtr(this->handle));
            	}


HX_DEFINE_DYNAMIC_FUNC0(NativeRenderer_obj,flip,(void))

 ::lime::graphics::Image NativeRenderer_obj::readPixels( ::lime::math::Rectangle rect){
            	HX_GC_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_134_readPixels)
HXLINE( 136)		 ::lime::graphics::ImageBuffer imageBuffer = null();
HXLINE( 138)		{
HXLINE( 138)			 ::lime::graphics::RenderContext _g = this->parent->context;
HXDLIN( 138)			if ((_hx_getEnumValueIndex(_g) == (int)0)) {
HXLINE( 140)				 ::lime::_backend::native::NativeGLRenderContext gl = _g->_hx_getObject(0).StaticCast<  ::lime::_backend::native::NativeGLRenderContext >();
HXDLIN( 140)				{
HXLINE( 142)					int windowWidth = ::Std_obj::_hx_int((this->parent->window->_hx___width * this->parent->window->_hx___scale));
HXLINE( 143)					int windowHeight = ::Std_obj::_hx_int((this->parent->window->_hx___height * this->parent->window->_hx___scale));
HXLINE( 145)					int x;
HXDLIN( 145)					int y;
HXDLIN( 145)					int width;
HXDLIN( 145)					int height;
HXLINE( 147)					if (hx::IsNotNull( rect )) {
HXLINE( 149)						x = ::Std_obj::_hx_int(rect->x);
HXLINE( 150)						y = ::Std_obj::_hx_int(((windowHeight - rect->y) - rect->height));
HXLINE( 151)						width = ::Std_obj::_hx_int(rect->width);
HXLINE( 152)						height = ::Std_obj::_hx_int(rect->height);
            					}
            					else {
HXLINE( 156)						x = (int)0;
HXLINE( 157)						y = (int)0;
HXLINE( 158)						width = windowWidth;
HXLINE( 159)						height = windowHeight;
            					}
HXLINE( 163)					 ::Dynamic elements = ((width * height) * (int)4);
HXDLIN( 163)					 ::lime::utils::ArrayBufferView this1;
HXDLIN( 163)					if (hx::IsNotNull( elements )) {
HXLINE( 163)						this1 =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,elements,(int)4);
            					}
            					else {
HXLINE( 163)						HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            					}
HXDLIN( 163)					 ::lime::utils::ArrayBufferView data = this1;
HXLINE( 165)					int gl1 = gl->RGBA;
HXDLIN( 165)					int gl2 = gl->UNSIGNED_BYTE;
HXDLIN( 165)					gl->readPixels(x,y,width,height,gl1,gl2,::lime::utils::_DataPointer::DataPointer_Impl__obj::fromArrayBufferView(data));
HXLINE( 169)					int rowLength = (width * (int)4);
HXLINE( 170)					int srcPosition = ((height - (int)1) * rowLength);
HXLINE( 171)					int destPosition = (int)0;
HXLINE( 173)					 ::haxe::io::Bytes temp = ::haxe::io::Bytes_obj::alloc(rowLength);
HXLINE( 174)					 ::haxe::io::Bytes buffer = data->buffer;
HXLINE( 175)					int rows = ::Std_obj::_hx_int(((Float)height / (Float)(int)2));
HXLINE( 177)					while(true){
HXLINE( 177)						rows = (rows - (int)1);
HXDLIN( 177)						if (!(((rows + (int)1) > (int)0))) {
HXLINE( 177)							goto _hx_goto_4;
            						}
HXLINE( 179)						temp->blit((int)0,buffer,destPosition,rowLength);
HXLINE( 180)						buffer->blit(destPosition,buffer,srcPosition,rowLength);
HXLINE( 181)						buffer->blit(srcPosition,temp,(int)0,rowLength);
HXLINE( 183)						destPosition = (destPosition + rowLength);
HXLINE( 184)						srcPosition = (srcPosition - rowLength);
            					}
            					_hx_goto_4:;
HXLINE( 190)					imageBuffer =  ::lime::graphics::ImageBuffer_obj::__alloc( HX_CTX ,data,width,height,(int)32,(int)0);
            				}
            			}
            			else {
HXLINE( 196)				 ::Dynamic handle = this->handle;
HXDLIN( 196)				 ::haxe::io::Bytes buffer1 = ::haxe::io::Bytes_obj::alloc((int)0);
HXDLIN( 196)				 ::lime::utils::ArrayBufferView this2;
HXDLIN( 196)				if (hx::IsNotNull( buffer1 )) {
HXLINE( 196)					 ::lime::utils::ArrayBufferView _this =  ::lime::utils::ArrayBufferView_obj::__alloc( HX_CTX ,(int)0,(int)4);
HXDLIN( 196)					int in_byteOffset = (int)0;
HXDLIN( 196)					if ((in_byteOffset < (int)0)) {
HXLINE( 196)						HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            					}
HXDLIN( 196)					if ((hx::Mod(in_byteOffset,_this->bytesPerElement) != (int)0)) {
HXLINE( 196)						HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            					}
HXDLIN( 196)					int bufferByteLength = buffer1->length;
HXDLIN( 196)					int elementSize = _this->bytesPerElement;
HXDLIN( 196)					int newByteLength = bufferByteLength;
HXDLIN( 196)					{
HXLINE( 196)						newByteLength = (bufferByteLength - in_byteOffset);
HXDLIN( 196)						if ((hx::Mod(bufferByteLength,_this->bytesPerElement) != (int)0)) {
HXLINE( 196)							HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            						}
HXDLIN( 196)						if ((newByteLength < (int)0)) {
HXLINE( 196)							HX_STACK_DO_THROW(::lime::utils::TAError_obj::RangeError_dyn());
            						}
            					}
HXDLIN( 196)					_this->buffer = buffer1;
HXDLIN( 196)					_this->byteOffset = in_byteOffset;
HXDLIN( 196)					_this->byteLength = newByteLength;
HXDLIN( 196)					_this->length = ::Std_obj::_hx_int(((Float)newByteLength / (Float)_this->bytesPerElement));
HXDLIN( 196)					this2 = _this;
            				}
            				else {
HXLINE( 196)					HX_STACK_DO_THROW(HX_("Invalid constructor arguments for UInt8Array",6b,44,d5,85));
            				}
HXDLIN( 196)				 ::Dynamic imageBuffer1 =  ::lime::graphics::ImageBuffer_obj::__alloc( HX_CTX ,this2,null(),null(),null(),null());
HXDLIN( 196)				imageBuffer = ( ( ::Dynamic)(::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_read_pixels(hx::DynamicPtr(handle),hx::DynamicPtr(rect),hx::DynamicPtr(imageBuffer1))) );
HXLINE( 205)				if (hx::IsNotNull( imageBuffer )) {
HXLINE( 207)					imageBuffer->format = (int)0;
            				}
            			}
            		}
HXLINE( 213)		if (hx::IsNotNull( imageBuffer )) {
HXLINE( 215)			return  ::lime::graphics::Image_obj::__alloc( HX_CTX ,imageBuffer,null(),null(),null(),null(),null(),null());
            		}
HXLINE( 219)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(NativeRenderer_obj,readPixels,return )

void NativeRenderer_obj::render(){
            	HX_GC_STACKFRAME(&_hx_pos_9902e55c2a6c6eb8_224_render)
HXLINE( 227)		::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_make_current(hx::DynamicPtr(this->handle));
HXLINE( 229)		if (!(this->useHardware)) {
HXLINE( 232)			 ::Dynamic lock = ( ( ::Dynamic)(::lime::_backend::native::NativeCFFI_obj::cffi_lime_renderer_lock(hx::DynamicPtr(this->handle))) );
HXLINE( 234)			bool _hx_tmp;
HXDLIN( 234)			if (hx::IsNotNull( lock )) {
HXLINE( 234)				bool _hx_tmp1;
HXDLIN( 234)				bool _hx_tmp2;
HXDLIN( 234)				if (hx::IsNotNull( this->cacheLock )) {
HXLINE( 234)					_hx_tmp2 = hx::IsNotEq(  ::Dynamic(this->cacheLock->__Field(HX_("pixels",2d,ef,a9,8c),hx::paccDynamic)), ::Dynamic(lock->__Field(HX_("pixels",2d,ef,a9,8c),hx::paccDynamic)) );
            				}
            				else {
HXLINE( 234)					_hx_tmp2 = true;
            				}
HXDLIN( 234)				if (!(_hx_tmp2)) {
HXLINE( 234)					_hx_tmp1 = hx::IsNotEq(  ::Dynamic(this->cacheLock->__Field(HX_("width",06,b6,62,ca),hx::paccDynamic)), ::Dynamic(lock->__Field(HX_("width",06,b6,62,ca),hx::paccDynamic)) );
            				}
            				else {
HXLINE( 234)					_hx_tmp1 = true;
            				}
HXDLIN( 234)				if (!(_hx_tmp1)) {
HXLINE( 234)					_hx_tmp = hx::IsNotEq(  ::Dynamic(this->cacheLock->__Field(HX_("height",e7,07,4c,02),hx::paccDynamic)), ::Dynamic(lock->__Field(HX_("height",e7,07,4c,02),hx::paccDynamic)) );
            				}
            				else {
HXLINE( 234)					_hx_tmp = true;
            				}
            			}
            			else {
HXLINE( 234)				_hx_tmp = false;
            			}
HXDLIN( 234)			if (_hx_tmp) {
HXLINE( 236)				this->primarySurface = ::lime::graphics::cairo::_CairoImageSurface::CairoImageSurface_Impl__obj::create(( (Float)(lock->__Field(HX_("pixels",2d,ef,a9,8c),hx::paccDynamic)) ),(int)0,( (int)(lock->__Field(HX_("width",06,b6,62,ca),hx::paccDynamic)) ),( (int)(lock->__Field(HX_("height",e7,07,4c,02),hx::paccDynamic)) ),( (int)(lock->__Field(HX_("pitch",c0,bb,a0,c2),hx::paccDynamic)) ));
HXLINE( 238)				if (hx::IsNotNull( this->cairo )) {
HXLINE( 240)					this->cairo->recreate(this->primarySurface);
            				}
            				else {
HXLINE( 244)					this->cairo =  ::lime::graphics::cairo::Cairo_obj::__alloc( HX_CTX ,this->primarySurface);
            				}
            			}
HXLINE( 250)			this->cacheLock = lock;
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(NativeRenderer_obj,render,(void))


hx::ObjectPtr< NativeRenderer_obj > NativeRenderer_obj::__new( ::lime::graphics::Renderer parent) {
	hx::ObjectPtr< NativeRenderer_obj > __this = new NativeRenderer_obj();
	__this->__construct(parent);
	return __this;
}

hx::ObjectPtr< NativeRenderer_obj > NativeRenderer_obj::__alloc(hx::Ctx *_hx_ctx, ::lime::graphics::Renderer parent) {
	NativeRenderer_obj *__this = (NativeRenderer_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(NativeRenderer_obj), true, "lime._backend.native.NativeRenderer"));
	*(void **)__this = NativeRenderer_obj::_hx_vtable;
	__this->__construct(parent);
	return __this;
}

NativeRenderer_obj::NativeRenderer_obj()
{
}

void NativeRenderer_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(NativeRenderer);
	HX_MARK_MEMBER_NAME(handle,"handle");
	HX_MARK_MEMBER_NAME(parent,"parent");
	HX_MARK_MEMBER_NAME(useHardware,"useHardware");
	HX_MARK_MEMBER_NAME(cacheLock,"cacheLock");
	HX_MARK_MEMBER_NAME(cairo,"cairo");
	HX_MARK_MEMBER_NAME(primarySurface,"primarySurface");
	HX_MARK_END_CLASS();
}

void NativeRenderer_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(handle,"handle");
	HX_VISIT_MEMBER_NAME(parent,"parent");
	HX_VISIT_MEMBER_NAME(useHardware,"useHardware");
	HX_VISIT_MEMBER_NAME(cacheLock,"cacheLock");
	HX_VISIT_MEMBER_NAME(cairo,"cairo");
	HX_VISIT_MEMBER_NAME(primarySurface,"primarySurface");
}

hx::Val NativeRenderer_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"flip") ) { return hx::Val( flip_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"cairo") ) { return hx::Val( cairo ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"handle") ) { return hx::Val( handle ); }
		if (HX_FIELD_EQ(inName,"parent") ) { return hx::Val( parent ); }
		if (HX_FIELD_EQ(inName,"create") ) { return hx::Val( create_dyn() ); }
		if (HX_FIELD_EQ(inName,"render") ) { return hx::Val( render_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"dispatch") ) { return hx::Val( dispatch_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"cacheLock") ) { return hx::Val( cacheLock ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"readPixels") ) { return hx::Val( readPixels_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"useHardware") ) { return hx::Val( useHardware ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"primarySurface") ) { return hx::Val( primarySurface ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val NativeRenderer_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"cairo") ) { cairo=inValue.Cast<  ::lime::graphics::cairo::Cairo >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"handle") ) { handle=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"parent") ) { parent=inValue.Cast<  ::lime::graphics::Renderer >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"cacheLock") ) { cacheLock=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"useHardware") ) { useHardware=inValue.Cast< bool >(); return inValue; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"primarySurface") ) { primarySurface=inValue.Cast<  ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void NativeRenderer_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("handle","\xa8","\x83","\xfd","\xb7"));
	outFields->push(HX_HCSTRING("parent","\x2a","\x05","\x7e","\xed"));
	outFields->push(HX_HCSTRING("useHardware","\x0f","\xea","\xde","\xcf"));
	outFields->push(HX_HCSTRING("cacheLock","\x4d","\xab","\x6c","\x43"));
	outFields->push(HX_HCSTRING("cairo","\x88","\x30","\x19","\x41"));
	outFields->push(HX_HCSTRING("primarySurface","\x8b","\xaa","\xee","\x10"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo NativeRenderer_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*Dynamic*/ ,(int)offsetof(NativeRenderer_obj,handle),HX_HCSTRING("handle","\xa8","\x83","\xfd","\xb7")},
	{hx::fsObject /*::lime::graphics::Renderer*/ ,(int)offsetof(NativeRenderer_obj,parent),HX_HCSTRING("parent","\x2a","\x05","\x7e","\xed")},
	{hx::fsBool,(int)offsetof(NativeRenderer_obj,useHardware),HX_HCSTRING("useHardware","\x0f","\xea","\xde","\xcf")},
	{hx::fsObject /*Dynamic*/ ,(int)offsetof(NativeRenderer_obj,cacheLock),HX_HCSTRING("cacheLock","\x4d","\xab","\x6c","\x43")},
	{hx::fsObject /*::lime::graphics::cairo::Cairo*/ ,(int)offsetof(NativeRenderer_obj,cairo),HX_HCSTRING("cairo","\x88","\x30","\x19","\x41")},
	{hx::fsObject /*Dynamic*/ ,(int)offsetof(NativeRenderer_obj,primarySurface),HX_HCSTRING("primarySurface","\x8b","\xaa","\xee","\x10")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *NativeRenderer_obj_sStaticStorageInfo = 0;
#endif

static ::String NativeRenderer_obj_sMemberFields[] = {
	HX_HCSTRING("handle","\xa8","\x83","\xfd","\xb7"),
	HX_HCSTRING("parent","\x2a","\x05","\x7e","\xed"),
	HX_HCSTRING("useHardware","\x0f","\xea","\xde","\xcf"),
	HX_HCSTRING("cacheLock","\x4d","\xab","\x6c","\x43"),
	HX_HCSTRING("cairo","\x88","\x30","\x19","\x41"),
	HX_HCSTRING("primarySurface","\x8b","\xaa","\xee","\x10"),
	HX_HCSTRING("create","\xfc","\x66","\x0f","\x7c"),
	HX_HCSTRING("dispatch","\xba","\xce","\x63","\x1e"),
	HX_HCSTRING("flip","\xad","\x12","\xbe","\x43"),
	HX_HCSTRING("readPixels","\x23","\xd3","\x25","\x86"),
	HX_HCSTRING("render","\x56","\x6b","\x29","\x05"),
	::String(null()) };

static void NativeRenderer_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(NativeRenderer_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void NativeRenderer_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(NativeRenderer_obj::__mClass,"__mClass");
};

#endif

hx::Class NativeRenderer_obj::__mClass;

void NativeRenderer_obj::__register()
{
	hx::Object *dummy = new NativeRenderer_obj;
	NativeRenderer_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lime._backend.native.NativeRenderer","\xb1","\xc4","\x96","\xae");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = NativeRenderer_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(NativeRenderer_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< NativeRenderer_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = NativeRenderer_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = NativeRenderer_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = NativeRenderer_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace _backend
} // end namespace native
