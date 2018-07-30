// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeCFFI
#include <lime/_backend/native/NativeCFFI.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeMouse
#include <lime/_backend/native/NativeMouse.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeWindow
#include <lime/_backend/native/NativeWindow.h>
#endif
#ifndef INCLUDED_lime_ui_MouseCursor
#include <lime/ui/MouseCursor.h>
#endif
#ifndef INCLUDED_lime_ui_Window
#include <lime/ui/Window.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_27_hide,"lime._backend.native.NativeMouse","hide",0xec289e99,"lime._backend.native.NativeMouse.hide","lime/_backend/native/NativeMouse.hx",27,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_42_show,"lime._backend.native.NativeMouse","show",0xf36d3ed4,"lime._backend.native.NativeMouse.show","lime/_backend/native/NativeMouse.hx",42,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_58_warp,"lime._backend.native.NativeMouse","warp",0xf60ccc1f,"lime._backend.native.NativeMouse.warp","lime/_backend/native/NativeMouse.hx",58,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_71_get_cursor,"lime._backend.native.NativeMouse","get_cursor",0x6045e3b6,"lime._backend.native.NativeMouse.get_cursor","lime/_backend/native/NativeMouse.hx",71,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_79_set_cursor,"lime._backend.native.NativeMouse","set_cursor",0x63c3822a,"lime._backend.native.NativeMouse.set_cursor","lime/_backend/native/NativeMouse.hx",79,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_119_get_lock,"lime._backend.native.NativeMouse","get_lock",0xe19bf8cb,"lime._backend.native.NativeMouse.get_lock","lime/_backend/native/NativeMouse.hx",119,0x1d44ad08)
HX_LOCAL_STACK_FRAME(_hx_pos_078f9978cd0e3dea_124_set_lock,"lime._backend.native.NativeMouse","set_lock",0x8ff9523f,"lime._backend.native.NativeMouse.set_lock","lime/_backend/native/NativeMouse.hx",124,0x1d44ad08)
namespace lime{
namespace _backend{
namespace native{

void NativeMouse_obj::__construct() { }

Dynamic NativeMouse_obj::__CreateEmpty() { return new NativeMouse_obj; }

void *NativeMouse_obj::_hx_vtable = 0;

Dynamic NativeMouse_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< NativeMouse_obj > _hx_result = new NativeMouse_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool NativeMouse_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x24a3dda9;
}

