// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_roaming_RoamUnitParameters
#include <roaming/RoamUnitParameters.h>
#endif
#ifndef INCLUDED_roaming_Tree
#include <roaming/Tree.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_962c6bdd6220401d_24_new,"roaming.RoamUnitParameters","new",0xcf6265de,"roaming.RoamUnitParameters.new","roaming/Unit.hx",24,0x940841e4)
namespace roaming{

void RoamUnitParameters_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_962c6bdd6220401d_24_new)
            	}

Dynamic RoamUnitParameters_obj::__CreateEmpty() { return new RoamUnitParameters_obj; }

void *RoamUnitParameters_obj::_hx_vtable = 0;

Dynamic RoamUnitParameters_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< RoamUnitParameters_obj > _hx_result = new RoamUnitParameters_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool RoamUnitParameters_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x35398c2c;
}


RoamUnitParameters_obj::RoamUnitParameters_obj()
{
}

void RoamUnitParameters_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(RoamUnitParameters);
	HX_MARK_MEMBER_NAME(tree,"tree");
	HX_MARK_MEMBER_NAME(wheel,"wheel");
	HX_MARK_MEMBER_NAME(level,"level");
	HX_MARK_MEMBER_NAME(xp,"xp");
	HX_MARK_MEMBER_NAME(abilityPoints,"abilityPoints");
	HX_MARK_MEMBER_NAME(attributePoints,"attributePoints");
	HX_MARK_MEMBER_NAME(strength,"strength");
	HX_MARK_MEMBER_NAME(flow,"flow");
	HX_MARK_MEMBER_NAME(intellect,"intellect");
	HX_MARK_END_CLASS();
}

void RoamUnitParameters_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(tree,"tree");
	HX_VISIT_MEMBER_NAME(wheel,"wheel");
	HX_VISIT_MEMBER_NAME(level,"level");
	HX_VISIT_MEMBER_NAME(xp,"xp");
	HX_VISIT_MEMBER_NAME(abilityPoints,"abilityPoints");
	HX_VISIT_MEMBER_NAME(attributePoints,"attributePoints");
	HX_VISIT_MEMBER_NAME(strength,"strength");
	HX_VISIT_MEMBER_NAME(flow,"flow");
	HX_VISIT_MEMBER_NAME(intellect,"intellect");
}

hx::Val RoamUnitParameters_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"xp") ) { return hx::Val( xp ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"tree") ) { return hx::Val( tree ); }
		if (HX_FIELD_EQ(inName,"flow") ) { return hx::Val( flow ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { return hx::Val( wheel ); }
		if (HX_FIELD_EQ(inName,"level") ) { return hx::Val( level ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"strength") ) { return hx::Val( strength ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"intellect") ) { return hx::Val( intellect ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"abilityPoints") ) { return hx::Val( abilityPoints ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"attributePoints") ) { return hx::Val( attributePoints ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val RoamUnitParameters_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"xp") ) { xp=inValue.Cast< int >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"tree") ) { tree=inValue.Cast<  ::roaming::Tree >(); return inValue; }
		if (HX_FIELD_EQ(inName,"flow") ) { flow=inValue.Cast< int >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { wheel=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		if (HX_FIELD_EQ(inName,"level") ) { level=inValue.Cast< int >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"strength") ) { strength=inValue.Cast< int >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"intellect") ) { intellect=inValue.Cast< int >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"abilityPoints") ) { abilityPoints=inValue.Cast< int >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"attributePoints") ) { attributePoints=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void RoamUnitParameters_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("tree","\x5e","\x99","\x03","\x4d"));
	outFields->push(HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"));
	outFields->push(HX_HCSTRING("level","\x84","\x15","\x63","\x72"));
	outFields->push(HX_HCSTRING("xp","\xf8","\x68","\x00","\x00"));
	outFields->push(HX_HCSTRING("abilityPoints","\x6d","\x83","\x23","\xd7"));
	outFields->push(HX_HCSTRING("attributePoints","\x5f","\xf3","\xff","\xea"));
	outFields->push(HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e"));
	outFields->push(HX_HCSTRING("flow","\xee","\x17","\xbe","\x43"));
	outFields->push(HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo RoamUnitParameters_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::roaming::Tree*/ ,(int)offsetof(RoamUnitParameters_obj,tree),HX_HCSTRING("tree","\x5e","\x99","\x03","\x4d")},
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(RoamUnitParameters_obj,wheel),HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,level),HX_HCSTRING("level","\x84","\x15","\x63","\x72")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,xp),HX_HCSTRING("xp","\xf8","\x68","\x00","\x00")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,abilityPoints),HX_HCSTRING("abilityPoints","\x6d","\x83","\x23","\xd7")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,attributePoints),HX_HCSTRING("attributePoints","\x5f","\xf3","\xff","\xea")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,strength),HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,flow),HX_HCSTRING("flow","\xee","\x17","\xbe","\x43")},
	{hx::fsInt,(int)offsetof(RoamUnitParameters_obj,intellect),HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *RoamUnitParameters_obj_sStaticStorageInfo = 0;
#endif

static ::String RoamUnitParameters_obj_sMemberFields[] = {
	HX_HCSTRING("tree","\x5e","\x99","\x03","\x4d"),
	HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"),
	HX_HCSTRING("level","\x84","\x15","\x63","\x72"),
	HX_HCSTRING("xp","\xf8","\x68","\x00","\x00"),
	HX_HCSTRING("abilityPoints","\x6d","\x83","\x23","\xd7"),
	HX_HCSTRING("attributePoints","\x5f","\xf3","\xff","\xea"),
	HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e"),
	HX_HCSTRING("flow","\xee","\x17","\xbe","\x43"),
	HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9"),
	::String(null()) };

static void RoamUnitParameters_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(RoamUnitParameters_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void RoamUnitParameters_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(RoamUnitParameters_obj::__mClass,"__mClass");
};

#endif

hx::Class RoamUnitParameters_obj::__mClass;

void RoamUnitParameters_obj::__register()
{
	hx::Object *dummy = new RoamUnitParameters_obj;
	RoamUnitParameters_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("roaming.RoamUnitParameters","\xec","\xde","\x4e","\x9a");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = RoamUnitParameters_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(RoamUnitParameters_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< RoamUnitParameters_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = RoamUnitParameters_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = RoamUnitParameters_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = RoamUnitParameters_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace roaming