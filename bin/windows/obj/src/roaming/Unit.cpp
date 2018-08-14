// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Element
#include <Element.h>
#endif
#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_XMLUtils
#include <XMLUtils.h>
#endif
#ifndef INCLUDED_battle_struct_Pool
#include <battle/struct/Pool.h>
#endif
#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_haxe_ds_BalancedTree
#include <haxe/ds/BalancedTree.h>
#endif
#ifndef INCLUDED_haxe_ds_EnumValueMap
#include <haxe/ds/EnumValueMap.h>
#endif
#ifndef INCLUDED_roaming_Unit
#include <roaming/Unit.h>
#endif
#ifndef INCLUDED_roaming_enums_Attribute
#include <roaming/enums/Attribute.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_68_new,"roaming.Unit","new",0x20447a0b,"roaming.Unit.new","roaming/Unit.hx",68,0x940841e4)
HX_LOCAL_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_39_gainXP,"roaming.Unit","gainXP",0xea820e6c,"roaming.Unit.gainXP","roaming/Unit.hx",39,0x940841e4)
HX_LOCAL_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_49_levelUp,"roaming.Unit","levelUp",0x26f5242a,"roaming.Unit.levelUp","roaming/Unit.hx",49,0x940841e4)
HX_LOCAL_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_56_toParams,"roaming.Unit","toParams",0xddcb0d96,"roaming.Unit.toParams","roaming/Unit.hx",56,0x940841e4)
HX_LOCAL_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_86_getID,"roaming.Unit","getID",0x0e0f3c5c,"roaming.Unit.getID","roaming/Unit.hx",86,0x940841e4)
HX_LOCAL_STACK_FRAME(_hx_pos_0c43c4067f43c2a9_101_getDefaultName,"roaming.Unit","getDefaultName",0xf2a8eeeb,"roaming.Unit.getDefaultName","roaming/Unit.hx",101,0x940841e4)
namespace roaming{

void Unit_obj::__construct( ::Element element,::String name, ::Dynamic params){
            	HX_GC_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_68_new)
HXLINE(  69)		this->id = this->getID(element);
HXLINE(  70)		::String _hx_tmp;
HXDLIN(  70)		if (hx::IsNull( name )) {
HXLINE(  70)			_hx_tmp = name;
            		}
            		else {
HXLINE(  70)			_hx_tmp = this->getDefaultName(element);
            		}
HXDLIN(  70)		this->name = _hx_tmp;
HXLINE(  71)		this->element = element;
HXLINE(  73)		int _hx_tmp1;
HXDLIN(  73)		if (hx::IsNull( params )) {
HXLINE(  73)			_hx_tmp1 = (int)0;
            		}
            		else {
HXLINE(  73)			_hx_tmp1 = ( (int)(params->__Field(HX_("level",84,15,63,72),hx::paccDynamic)) );
            		}
HXDLIN(  73)		this->level = _hx_tmp1;
HXLINE(  74)		 ::battle::_hx_struct::Pool _hx_tmp2;
HXDLIN(  74)		if (hx::IsNull( params )) {
HXLINE(  74)			_hx_tmp2 =  ::battle::_hx_struct::Pool_obj::__alloc( HX_CTX ,(int)0,(int)100,null());
            		}
            		else {
HXLINE(  74)			_hx_tmp2 = ( ( ::battle::_hx_struct::Pool)(params->__Field(HX_("xp",f8,68,00,00),hx::paccDynamic)) );
            		}
HXDLIN(  74)		this->xp = _hx_tmp2;
HXLINE(  76)		this->attribs =  ::haxe::ds::EnumValueMap_obj::__alloc( HX_CTX );
HXLINE(  77)		{
HXLINE(  77)			int v;
HXDLIN(  77)			if (hx::IsNull( params )) {
HXLINE(  77)				v = (int)0;
            			}
            			else {
HXLINE(  77)				v = ( (int)(params->__Field(HX_("strength",81,d2,8e,8e),hx::paccDynamic)) );
            			}
HXDLIN(  77)			this->attribs->set(::roaming::enums::Attribute_obj::Strength_dyn(),v);
            		}
HXLINE(  78)		{
HXLINE(  78)			int v1;
HXDLIN(  78)			if (hx::IsNull( params )) {
HXLINE(  78)				v1 = (int)0;
            			}
            			else {
HXLINE(  78)				v1 = ( (int)(params->__Field(HX_("flow",ee,17,be,43),hx::paccDynamic)) );
            			}
HXDLIN(  78)			this->attribs->set(::roaming::enums::Attribute_obj::Flow_dyn(),v1);
            		}
HXLINE(  79)		{
HXLINE(  79)			int v2;
HXDLIN(  79)			if (hx::IsNull( params )) {
HXLINE(  79)				v2 = (int)0;
            			}
            			else {
HXLINE(  79)				v2 = ( (int)(params->__Field(HX_("intellect",80,07,6d,c9),hx::paccDynamic)) );
            			}
HXDLIN(  79)			this->attribs->set(::roaming::enums::Attribute_obj::Intellect_dyn(),v2);
            		}
HXLINE(  81)		::Array< ::Dynamic> _hx_tmp3;
HXDLIN(  81)		if (hx::IsNull( params )) {
HXLINE(  81)			_hx_tmp3 = ::Array_obj< ::Dynamic>::__new(0);
            		}
            		else {
HXLINE(  81)			_hx_tmp3 = ( (::Array< ::Dynamic>)(params->__Field(HX_("wheel",9b,34,ba,c9),hx::paccDynamic)) );
            		}
HXDLIN(  81)		this->wheel = _hx_tmp3;
            	}