 ::lime::ui::MouseCursor NativeMouse_obj::_hx___cursor;

bool NativeMouse_obj::_hx___hidden;

bool NativeMouse_obj::_hx___lock;

void NativeMouse_obj::hide(){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_27_hide)
HXDLIN(  27)		if (!(::lime::_backend::native::NativeMouse_obj::_hx___hidden)) {
HXLINE(  29)			::lime::_backend::native::NativeMouse_obj::_hx___hidden = true;
HXLINE(  32)			::lime::_backend::native::NativeCFFI_obj::cffi_lime_mouse_hide();
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(NativeMouse_obj,hide,(void))

void NativeMouse_obj::show(){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_42_show)
HXDLIN(  42)		if (::lime::_backend::native::NativeMouse_obj::_hx___hidden) {
HXLINE(  44)			::lime::_backend::native::NativeMouse_obj::_hx___hidden = false;
HXLINE(  47)			::lime::_backend::native::NativeCFFI_obj::cffi_lime_mouse_show();
            		}
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(NativeMouse_obj,show,(void))

void NativeMouse_obj::warp(int x,int y, ::lime::ui::Window window){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_58_warp)
HXDLIN(  58)		 ::Dynamic window1;
HXDLIN(  58)		if (hx::IsNull( window )) {
HXDLIN(  58)			window1 = (int)0;
            		}
            		else {
HXDLIN(  58)			window1 = window->backend->handle;
            		}
HXDLIN(  58)		::lime::_backend::native::NativeCFFI_obj::cffi_lime_mouse_warp(x,y,hx::DynamicPtr(window1));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(NativeMouse_obj,warp,(void))

 ::lime::ui::MouseCursor NativeMouse_obj::get_cursor(){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_71_get_cursor)
HXLINE(  73)		if (hx::IsNull( ::lime::_backend::native::NativeMouse_obj::_hx___cursor )) {
HXLINE(  73)			return ::lime::ui::MouseCursor_obj::DEFAULT_dyn();
            		}
HXLINE(  74)		return ::lime::_backend::native::NativeMouse_obj::_hx___cursor;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(NativeMouse_obj,get_cursor,return )

 ::lime::ui::MouseCursor NativeMouse_obj::set_cursor( ::lime::ui::MouseCursor value){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_79_set_cursor)
HXLINE(  81)		if (hx::IsNotEq( ::lime::_backend::native::NativeMouse_obj::_hx___cursor,value )) {
HXLINE(  83)			if (!(::lime::_backend::native::NativeMouse_obj::_hx___hidden)) {
HXLINE(  85)				int type;
HXDLIN(  85)				switch((int)(_hx_getEnumValueIndex(value))){
            					case (int)0: {
HXLINE(  85)						type = (int)0;
            					}
            					break;
            					case (int)1: {
HXLINE(  85)						type = (int)1;
            					}
            					break;
            					case (int)3: {
HXLINE(  85)						type = (int)3;
            					}
            					break;
            					case (int)4: {
HXLINE(  85)						type = (int)4;
            					}
            					break;
            					case (int)5: {
HXLINE(  85)						type = (int)5;
            					}
            					break;
            					case (int)6: {
HXLINE(  85)						type = (int)6;
            					}
            					break;
            					case (int)7: {
HXLINE(  85)						type = (int)7;
            					}
            					break;
            					case (int)8: {
HXLINE(  85)						type = (int)8;
            					}
            					break;
            					case (int)9: {
HXLINE(  85)						type = (int)9;
            					}
            					break;
            					case (int)10: {
HXLINE(  85)						type = (int)10;
            					}
            					break;
            					case (int)11: {
HXLINE(  85)						type = (int)11;
            					}
            					break;
            					default:{
HXLINE(  85)						type = (int)2;
            					}
            				}
HXLINE( 103)				::lime::_backend::native::NativeCFFI_obj::cffi_lime_mouse_set_cursor(type);
            			}
HXLINE( 108)			::lime::_backend::native::NativeMouse_obj::_hx___cursor = value;
            		}
HXLINE( 112)		return ::lime::_backend::native::NativeMouse_obj::_hx___cursor;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(NativeMouse_obj,set_cursor,return )

bool NativeMouse_obj::get_lock(){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_119_get_lock)
HXDLIN( 119)		return ::lime::_backend::native::NativeMouse_obj::_hx___lock;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(NativeMouse_obj,get_lock,return )

bool NativeMouse_obj::set_lock(bool value){
            	HX_STACKFRAME(&_hx_pos_078f9978cd0e3dea_124_set_lock)
HXLINE( 126)		if ((::lime::_backend::native::NativeMouse_obj::_hx___lock != value)) {
HXLINE( 129)			::lime::_backend::native::NativeCFFI_obj::cffi_lime_mouse_set_lock(value);
HXLINE( 132)			::lime::_backend::native::NativeMouse_obj::_hx___hidden = value;
HXLINE( 133)			::lime::_backend::native::NativeMouse_obj::_hx___lock = value;
            		}
HXLINE( 137)		return ::lime::_backend::native::NativeMouse_obj::_hx___lock;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(NativeMouse_obj,set_lock,return )


NativeMouse_obj::NativeMouse_obj()
{
}

bool NativeMouse_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"hide") ) { outValue = hide_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"show") ) { outValue = show_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"warp") ) { outValue = warp_dyn(); return true; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"__lock") ) { outValue = ( _hx___lock ); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__cursor") ) { outValue = ( _hx___cursor ); return true; }
		if (HX_FIELD_EQ(inName,"__hidden") ) { outValue = ( _hx___hidden ); return true; }
		if (HX_FIELD_EQ(inName,"get_lock") ) { outValue = get_lock_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"set_lock") ) { outValue = set_lock_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_cursor") ) { outValue = get_cursor_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"set_cursor") ) { outValue = set_cursor_dyn(); return true; }
	}
	return false;
}

