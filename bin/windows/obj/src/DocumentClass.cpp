// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_DocumentClass
#include <DocumentClass.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_SSprite
#include <SSprite.h>
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
#ifndef INCLUDED_openfl_events_Event
#include <openfl/events/Event.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_9453f8fd92a21d0a_292_new,"DocumentClass","new",0x4aeb0a6f,"DocumentClass.new","ApplicationMain.hx",292,0x0780ded5)

void DocumentClass_obj::__construct( ::openfl::display::DisplayObjectContainer current){
            	HX_GC_STACKFRAME(&_hx_pos_9453f8fd92a21d0a_292_new)
HXLINE( 294)		current->addChild(hx::ObjectPtr<OBJ_>(this));
HXLINE( 295)		super::__construct();
HXLINE( 296)		this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("addedToStage",63,22,55,0c),false,false));
            	}

Dynamic DocumentClass_obj::__CreateEmpty() { return new DocumentClass_obj; }

void *DocumentClass_obj::_hx_vtable = 0;

Dynamic DocumentClass_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< DocumentClass_obj > _hx_result = new DocumentClass_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool DocumentClass_obj::_hx_isInstanceOf(int inClassId) {
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
		if (inClassId<=(int)0x3f2b00af) {
			if (inClassId<=(int)0x3e03a6fd) {
				return inClassId==(int)0x332f6459 || inClassId==(int)0x3e03a6fd;
			} else {
				return inClassId==(int)0x3f2b00af;
			}
		} else {
			return inClassId==(int)0x739fd0b8;
		}
	}
}


hx::ObjectPtr< DocumentClass_obj > DocumentClass_obj::__new( ::openfl::display::DisplayObjectContainer current) {
	hx::ObjectPtr< DocumentClass_obj > __this = new DocumentClass_obj();
	__this->__construct(current);
	return __this;
}

hx::ObjectPtr< DocumentClass_obj > DocumentClass_obj::__alloc(hx::Ctx *_hx_ctx, ::openfl::display::DisplayObjectContainer current) {
	DocumentClass_obj *__this = (DocumentClass_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(DocumentClass_obj), true, "DocumentClass"));
	*(void **)__this = DocumentClass_obj::_hx_vtable;
	__this->__construct(current);
	return __this;
}

DocumentClass_obj::DocumentClass_obj()
{
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *DocumentClass_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *DocumentClass_obj_sStaticStorageInfo = 0;
#endif

static void DocumentClass_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DocumentClass_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void DocumentClass_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DocumentClass_obj::__mClass,"__mClass");
};

#endif

hx::Class DocumentClass_obj::__mClass;

void DocumentClass_obj::__register()
{
	hx::Object *dummy = new DocumentClass_obj;
	DocumentClass_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("DocumentClass","\xfd","\xa6","\x03","\x3e");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = DocumentClass_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< DocumentClass_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = DocumentClass_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = DocumentClass_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = DocumentClass_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

