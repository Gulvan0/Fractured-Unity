// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_lime_graphics_cairo_Cairo
#include <lime/graphics/cairo/Cairo.h>
#endif
#ifndef INCLUDED_openfl__internal_renderer_cairo_CairoDisplayObject
#include <openfl/_internal/renderer/cairo/CairoDisplayObject.h>
#endif
#ifndef INCLUDED_openfl__internal_renderer_cairo_CairoShape
#include <openfl/_internal/renderer/cairo/CairoShape.h>
#endif
#ifndef INCLUDED_openfl_display_CairoRenderer
#include <openfl/display/CairoRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectRenderer
#include <openfl/display/DisplayObjectRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_Graphics
#include <openfl/display/Graphics.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_geom_Matrix
#include <openfl/geom/Matrix.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_29f2867d580e2ec4_20_render,"openfl._internal.renderer.cairo.CairoDisplayObject","render",0xdb2265aa,"openfl._internal.renderer.cairo.CairoDisplayObject.render","openfl/_internal/renderer/cairo/CairoDisplayObject.hx",20,0xea0a3da4)
namespace openfl{
namespace _internal{
namespace renderer{
namespace cairo{

void CairoDisplayObject_obj::__construct() { }

Dynamic CairoDisplayObject_obj::__CreateEmpty() { return new CairoDisplayObject_obj; }

void *CairoDisplayObject_obj::_hx_vtable = 0;

Dynamic CairoDisplayObject_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< CairoDisplayObject_obj > _hx_result = new CairoDisplayObject_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool CairoDisplayObject_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x03db1e16;
}

void CairoDisplayObject_obj::render( ::openfl::display::DisplayObject displayObject, ::openfl::display::CairoRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_29f2867d580e2ec4_20_render)
HXLINE(  23)		bool _hx_tmp;
HXDLIN(  23)		if (hx::IsNull( displayObject->opaqueBackground )) {
HXLINE(  23)			_hx_tmp = hx::IsNull( displayObject->_hx___graphics );
            		}
            		else {
HXLINE(  23)			_hx_tmp = false;
            		}
HXDLIN(  23)		if (_hx_tmp) {
HXLINE(  23)			return;
            		}
HXLINE(  25)		if (!(displayObject->_hx___renderable)) {
HXLINE(  25)			return;
            		}
HXLINE(  27)		Float alpha = renderer->_hx___getAlpha(displayObject->_hx___worldAlpha);
HXLINE(  29)		if ((alpha <= (int)0)) {
HXLINE(  29)			return;
            		}
HXLINE(  31)		bool _hx_tmp1;
HXDLIN(  31)		bool _hx_tmp2;
HXDLIN(  31)		bool _hx_tmp3;
HXDLIN(  31)		if (hx::IsNotNull( displayObject->opaqueBackground )) {
HXLINE(  31)			_hx_tmp3 = !(displayObject->_hx___isCacheBitmapRender);
            		}
            		else {
HXLINE(  31)			_hx_tmp3 = false;
            		}
HXDLIN(  31)		if (_hx_tmp3) {
HXLINE(  31)			_hx_tmp2 = (displayObject->get_width() > (int)0);
            		}
            		else {
HXLINE(  31)			_hx_tmp2 = false;
            		}
HXDLIN(  31)		if (_hx_tmp2) {
HXLINE(  31)			_hx_tmp1 = (displayObject->get_height() > (int)0);
            		}
            		else {
HXLINE(  31)			_hx_tmp1 = false;
            		}
HXDLIN(  31)		if (_hx_tmp1) {
HXLINE(  33)			 ::lime::graphics::cairo::Cairo cairo = renderer->cairo;
HXLINE(  35)			renderer->_hx___setBlendMode(displayObject->_hx___worldBlendMode);
HXLINE(  36)			renderer->_hx___pushMaskObject(displayObject,null());
HXLINE(  38)			renderer->applyMatrix(displayObject->_hx___renderTransform,cairo);
HXLINE(  40)			int color = displayObject->opaqueBackground;
HXLINE(  41)			cairo->setSourceRGB(((Float)((int)hx::UShr(color,(int)16) & (int)(int)255) / (Float)(int)255),((Float)((int)hx::UShr(color,(int)8) & (int)(int)255) / (Float)(int)255),((Float)((int)color & (int)(int)255) / (Float)(int)255));
HXLINE(  42)			Float _hx_tmp4 = displayObject->get_width();
HXDLIN(  42)			cairo->rectangle((int)0,(int)0,_hx_tmp4,displayObject->get_height());
HXLINE(  43)			cairo->fill();
HXLINE(  45)			renderer->_hx___popMaskObject(displayObject,null());
            		}
HXLINE(  49)		if (hx::IsNotNull( displayObject->_hx___graphics )) {
HXLINE(  51)			::openfl::_internal::renderer::cairo::CairoShape_obj::render(displayObject,renderer);
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(CairoDisplayObject_obj,render,(void))


CairoDisplayObject_obj::CairoDisplayObject_obj()
{
}

bool CairoDisplayObject_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"render") ) { outValue = render_dyn(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *CairoDisplayObject_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *CairoDisplayObject_obj_sStaticStorageInfo = 0;
#endif

static void CairoDisplayObject_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(CairoDisplayObject_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void CairoDisplayObject_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(CairoDisplayObject_obj::__mClass,"__mClass");
};

#endif

hx::Class CairoDisplayObject_obj::__mClass;

static ::String CairoDisplayObject_obj_sStaticFields[] = {
	HX_HCSTRING("render","\x56","\x6b","\x29","\x05"),
	::String(null())
};

void CairoDisplayObject_obj::__register()
{
	hx::Object *dummy = new CairoDisplayObject_obj;
	CairoDisplayObject_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl._internal.renderer.cairo.CairoDisplayObject","\x9a","\x63","\xfd","\x16");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &CairoDisplayObject_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = CairoDisplayObject_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(CairoDisplayObject_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< CairoDisplayObject_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = CairoDisplayObject_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = CairoDisplayObject_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = CairoDisplayObject_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace _internal
} // end namespace renderer
} // end namespace cairo