Dynamic Unit_obj::__CreateEmpty() { return new Unit_obj; }

void *Unit_obj::_hx_vtable = 0;

Dynamic Unit_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Unit_obj > _hx_result = new Unit_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool Unit_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0b193811;
}

void Unit_obj::gainXP(int count){
            	HX_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_39_gainXP)
HXDLIN(  39)		if (((this->xp->maxValue - this->xp->value) > count)) {
HXLINE(  40)			 ::battle::_hx_struct::Pool _g = this->xp;
HXDLIN(  40)			_g->set_value((_g->value + count));
            		}
            		else {
HXLINE(  43)			 ::battle::_hx_struct::Pool _hx_tmp = this->xp;
HXDLIN(  43)			_hx_tmp->set_value(((this->xp->value + count) - this->xp->maxValue));
HXLINE(  44)			this->levelUp();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,gainXP,(void))

void Unit_obj::levelUp(){
            	HX_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_49_levelUp)
HXLINE(  50)		this->level++;
HXLINE(  51)		::haxe::Log_obj::trace(HX_("WARNING: levelUp() is called without being overriden",3a,fe,eb,11),hx::SourceInfo(HX_("Unit.hx",9a,0a,c5,8b),51,HX_("roaming.Unit",99,18,4e,0c),HX_("levelUp",ff,c8,76,21)));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,levelUp,(void))

 ::Dynamic Unit_obj::toParams(){
            	HX_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_56_toParams)
HXLINE(  57)		::String _hx_tmp = this->name;
HXLINE(  58)		 ::Dynamic _hx_tmp1 = this->attribs->get(::roaming::enums::Attribute_obj::Strength_dyn());
HXLINE(  59)		 ::Dynamic _hx_tmp2 = this->attribs->get(::roaming::enums::Attribute_obj::Flow_dyn());
HXLINE(  60)		 ::Dynamic _hx_tmp3 = this->attribs->get(::roaming::enums::Attribute_obj::Intellect_dyn());
HXLINE(  61)		::Array< ::Dynamic> _hx_tmp4 = this->wheel;
HXLINE(  62)		 ::Dynamic _hx_tmp5 = this->attribs->get(::roaming::enums::Attribute_obj::Strength_dyn());
HXDLIN(  62)		int _hx_tmp6 = (_hx_tmp5 * ::XMLUtils_obj::getGlobal(HX_("hp",08,5b,00,00),HX_("perst",be,6a,fa,bf),(int)1));
HXDLIN(  62)		int _hx_tmp7 = (_hx_tmp6 + ::XMLUtils_obj::getGlobal(HX_("hp",08,5b,00,00),HX_("base",11,e8,10,41),(int)1));
HXLINE(  63)		 ::Dynamic _hx_tmp8 = this->attribs->get(::roaming::enums::Attribute_obj::Intellect_dyn());
HXDLIN(  63)		int _hx_tmp9 = (_hx_tmp8 * ::XMLUtils_obj::getGlobal(HX_("mana",87,3c,56,48),HX_("perin",02,62,fa,bf),(int)1));
HXLINE(  56)		return  ::Dynamic(hx::Anon_obj::Create(7)
            			->setFixed(0,HX_("strength",81,d2,8e,8e),_hx_tmp1)
            			->setFixed(1,HX_("intellect",80,07,6d,c9),_hx_tmp3)
            			->setFixed(2,HX_("wheel",9b,34,ba,c9),_hx_tmp4)
            			->setFixed(3,HX_("hp",08,5b,00,00),_hx_tmp7)
            			->setFixed(4,HX_("flow",ee,17,be,43),_hx_tmp2)
            			->setFixed(5,HX_("mana",87,3c,56,48),(_hx_tmp9 + ::XMLUtils_obj::getGlobal(HX_("mana",87,3c,56,48),HX_("base",11,e8,10,41),(int)1)))
            			->setFixed(6,HX_("name",4b,72,ff,48),_hx_tmp));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,toParams,return )

 ::ID Unit_obj::getID( ::Element element){
            	HX_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_86_getID)
