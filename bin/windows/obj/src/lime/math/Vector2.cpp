// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_lime_math_Vector2
#include <lime/math/Vector2.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c8980fb157cd0afb_22_new,"lime.math.Vector2","new",0xaef3c434,"lime.math.Vector2.new","lime/math/Vector2.hx",22,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_32_add,"lime.math.Vector2","add",0xaee9e5f5,"lime.math.Vector2.add","lime/math/Vector2.hx",32,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_39_clone,"lime.math.Vector2","clone",0xd5c6a431,"lime.math.Vector2.clone","lime/math/Vector2.hx",39,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_55_equals,"lime.math.Vector2","equals",0xe9ae16eb,"lime.math.Vector2.equals","lime/math/Vector2.hx",55,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_69_normalize,"lime.math.Vector2","normalize",0xeaffc261,"lime.math.Vector2.normalize","lime/math/Vector2.hx",69,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_84_offset,"lime.math.Vector2","offset",0x89fac03f,"lime.math.Vector2.offset","lime/math/Vector2.hx",84,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_99_setTo,"lime.math.Vector2","setTo",0x07932291,"lime.math.Vector2.setTo","lime/math/Vector2.hx",99,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_108_subtract,"lime.math.Vector2","subtract",0x656920c0,"lime.math.Vector2.subtract","lime/math/Vector2.hx",108,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_118___toFlashPoint,"lime.math.Vector2","__toFlashPoint",0xf695b9a7,"lime.math.Vector2.__toFlashPoint","lime/math/Vector2.hx",118,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_133_get_length,"lime.math.Vector2","get_length",0xc2e9f35b,"lime.math.Vector2.get_length","lime/math/Vector2.hx",133,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_44_distance,"lime.math.Vector2","distance",0xd9513ee1,"lime.math.Vector2.distance","lime/math/Vector2.hx",44,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_62_interpolate,"lime.math.Vector2","interpolate",0xdb68bc95,"lime.math.Vector2.interpolate","lime/math/Vector2.hx",62,0x7105521c)
HX_LOCAL_STACK_FRAME(_hx_pos_c8980fb157cd0afb_94_polar,"lime.math.Vector2","polar",0x53f58092,"lime.math.Vector2.polar","lime/math/Vector2.hx",94,0x7105521c)
namespace lime{
namespace math{

void Vector2_obj::__construct(hx::Null< Float >  __o_x,hx::Null< Float >  __o_y){
Float x = __o_x.Default(0);
Float y = __o_y.Default(0);
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_22_new)
HXLINE(  24)		this->x = x;
HXLINE(  25)		this->y = y;
            	}

Dynamic Vector2_obj::__CreateEmpty() { return new Vector2_obj; }

void *Vector2_obj::_hx_vtable = 0;

Dynamic Vector2_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Vector2_obj > _hx_result = new Vector2_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool Vector2_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x682e4a32;
}

 ::lime::math::Vector2 Vector2_obj::add( ::lime::math::Vector2 v){
            	HX_GC_STACKFRAME(&_hx_pos_c8980fb157cd0afb_32_add)
HXDLIN(  32)		Float _hx_tmp = (v->x + this->x);
HXDLIN(  32)		return  ::lime::math::Vector2_obj::__alloc( HX_CTX ,_hx_tmp,(v->y + this->y));
            	}


HX_DEFINE_DYNAMIC_FUNC1(Vector2_obj,add,return )

 ::lime::math::Vector2 Vector2_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_c8980fb157cd0afb_39_clone)
HXDLIN(  39)		return  ::lime::math::Vector2_obj::__alloc( HX_CTX ,this->x,this->y);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Vector2_obj,clone,return )

bool Vector2_obj::equals( ::lime::math::Vector2 toCompare){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_55_equals)
HXDLIN(  55)		bool _hx_tmp;
HXDLIN(  55)		if (hx::IsNotNull( toCompare )) {
HXDLIN(  55)			_hx_tmp = (toCompare->x == this->x);
            		}
            		else {
HXDLIN(  55)			_hx_tmp = false;
            		}
HXDLIN(  55)		if (_hx_tmp) {
HXDLIN(  55)			return (toCompare->y == this->y);
            		}
            		else {
HXDLIN(  55)			return false;
            		}
HXDLIN(  55)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Vector2_obj,equals,return )

void Vector2_obj::normalize(Float thickness){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_69_normalize)
HXDLIN(  69)		bool _hx_tmp;
HXDLIN(  69)		if ((this->x == (int)0)) {
HXDLIN(  69)			_hx_tmp = (this->y == (int)0);
            		}
            		else {
HXDLIN(  69)			_hx_tmp = false;
            		}
