// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_battle_enums_Team
#include <battle/enums/Team.h>
#endif
namespace battle{
namespace enums{

::battle::enums::Team Team_obj::Left;

::battle::enums::Team Team_obj::Right;

bool Team_obj::__GetStatic(const ::String &inName, ::Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	if (inName==HX_("Left",27,34,89,32)) { outValue = Team_obj::Left; return true; }
	if (inName==HX_("Right",bc,7b,91,7c)) { outValue = Team_obj::Right; return true; }
	return super::__GetStatic(inName, outValue, inCallProp);
}

HX_DEFINE_CREATE_ENUM(Team_obj)

int Team_obj::__FindIndex(::String inName)
{
	if (inName==HX_("Left",27,34,89,32)) return 0;
	if (inName==HX_("Right",bc,7b,91,7c)) return 1;
	return super::__FindIndex(inName);
}

int Team_obj::__FindArgCount(::String inName)
{
	if (inName==HX_("Left",27,34,89,32)) return 0;
	if (inName==HX_("Right",bc,7b,91,7c)) return 0;
	return super::__FindArgCount(inName);
}

hx::Val Team_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	if (inName==HX_("Left",27,34,89,32)) return Left;
	if (inName==HX_("Right",bc,7b,91,7c)) return Right;
	return super::__Field(inName,inCallProp);
}

static ::String Team_obj_sStaticFields[] = {
	HX_("Left",27,34,89,32),
	HX_("Right",bc,7b,91,7c),
	::String(null())
};

static void Team_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Team_obj::Left,"Left");
	HX_MARK_MEMBER_NAME(Team_obj::Right,"Right");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Team_obj_sVisitStatic(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Team_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Team_obj::Left,"Left");
	HX_VISIT_MEMBER_NAME(Team_obj::Right,"Right");
};
#endif

hx::Class Team_obj::__mClass;

Dynamic __Create_Team_obj() { return new Team_obj; }

void Team_obj::__register()
{

hx::Static(__mClass) = hx::_hx_RegisterClass(HX_HCSTRING("battle.enums.Team","\xcf","\xcf","\xf0","\xe1"), hx::TCanCast< Team_obj >,Team_obj_sStaticFields,0,
	&__Create_Team_obj, &__Create,
	&super::__SGetClass(), &CreateTeam_obj, Team_obj_sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , Team_obj_sVisitStatic
#endif
#ifdef HXCPP_SCRIPTABLE
    , 0
#endif
);
	__mClass->mGetStaticField = &Team_obj::__GetStatic;
}

void Team_obj::__boot()
{
Left = hx::CreateEnum< Team_obj >(HX_HCSTRING("Left","\x27","\x34","\x89","\x32"),0,0);
Right = hx::CreateEnum< Team_obj >(HX_HCSTRING("Right","\xbc","\x7b","\x91","\x7c"),1,0);
}


} // end namespace battle
} // end namespace enums