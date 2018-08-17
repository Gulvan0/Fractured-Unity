// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_roaming_screens_Canvas
#include <roaming/screens/Canvas.h>
#endif
#ifndef INCLUDED_roaming_screens_ICanvas
#include <roaming/screens/ICanvas.h>
#endif
#ifndef INCLUDED_roaming_screens_ISAbility
#include <roaming/screens/ISAbility.h>
#endif
#ifndef INCLUDED_roaming_screens_IScreen
#include <roaming/screens/IScreen.h>
#endif
#ifndef INCLUDED_roaming_screens_SAbility
#include <roaming/screens/SAbility.h>
#endif
#ifndef INCLUDED_roaming_screens_SRoaming
#include <roaming/screens/SRoaming.h>
#endif
#ifndef INCLUDED_roaming_screens_Screen
#include <roaming/screens/Screen.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_cb38744ab6a887cc_61_new,"roaming.screens.Canvas","new",0xbd5d3c26,"roaming.screens.Canvas.new","roaming/screens/Canvas.hx",61,0x2f5e70c8)
HX_LOCAL_STACK_FRAME(_hx_pos_cb38744ab6a887cc_34_switchTo,"roaming.screens.Canvas","switchTo",0xca731f09,"roaming.screens.Canvas.switchTo","roaming/screens/Canvas.hx",34,0x2f5e70c8)
HX_LOCAL_STACK_FRAME(_hx_pos_cb38744ab6a887cc_48_init,"roaming.screens.Canvas","init",0xf0f01c8a,"roaming.screens.Canvas.init","roaming/screens/Canvas.hx",48,0x2f5e70c8)
namespace roaming{
namespace screens{

void Canvas_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_cb38744ab6a887cc_61_new)
HXDLIN(  61)		super::__construct();
            	}

Dynamic Canvas_obj::__CreateEmpty() { return new Canvas_obj; }

void *Canvas_obj::_hx_vtable = 0;

Dynamic Canvas_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Canvas_obj > _hx_result = new Canvas_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Canvas_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1b123bf8) {
		if (inClassId<=(int)0x17120186) {
			if (inClassId<=(int)0x0ddfced7) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x0ddfced7;
			} else {
				return inClassId==(int)0x17120186;
			}
		} else {
			return inClassId==(int)0x19c29573 || inClassId==(int)0x1b123bf8;
		}
	} else {
		if (inClassId<=(int)0x6ca994c6) {
			return inClassId==(int)0x3f2b00af || inClassId==(int)0x6ca994c6;
		} else {
			return inClassId==(int)0x739fd0b8;
		}
	}
}

static ::roaming::screens::ICanvas_obj _hx_roaming_screens_Canvas__hx_roaming_screens_ICanvas= {
	( void (hx::Object::*)( ::roaming::screens::Screen))&::roaming::screens::Canvas_obj::switchTo,
};

void *Canvas_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x21152e73: return &_hx_roaming_screens_Canvas__hx_roaming_screens_ICanvas;
	}
	return super::_hx_getInterface(inHash);
}

void Canvas_obj::switchTo( ::roaming::screens::Screen screen){
            	HX_GC_STACKFRAME(&_hx_pos_cb38744ab6a887cc_34_switchTo)
HXLINE(  35)		this->removeChild(( ( ::openfl::display::DisplayObject)(this->screen) ));
HXLINE(  37)		::Dynamic _hx_tmp;
HXDLIN(  37)		switch((int)(_hx_getEnumValueIndex(screen))){
            			case (int)0: {
HXLINE(  37)				_hx_tmp =  ::roaming::screens::SRoaming_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
            			}
            			break;
            			case (int)1: {
HXLINE(  37)				_hx_tmp =  ::roaming::screens::SAbility_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
            			}
            			break;
            		}
HXDLIN(  37)		this->screen = _hx_tmp;
HXLINE(  43)		this->addChild(( ( ::openfl::display::DisplayObject)(this->screen) ));
HXLINE(  44)		::roaming::screens::IScreen_obj::init(this->screen);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Canvas_obj,switchTo,(void))

void Canvas_obj::init( ::roaming::screens::Screen startingScreen){
            	HX_GC_STACKFRAME(&_hx_pos_cb38744ab6a887cc_48_init)
HXLINE(  49)		::Dynamic _hx_tmp;
HXDLIN(  49)		switch((int)(_hx_getEnumValueIndex(startingScreen))){
            			case (int)0: {
HXLINE(  49)				_hx_tmp =  ::roaming::screens::SRoaming_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
            			}
            			break;
            			case (int)1: {
HXLINE(  49)				_hx_tmp =  ::roaming::screens::SAbility_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
            			}
            			break;
            		}
HXDLIN(  49)		this->screen = _hx_tmp;
HXLINE(  55)		this->addChild(( ( ::openfl::display::DisplayObject)(this->screen) ));
HXLINE(  56)		::roaming::screens::IScreen_obj::init(this->screen);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Canvas_obj,init,(void))


hx::ObjectPtr< Canvas_obj > Canvas_obj::__new() {
	hx::ObjectPtr< Canvas_obj > __this = new Canvas_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< Canvas_obj > Canvas_obj::__alloc(hx::Ctx *_hx_ctx) {
	Canvas_obj *__this = (Canvas_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Canvas_obj), true, "roaming.screens.Canvas"));
	*(void **)__this = Canvas_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Canvas_obj::Canvas_obj()
{
}

void Canvas_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Canvas);
	HX_MARK_MEMBER_NAME(screen,"screen");
	 ::openfl::display::Sprite_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Canvas_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(screen,"screen");
	 ::openfl::display::Sprite_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Canvas_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"init") ) { return hx::Val( init_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"screen") ) { return hx::Val( screen ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"switchTo") ) { return hx::Val( switchTo_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Canvas_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"screen") ) { screen=inValue.Cast< ::Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Canvas_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("screen","\x6c","\x3b","\x5d","\x47"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Canvas_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::roaming::screens::IScreen*/ ,(int)offsetof(Canvas_obj,screen),HX_HCSTRING("screen","\x6c","\x3b","\x5d","\x47")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Canvas_obj_sStaticStorageInfo = 0;
#endif

static ::String Canvas_obj_sMemberFields[] = {
	HX_HCSTRING("screen","\x6c","\x3b","\x5d","\x47"),
	HX_HCSTRING("switchTo","\x8f","\xf8","\xd6","\x0d"),
	HX_HCSTRING("init","\x10","\x3b","\xbb","\x45"),
	::String(null()) };

static void Canvas_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Canvas_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Canvas_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Canvas_obj::__mClass,"__mClass");
};

#endif

hx::Class Canvas_obj::__mClass;

void Canvas_obj::__register()
{
	hx::Object *dummy = new Canvas_obj;
	Canvas_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("roaming.screens.Canvas","\x34","\xf1","\xfe","\xc4");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Canvas_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Canvas_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Canvas_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Canvas_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Canvas_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Canvas_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace roaming
} // end namespace screens