HXDLIN(  69)		if (_hx_tmp) {
HXLINE(  71)			return;
            		}
            		else {
HXLINE(  75)			Float norm = (this->x * this->x);
HXDLIN(  75)			Float norm1 = ((Float)thickness / (Float)::Math_obj::sqrt((norm + (this->y * this->y))));
HXLINE(  76)			 ::lime::math::Vector2 _hx_tmp1 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  76)			_hx_tmp1->x = (_hx_tmp1->x * norm1);
HXLINE(  77)			 ::lime::math::Vector2 _hx_tmp2 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  77)			_hx_tmp2->y = (_hx_tmp2->y * norm1);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(Vector2_obj,normalize,(void))

void Vector2_obj::offset(Float dx,Float dy){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_84_offset)
HXLINE(  86)		 ::lime::math::Vector2 _hx_tmp = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  86)		_hx_tmp->x = (_hx_tmp->x + dx);
HXLINE(  87)		 ::lime::math::Vector2 _hx_tmp1 = hx::ObjectPtr<OBJ_>(this);
HXDLIN(  87)		_hx_tmp1->y = (_hx_tmp1->y + dy);
            	}


HX_DEFINE_DYNAMIC_FUNC2(Vector2_obj,offset,(void))

void Vector2_obj::setTo(Float xa,Float ya){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_99_setTo)
HXLINE( 101)		this->x = xa;
HXLINE( 102)		this->y = ya;
            	}


HX_DEFINE_DYNAMIC_FUNC2(Vector2_obj,setTo,(void))

 ::lime::math::Vector2 Vector2_obj::subtract( ::lime::math::Vector2 v){
            	HX_GC_STACKFRAME(&_hx_pos_c8980fb157cd0afb_108_subtract)
HXDLIN( 108)		Float _hx_tmp = (this->x - v->x);
HXDLIN( 108)		return  ::lime::math::Vector2_obj::__alloc( HX_CTX ,_hx_tmp,(this->y - v->y));
            	}


HX_DEFINE_DYNAMIC_FUNC1(Vector2_obj,subtract,return )

 ::Dynamic Vector2_obj::_hx___toFlashPoint(){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_118___toFlashPoint)
HXDLIN( 118)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Vector2_obj,_hx___toFlashPoint,return )

Float Vector2_obj::get_length(){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_133_get_length)
HXDLIN( 133)		Float _hx_tmp = (this->x * this->x);
HXDLIN( 133)		return ::Math_obj::sqrt((_hx_tmp + (this->y * this->y)));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Vector2_obj,get_length,return )

Float Vector2_obj::distance( ::lime::math::Vector2 pt1, ::lime::math::Vector2 pt2){
            	HX_STACKFRAME(&_hx_pos_c8980fb157cd0afb_44_distance)
HXLINE(  46)		Float dx = (pt1->x - pt2->x);
HXLINE(  47)		Float dy = (pt1->y - pt2->y);
HXLINE(  48)		return ::Math_obj::sqrt(((dx * dx) + (dy * dy)));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Vector2_obj,distance,return )

 ::lime::math::Vector2 Vector2_obj::interpolate( ::lime::math::Vector2 pt1, ::lime::math::Vector2 pt2,Float f){
            	HX_GC_STACKFRAME(&_hx_pos_c8980fb157cd0afb_62_interpolate)
HXDLIN(  62)		Float pt21 = pt2->x;
HXDLIN(  62)		Float _hx_tmp = (pt21 + (f * (pt1->x - pt2->x)));
HXDLIN(  62)		Float pt22 = pt2->y;
HXDLIN(  62)		return  ::lime::math::Vector2_obj::__alloc( HX_CTX ,_hx_tmp,(pt22 + (f * (pt1->y - pt2->y))));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Vector2_obj,interpolate,return )

 ::lime::math::Vector2 Vector2_obj::polar(Float len,Float angle){
            	HX_GC_STACKFRAME(&_hx_pos_c8980fb157cd0afb_94_polar)
HXDLIN(  94)		Float _hx_tmp = (len * ::Math_obj::cos(angle));
HXDLIN(  94)		return  ::lime::math::Vector2_obj::__alloc( HX_CTX ,_hx_tmp,(len * ::Math_obj::sin(angle)));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Vector2_obj,polar,return )


