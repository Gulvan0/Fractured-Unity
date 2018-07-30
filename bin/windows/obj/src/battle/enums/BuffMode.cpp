// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_battle_enums_BuffMode
#include <battle/enums/BuffMode.h>
#endif
namespace battle{
namespace enums{

::battle::enums::BuffMode BuffMode_obj::Cast;

::battle::enums::BuffMode BuffMode_obj::End;

::battle::enums::BuffMode BuffMode_obj::OverTime;

::battle::enums::BuffMode BuffMode_obj::Proc;

bool BuffMode_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	if (inName==HX_("Cast",df,4a,93,2c)) { outValue = BuffMode_obj::Cast; return true; }
	if (inName==HX_("End",bb,bb,34,00)) { outValue = BuffMode_obj::End; return true; }
	if (inName==HX_("OverTime",a1,7f,05,0f)) { outValue = BuffMode_obj::OverTime; return true; }
	if (inName==HX_("Proc",b6,f3,37,35)) { outValue = BuffMode_obj::Proc; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(BuffMode_obj)

int BuffMode_obj::__FindIndex(::String inName)
{
	if (inName==HX_("Cast",df,4a,93,2c)) return 0;
	if (inName==HX_("End",bb,bb,34,00)) return 2;
	if (inName==HX_("OverTime",a1,7f,05,0f)) return 1;
	if (inName==HX_("Proc",b6,f3,37,35)) return 3;
	return super::__FindIndex(inName);
}

int BuffMode_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("Cast",df,4a,93,2c)) return 0;
	if (inName==HX_("End",bb,bb,34,00)) return 0;
	if (inName==HX_("OverTime",a1,7f,05,0f)) return 0;
	if (inName==HX_("Proc",b6,f3,37,35)) return 0;
	return super::__FindArgCount(inName);
}

hx::Val BuffMode_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	if (inName==HX_("Cast",df,4a,93,2c)) return Cast;
	if (inName==HX_("End",bb,bb,34,00)) return End;
	if (inName==HX_("OverTime",a1,7f,05,0f)) return OverTime;
	if (inName==HX_("Proc",b6,f3,37,35)) return Proc;
	return super::__Field(inName,inCallProp);
}

static ::String BuffMode_obj_sStaticFields[] = {
	HX_("Cast",df,4a,93,2c),
	HX_("OverTime",a1,7f,05,0f),
	HX_("End",bb,bb,34,00),
	HX_("Proc",b6,f3,37,35),
	::String(null())
};

static void BuffMode_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(BuffMode_obj::Cast,"Cast");
	HX_MARK_MEMBER_NAME(BuffMode_obj::End,"End");
	HX_MARK_MEMBER_NAME(BuffMode_obj::OverTime,"OverTime");
	HX_MARK_MEMBER_NAME(BuffMode_obj::Proc,"Proc");
};

#ifdef HXCPP_VISIT_ALLOCS
static void BuffMode_obj_sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(BuffMode_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(BuffMode_obj::Cast,"Cast");
	HX_VISIT_MEMBER_NAME(BuffMode_obj::End,"End");
	HX_VISIT_MEMBER_NAME(BuffMode_obj::OverTime,"OverTime");
	HX_VISIT_MEMBER_NAME(BuffMode_obj::Proc,"Proc");
};
#endif

hx::Class BuffMode_obj::__mClass;

Dynamic __Create_BuffMode_obj() { return new BuffMode_obj; }

void BuffMode_obj::__register()
{

hx::Static(__mClass) = hx::_hx_RegisterClass(HX_HCSTRING("battle.enums.BuffMode","\x08","\x87","\xf6","\x7a"), hx::TCanCast< BuffMode_obj >,BuffMode_obj_sStaticFields,0,
	&__Create_BuffMode_obj, &__Create,
	&super::__SGetClass(), &CreateBuffMode_obj, BuffMode_obj_sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , BuffMode_obj_sVisitStatic
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &BuffMode_obj::__GetStatic;
}

void BuffMode_obj::__boot()
{
Cast = hx::CreateEnum< BuffMode_obj >(HX_HCSTRING("Cast","\xdf","\x4a","\x93","\x2c"),0,0);
End = hx::CreateEnum< BuffMode_obj >(HX_HCSTRING("End","\xbb","\xbb","\x34","\x00"),2,0);
OverTime = hx::CreateEnum< BuffMode_obj >(HX_HCSTRING("OverTime","\xa1","\x7f","\x05","\x0f"),1,0);
Proc = hx::CreateEnum< BuffMode_obj >(HX_HCSTRING("Proc","\xb6","\xf3","\x37","\x35"),3,0);
}


} // end namespace battle
} // end namespace enums