HXDLIN(  86)		switch((int)(_hx_getEnumValueIndex(element))){
            			case (int)2: {
HXLINE(  93)				return ::ID_obj::PlayerZealon_dyn();
            			}
            			break;
            			case (int)3: {
HXLINE(  91)				return ::ID_obj::PlayerHugo_dyn();
            			}
            			break;
            			case (int)5: {
HXLINE(  89)				return ::ID_obj::PlayerIcarus_dyn();
            			}
            			break;
            			default:{
HXLINE(  95)				HX_STACK_DO_THROW(HX_("There's no ID for such an element",f5,09,1f,fe));
            			}
            		}
HXLINE(  86)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,getID,return )

::String Unit_obj::getDefaultName( ::Element element){
            	HX_STACKFRAME(&_hx_pos_0c43c4067f43c2a9_101_getDefaultName)
HXDLIN( 101)		switch((int)(_hx_getEnumValueIndex(element))){
            			case (int)2: {
HXLINE( 108)				return HX_("Zealon",15,17,07,64);
            			}
            			break;
            			case (int)3: {
HXLINE( 106)				return HX_("Hugo",95,7e,f0,2f);
            			}
            			break;
            			case (int)5: {
HXLINE( 104)				return HX_("Icarus",89,5e,2d,71);
            			}
            			break;
            			default:{
HXLINE( 110)				HX_STACK_DO_THROW(HX_("There's no name for such an element",25,d6,cf,d8));
            			}
            		}
HXLINE( 101)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,getDefaultName,return )


hx::ObjectPtr< Unit_obj > Unit_obj::__new( ::Element element,::String name, ::Dynamic params) {
	hx::ObjectPtr< Unit_obj > __this = new Unit_obj();
	__this->__construct(element,name,params);
	return __this;
}

hx::ObjectPtr< Unit_obj > Unit_obj::__alloc(hx::Ctx *_hx_ctx, ::Element element,::String name, ::Dynamic params) {
	Unit_obj *__this = (Unit_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Unit_obj), true, "roaming.Unit"));
	*(void **)__this = Unit_obj::_hx_vtable;
	__this->__construct(element,name,params);
	return __this;
}

Unit_obj::Unit_obj()
{
}

void Unit_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Unit);
	HX_MARK_MEMBER_NAME(id,"id");
	HX_MARK_MEMBER_NAME(name,"name");
	HX_MARK_MEMBER_NAME(element,"element");
	HX_MARK_MEMBER_NAME(wheel,"wheel");
	HX_MARK_MEMBER_NAME(attribs,"attribs");
	HX_MARK_MEMBER_NAME(level,"level");
	HX_MARK_MEMBER_NAME(xp,"xp");
	HX_MARK_END_CLASS();
}

void Unit_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(id,"id");
	HX_VISIT_MEMBER_NAME(name,"name");
	HX_VISIT_MEMBER_NAME(element,"element");
	HX_VISIT_MEMBER_NAME(wheel,"wheel");
	HX_VISIT_MEMBER_NAME(attribs,"attribs");
	HX_VISIT_MEMBER_NAME(level,"level");
	HX_VISIT_MEMBER_NAME(xp,"xp");
}

