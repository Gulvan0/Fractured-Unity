// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_NextBattle
#include <NextBattle.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_IntMap
#include <haxe/ds/IntMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_openfl__internal_swf_SWFLite
#include <openfl/_internal/swf/SWFLite.h>
#endif
#ifndef INCLUDED_openfl__internal_symbols_SWFSymbol
#include <openfl/_internal/symbols/SWFSymbol.h>
#endif
#ifndef INCLUDED_openfl__internal_symbols_SpriteSymbol
#include <openfl/_internal/symbols/SpriteSymbol.h>
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
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
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

HX_DEFINE_STACK_FRAME(_hx_pos_1ad033df6232eb5c_14_new,"NextBattle","new",0xc4454d1d,"NextBattle.new","NextBattle.hx",14,0x74d384f3)

void NextBattle_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_1ad033df6232eb5c_14_new)
HXLINE(  16)		super::__construct();
HXLINE(  26)		 ::openfl::_internal::swf::SWFLite swfLite = ::openfl::_internal::swf::SWFLite_obj::instances->get(HX_("lib/AssetSource/AssetSource.bin",16,62,82,ae)).StaticCast<  ::openfl::_internal::swf::SWFLite >();
HXLINE(  27)		 ::openfl::_internal::symbols::SWFSymbol symbol = swfLite->symbols->get((int)85).StaticCast<  ::openfl::_internal::symbols::SWFSymbol >();
HXLINE(  29)		this->_hx___fromSymbol(swfLite,( ( ::openfl::_internal::symbols::SpriteSymbol)(symbol) ));
            	}

Dynamic NextBattle_obj::__CreateEmpty() { return new NextBattle_obj; }

void *NextBattle_obj::_hx_vtable = 0;

Dynamic NextBattle_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< NextBattle_obj > _hx_result = new NextBattle_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool NextBattle_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x19c29573) {
		if (inClassId<=(int)0x0ddfced7) {
			if (inClassId<=(int)0x01bf7aab) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x01bf7aab;
			} else {
				return inClassId==(int)0x0ddfced7;
			}
		} else {
			return inClassId==(int)0x17120186 || inClassId==(int)0x19c29573;
		}
	} else {
		if (inClassId<=(int)0x21e31f0e) {
			return inClassId==(int)0x1b123bf8 || inClassId==(int)0x21e31f0e;
		} else {
			return inClassId==(int)0x3f2b00af;
		}
	}
}


hx::ObjectPtr< NextBattle_obj > NextBattle_obj::__new() {
	hx::ObjectPtr< NextBattle_obj > __this = new NextBattle_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< NextBattle_obj > NextBattle_obj::__alloc(hx::Ctx *_hx_ctx) {
	NextBattle_obj *__this = (NextBattle_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(NextBattle_obj), true, "NextBattle"));
	*(void **)__this = NextBattle_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

NextBattle_obj::NextBattle_obj()
{
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *NextBattle_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *NextBattle_obj_sStaticStorageInfo = 0;
#endif

static void NextBattle_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(NextBattle_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void NextBattle_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(NextBattle_obj::__mClass,"__mClass");
};

#endif

hx::Class NextBattle_obj::__mClass;

void NextBattle_obj::__register()
{
	hx::Object *dummy = new NextBattle_obj;
	NextBattle_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("NextBattle","\xab","\x7a","\xbf","\x01");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = NextBattle_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< NextBattle_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = NextBattle_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = NextBattle_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = NextBattle_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

