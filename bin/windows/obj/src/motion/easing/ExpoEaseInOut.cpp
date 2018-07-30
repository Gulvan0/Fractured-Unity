// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_motion_easing_ExpoEaseInOut
#include <motion/easing/ExpoEaseInOut.h>
#endif
#ifndef INCLUDED_motion_easing_IEasing
#include <motion/easing/IEasing.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_4c28aa11b3e7c021_73_new,"motion.easing.ExpoEaseInOut","new",0x06cb1550,"motion.easing.ExpoEaseInOut.new","motion/easing/Expo.hx",73,0xaf90d701)
HX_LOCAL_STACK_FRAME(_hx_pos_4c28aa11b3e7c021_80_calculate,"motion.easing.ExpoEaseInOut","calculate",0x6ecc2e56,"motion.easing.ExpoEaseInOut.calculate","motion/easing/Expo.hx",80,0xaf90d701)
HX_LOCAL_STACK_FRAME(_hx_pos_4c28aa11b3e7c021_92_ease,"motion.easing.ExpoEaseInOut","ease",0xe4f198fe,"motion.easing.ExpoEaseInOut.ease","motion/easing/Expo.hx",92,0xaf90d701)
namespace motion{
namespace easing{

void ExpoEaseInOut_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_4c28aa11b3e7c021_73_new)
            	}

Dynamic ExpoEaseInOut_obj::__CreateEmpty() { return new ExpoEaseInOut_obj; }

void *ExpoEaseInOut_obj::_hx_vtable = 0;

Dynamic ExpoEaseInOut_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< ExpoEaseInOut_obj > _hx_result = new ExpoEaseInOut_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool ExpoEaseInOut_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x7a7a31e8;
}

static ::motion::easing::IEasing_obj _hx_motion_easing_ExpoEaseInOut__hx_motion_easing_IEasing= {
	( Float (hx::Object::*)(Float))&::motion::easing::ExpoEaseInOut_obj::calculate,
	( Float (hx::Object::*)(Float,Float,Float,Float))&::motion::easing::ExpoEaseInOut_obj::ease,
};

void *ExpoEaseInOut_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x864e8b53: return &_hx_motion_easing_ExpoEaseInOut__hx_motion_easing_IEasing;
	}
	#ifdef HXCPP_SCRIPTABLE
	return super::_hx_getInterface(inHash);
	#else
	return 0;
	#endif
}

Float ExpoEaseInOut_obj::calculate(Float k){
            	HX_STACKFRAME(&_hx_pos_4c28aa11b3e7c021_80_calculate)
HXLINE(  82)		if ((k == (int)0)) {
HXLINE(  82)			return (int)0;
            		}
HXLINE(  83)		if ((k == (int)1)) {
HXLINE(  83)			return (int)1;
            		}
HXLINE(  84)		k = ((Float)k / (Float)((Float)0.5));
HXDLIN(  84)		if ((k < ((Float)1.0))) {
HXLINE(  85)			return (((Float)0.5) * ::Math_obj::pow((int)2,((int)10 * (k - (int)1))));
            		}
HXLINE(  87)		k = (k - (int)1);
HXDLIN(  87)		return (((Float)0.5) * ((int)2 - ::Math_obj::pow((int)2,((int)-10 * k))));
            	}


HX_DEFINE_DYNAMIC_FUNC1(ExpoEaseInOut_obj,calculate,return )

Float ExpoEaseInOut_obj::ease(Float t,Float b,Float c,Float d){
            	HX_STACKFRAME(&_hx_pos_4c28aa11b3e7c021_92_ease)
HXLINE(  94)		if ((t == (int)0)) {
HXLINE(  95)			return b;
            		}
HXLINE(  97)		if ((t == d)) {
HXLINE(  98)			return (b + c);
            		}
HXLINE( 100)		t = ((Float)t / (Float)((Float)d / (Float)((Float)2.0)));
HXDLIN( 100)		if ((t < ((Float)1.0))) {
HXLINE( 101)			return ((((Float)c / (Float)(int)2) * ::Math_obj::pow((int)2,((int)10 * (t - (int)1)))) + b);
            		}
HXLINE( 103)		t = (t - (int)1);
HXDLIN( 103)		return ((((Float)c / (Float)(int)2) * ((int)2 - ::Math_obj::pow((int)2,((int)-10 * t)))) + b);
            	}


HX_DEFINE_DYNAMIC_FUNC4(ExpoEaseInOut_obj,ease,return )


hx::ObjectPtr< ExpoEaseInOut_obj > ExpoEaseInOut_obj::__new() {
	hx::ObjectPtr< ExpoEaseInOut_obj > __this = new ExpoEaseInOut_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< ExpoEaseInOut_obj > ExpoEaseInOut_obj::__alloc(hx::Ctx *_hx_ctx) {
	ExpoEaseInOut_obj *__this = (ExpoEaseInOut_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(ExpoEaseInOut_obj), false, "motion.easing.ExpoEaseInOut"));
	*(void **)__this = ExpoEaseInOut_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

ExpoEaseInOut_obj::ExpoEaseInOut_obj()
{
}

hx::Val ExpoEaseInOut_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"ease") ) { return hx::Val( ease_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"calculate") ) { return hx::Val( calculate_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *ExpoEaseInOut_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *ExpoEaseInOut_obj_sStaticStorageInfo = 0;
#endif

static ::String ExpoEaseInOut_obj_sMemberFields[] = {
	HX_HCSTRING("calculate","\x66","\x95","\x6a","\x05"),
	HX_HCSTRING("ease","\xee","\x8b","\x0c","\x43"),
	::String(null()) };

static void ExpoEaseInOut_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(ExpoEaseInOut_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void ExpoEaseInOut_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(ExpoEaseInOut_obj::__mClass,"__mClass");
};

#endif

hx::Class ExpoEaseInOut_obj::__mClass;

void ExpoEaseInOut_obj::__register()
{
	hx::Object *dummy = new ExpoEaseInOut_obj;
	ExpoEaseInOut_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("motion.easing.ExpoEaseInOut","\x5e","\x6d","\x2a","\xbe");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = ExpoEaseInOut_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(ExpoEaseInOut_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< ExpoEaseInOut_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = ExpoEaseInOut_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = ExpoEaseInOut_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = ExpoEaseInOut_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace motion
} // end namespace easing