bool NativeMouse_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"__lock") ) { _hx___lock=ioValue.Cast< bool >(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__cursor") ) { _hx___cursor=ioValue.Cast<  ::lime::ui::MouseCursor >(); return true; }
		if (HX_FIELD_EQ(inName,"__hidden") ) { _hx___hidden=ioValue.Cast< bool >(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *NativeMouse_obj_sMemberStorageInfo = 0;
static hx::StaticInfo NativeMouse_obj_sStaticStorageInfo[] = {
	{hx::fsObject /*::lime::ui::MouseCursor*/ ,(void *) &NativeMouse_obj::_hx___cursor,HX_HCSTRING("__cursor","\xf6","\xf9","\x17","\xe7")},
	{hx::fsBool,(void *) &NativeMouse_obj::_hx___hidden,HX_HCSTRING("__hidden","\x8a","\x6a","\xc5","\xf4")},
	{hx::fsBool,(void *) &NativeMouse_obj::_hx___lock,HX_HCSTRING("__lock","\x0b","\xff","\xaf","\xf6")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static void NativeMouse_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(NativeMouse_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(NativeMouse_obj::_hx___cursor,"__cursor");
	HX_MARK_MEMBER_NAME(NativeMouse_obj::_hx___hidden,"__hidden");
	HX_MARK_MEMBER_NAME(NativeMouse_obj::_hx___lock,"__lock");
};

#ifdef HXCPP_VISIT_ALLOCS
static void NativeMouse_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(NativeMouse_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(NativeMouse_obj::_hx___cursor,"__cursor");
	HX_VISIT_MEMBER_NAME(NativeMouse_obj::_hx___hidden,"__hidden");
	HX_VISIT_MEMBER_NAME(NativeMouse_obj::_hx___lock,"__lock");
};

#endif

hx::Class NativeMouse_obj::__mClass;

static ::String NativeMouse_obj_sStaticFields[] = {
	HX_HCSTRING("__cursor","\xf6","\xf9","\x17","\xe7"),
	HX_HCSTRING("__hidden","\x8a","\x6a","\xc5","\xf4"),
	HX_HCSTRING("__lock","\x0b","\xff","\xaf","\xf6"),
	HX_HCSTRING("hide","\xc2","\x34","\x0e","\x45"),
	HX_HCSTRING("show","\xfd","\xd4","\x52","\x4c"),
	HX_HCSTRING("warp","\x48","\x62","\xf2","\x4e"),
	HX_HCSTRING("get_cursor","\x9f","\xfe","\x6f","\x2f"),
	HX_HCSTRING("set_cursor","\x13","\x9d","\xed","\x32"),
	HX_HCSTRING("get_lock","\x74","\x57","\x72","\xc7"),
	HX_HCSTRING("set_lock","\xe8","\xb0","\xcf","\x75"),
	::String(null())
};

void NativeMouse_obj::__register()
{
	hx::Object *dummy = new NativeMouse_obj;
	NativeMouse_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lime._backend.native.NativeMouse","\xf7","\x45","\x60","\xfb");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &NativeMouse_obj::__GetStatic;
	__mClass->mSetStaticField = &NativeMouse_obj::__SetStatic;
	__mClass->mMarkFunc = NativeMouse_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(NativeMouse_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< NativeMouse_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = NativeMouse_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = NativeMouse_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = NativeMouse_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace _backend
} // end namespace native