hx::ObjectPtr< Vector2_obj > Vector2_obj::__new(hx::Null< Float >  __o_x,hx::Null< Float >  __o_y) {
	hx::ObjectPtr< Vector2_obj > __this = new Vector2_obj();
	__this->__construct(__o_x,__o_y);
	return __this;
}

hx::ObjectPtr< Vector2_obj > Vector2_obj::__alloc(hx::Ctx *_hx_ctx,hx::Null< Float >  __o_x,hx::Null< Float >  __o_y) {
	Vector2_obj *__this = (Vector2_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Vector2_obj), false, "lime.math.Vector2"));
	*(void **)__this = Vector2_obj::_hx_vtable;
	__this->__construct(__o_x,__o_y);
	return __this;
}

Vector2_obj::Vector2_obj()
{
}

hx::Val Vector2_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { return hx::Val( x ); }
		if (HX_FIELD_EQ(inName,"y") ) { return hx::Val( y ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"add") ) { return hx::Val( add_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return hx::Val( clone_dyn() ); }
		if (HX_FIELD_EQ(inName,"setTo") ) { return hx::Val( setTo_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { return hx::Val( inCallProp == hx::paccAlways ? get_length() : length ); }
		if (HX_FIELD_EQ(inName,"equals") ) { return hx::Val( equals_dyn() ); }
		if (HX_FIELD_EQ(inName,"offset") ) { return hx::Val( offset_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"subtract") ) { return hx::Val( subtract_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"normalize") ) { return hx::Val( normalize_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"get_length") ) { return hx::Val( get_length_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"__toFlashPoint") ) { return hx::Val( _hx___toFlashPoint_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Vector2_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"polar") ) { outValue = polar_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"distance") ) { outValue = distance_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"interpolate") ) { outValue = interpolate_dyn(); return true; }
	}
	return false;
}

hx::Val Vector2_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { x=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"y") ) { y=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"length") ) { length=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Vector2_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("length","\xe6","\x94","\x07","\x9f"));
	outFields->push(HX_HCSTRING("x","\x78","\x00","\x00","\x00"));
	outFields->push(HX_HCSTRING("y","\x79","\x00","\x00","\x00"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Vector2_obj_sMemberStorageInfo[] = {
	{hx::fsFloat,(int)offsetof(Vector2_obj,length),HX_HCSTRING("length","\xe6","\x94","\x07","\x9f")},
	{hx::fsFloat,(int)offsetof(Vector2_obj,x),HX_HCSTRING("x","\x78","\x00","\x00","\x00")},
	{hx::fsFloat,(int)offsetof(Vector2_obj,y),HX_HCSTRING("y","\x79","\x00","\x00","\x00")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Vector2_obj_sStaticStorageInfo = 0;
#endif

static ::String Vector2_obj_sMemberFields[] = {
	HX_HCSTRING("length","\xe6","\x94","\x07","\x9f"),
	HX_HCSTRING("x","\x78","\x00","\x00","\x00"),
	HX_HCSTRING("y","\x79","\x00","\x00","\x00"),
	HX_HCSTRING("add","\x21","\xf2","\x49","\x00"),
	HX_HCSTRING("clone","\x5d","\x13","\x63","\x48"),
	HX_HCSTRING("equals","\x3f","\xee","\xf2","\xbf"),
	HX_HCSTRING("normalize","\x8d","\x37","\xa1","\xab"),
	HX_HCSTRING("offset","\x93","\x97","\x3f","\x60"),
	HX_HCSTRING("setTo","\xbd","\x91","\x2f","\x7a"),
	HX_HCSTRING("subtract","\x14","\x75","\x11","\xf8"),
	HX_HCSTRING("__toFlashPoint","\xfb","\x04","\x40","\xa7"),
	HX_HCSTRING("get_length","\xaf","\x04","\x8f","\x8f"),
	::String(null()) };

static void Vector2_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Vector2_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Vector2_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Vector2_obj::__mClass,"__mClass");
};

#endif

hx::Class Vector2_obj::__mClass;

static ::String Vector2_obj_sStaticFields[] = {
	HX_HCSTRING("distance","\x35","\x93","\xf9","\x6b"),
	HX_HCSTRING("interpolate","\xc1","\xd4","\x32","\x1f"),
	HX_HCSTRING("polar","\xbe","\xef","\x91","\xc6"),
	::String(null())
};

void Vector2_obj::__register()
{
	hx::Object *dummy = new Vector2_obj;
	Vector2_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lime.math.Vector2","\x42","\xda","\x50","\x4d");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Vector2_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Vector2_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Vector2_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Vector2_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Vector2_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Vector2_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Vector2_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Vector2_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace math