hx::Val Unit_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { return hx::Val( id ); }
		if (HX_FIELD_EQ(inName,"xp") ) { return hx::Val( xp ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { return hx::Val( name ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { return hx::Val( wheel ); }
		if (HX_FIELD_EQ(inName,"level") ) { return hx::Val( level ); }
		if (HX_FIELD_EQ(inName,"getID") ) { return hx::Val( getID_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"gainXP") ) { return hx::Val( gainXP_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"element") ) { return hx::Val( element ); }
		if (HX_FIELD_EQ(inName,"attribs") ) { return hx::Val( attribs ); }
		if (HX_FIELD_EQ(inName,"levelUp") ) { return hx::Val( levelUp_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toParams") ) { return hx::Val( toParams_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"getDefaultName") ) { return hx::Val( getDefaultName_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Unit_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { id=inValue.Cast<  ::ID >(); return inValue; }
		if (HX_FIELD_EQ(inName,"xp") ) { xp=inValue.Cast<  ::battle::_hx_struct::Pool >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { name=inValue.Cast< ::String >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { wheel=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		if (HX_FIELD_EQ(inName,"level") ) { level=inValue.Cast< int >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"element") ) { element=inValue.Cast<  ::Element >(); return inValue; }
		if (HX_FIELD_EQ(inName,"attribs") ) { attribs=inValue.Cast<  ::haxe::ds::EnumValueMap >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Unit_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"));
	outFields->push(HX_HCSTRING("name","\x4b","\x72","\xff","\x48"));
	outFields->push(HX_HCSTRING("element","\xbc","\xae","\x54","\x06"));
	outFields->push(HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"));
	outFields->push(HX_HCSTRING("attribs","\xe9","\x79","\x2d","\x39"));
	outFields->push(HX_HCSTRING("level","\x84","\x15","\x63","\x72"));
	outFields->push(HX_HCSTRING("xp","\xf8","\x68","\x00","\x00"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Unit_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::ID*/ ,(int)offsetof(Unit_obj,id),HX_HCSTRING("id","\xdb","\x5b","\x00","\x00")},
	{hx::fsString,(int)offsetof(Unit_obj,name),HX_HCSTRING("name","\x4b","\x72","\xff","\x48")},
	{hx::fsObject /*::Element*/ ,(int)offsetof(Unit_obj,element),HX_HCSTRING("element","\xbc","\xae","\x54","\x06")},
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(Unit_obj,wheel),HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9")},
	{hx::fsObject /*::haxe::ds::EnumValueMap*/ ,(int)offsetof(Unit_obj,attribs),HX_HCSTRING("attribs","\xe9","\x79","\x2d","\x39")},
	{hx::fsInt,(int)offsetof(Unit_obj,level),HX_HCSTRING("level","\x84","\x15","\x63","\x72")},
	{hx::fsObject /*::battle::_hx_struct::Pool*/ ,(int)offsetof(Unit_obj,xp),HX_HCSTRING("xp","\xf8","\x68","\x00","\x00")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Unit_obj_sStaticStorageInfo = 0;
#endif

static ::String Unit_obj_sMemberFields[] = {
	HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"),
	HX_HCSTRING("name","\x4b","\x72","\xff","\x48"),
	HX_HCSTRING("element","\xbc","\xae","\x54","\x06"),
	HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"),
	HX_HCSTRING("attribs","\xe9","\x79","\x2d","\x39"),
	HX_HCSTRING("level","\x84","\x15","\x63","\x72"),
	HX_HCSTRING("xp","\xf8","\x68","\x00","\x00"),
	HX_HCSTRING("gainXP","\x37","\x9b","\x5b","\x4e"),
	HX_HCSTRING("levelUp","\xff","\xc8","\x76","\x21"),
	HX_HCSTRING("toParams","\x21","\xa3","\xb9","\x14"),
	HX_HCSTRING("getID","\xf1","\x91","\x60","\x91"),
	HX_HCSTRING("getDefaultName","\xb6","\xbe","\x5c","\xa2"),
	::String(null()) };

static void Unit_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Unit_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Unit_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Unit_obj::__mClass,"__mClass");
};

#endif

hx::Class Unit_obj::__mClass;

void Unit_obj::__register()
{
	hx::Object *dummy = new Unit_obj;
	Unit_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("roaming.Unit","\x99","\x18","\x4e","\x0c");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Unit_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Unit_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Unit_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Unit_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Unit_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Unit_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace roaming
