// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_battle_ISimpleModel
#include <battle/ISimpleModel.h>
#endif
#ifndef INCLUDED_battle_struct_UPair
#include <battle/struct/UPair.h>
#endif

namespace battle{


static ::String ISimpleModel_obj_sMemberFields[] = {
	HX_HCSTRING("getUnits","\xf9","\x78","\xbe","\x06"),
	HX_HCSTRING("respond","\x55","\x89","\x0b","\x68"),
	::String(null()) };

static void ISimpleModel_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(ISimpleModel_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void ISimpleModel_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(ISimpleModel_obj::__mClass,"__mClass");
};

#endif

hx::Class ISimpleModel_obj::__mClass;

void ISimpleModel_obj::__register()
{
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("battle.ISimpleModel","\x44","\xd9","\x05","\x7a");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mMarkFunc = ISimpleModel_obj_sMarkStatics;
	__mClass->mMembers = hx::Class_obj::dupFunctions(ISimpleModel_obj_sMemberFields);
	__mClass->mCanCast = hx::TIsInterface< (int)0x4a70be46 >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = ISimpleModel_obj_sVisitStatics;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace battle
