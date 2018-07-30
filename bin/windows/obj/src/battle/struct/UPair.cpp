// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_MathUtils
#include <MathUtils.h>
#endif
#ifndef INCLUDED_battle_Unit
#include <battle/Unit.h>
#endif
#ifndef INCLUDED_battle_enums_Team
#include <battle/enums/Team.h>
#endif
#ifndef INCLUDED_battle_struct_UPair
#include <battle/struct/UPair.h>
#endif
#ifndef INCLUDED_battle_struct_UPairIterator
#include <battle/struct/UPairIterator.h>
#endif
#ifndef INCLUDED_battle_struct_UnitCoords
#include <battle/struct/UnitCoords.h>
#endif
#ifndef INCLUDED_hxassert_Assert
#include <hxassert/Assert.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c0939df335bc2eac_68_new,"battle.struct.UPair","new",0x1e92a41e,"battle.struct.UPair.new","battle/struct/UPair.hx",68,0x1d235b32)
static const ::String _hx_array_data_2872fd2c_1[] = {
	HX_("Assertion failed: left.length.inRange(1, 3)",69,06,ad,d3),
};
static const ::String _hx_array_data_2872fd2c_2[] = {
	HX_("Assertion failed: right.length.inRange(1, 3)",96,7d,fb,ac),
};
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_20_get_both,"battle.struct.UPair","get_both",0x86c91f8c,"battle.struct.UPair.get_both","battle/struct/UPair.hx",20,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_25_get,"battle.struct.UPair","get",0x1e8d5454,"battle.struct.UPair.get","battle/struct/UPair.hx",25,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_32_getByUnit,"battle.struct.UPair","getByUnit",0xfddc436f,"battle.struct.UPair.getByUnit","battle/struct/UPair.hx",32,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_40_opposite,"battle.struct.UPair","opposite",0xc1fcb469,"battle.struct.UPair.opposite","battle/struct/UPair.hx",40,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_46_allied,"battle.struct.UPair","allied",0x11b54d89,"battle.struct.UPair.allied","battle/struct/UPair.hx",46,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_51_find,"battle.struct.UPair","find",0x9c7642bb,"battle.struct.UPair.find","battle/struct/UPair.hx",51,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_64_player,"battle.struct.UPair","player",0x09d68263,"battle.struct.UPair.player","battle/struct/UPair.hx",64,0x1d235b32)
HX_LOCAL_STACK_FRAME(_hx_pos_c0939df335bc2eac_78_iterator,"battle.struct.UPair","iterator",0x598d2570,"battle.struct.UPair.iterator","battle/struct/UPair.hx",78,0x1d235b32)
namespace battle{
namespace _hx_struct{

void UPair_obj::__construct(::cpp::VirtualArray left,::cpp::VirtualArray right){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_68_new)
HXLINE( 151)		if ((false == ::MathUtils_obj::inRange(left->get_length(),(int)1,(int)3,null(),null()))) {
HXLINE(  69)			::hxassert::Assert_obj::throwAssertionFailureError(::Array_obj< ::String >::fromData( _hx_array_data_2872fd2c_1,1),hx::SourceInfo(HX_("UPair.hx",0f,7f,a3,85),69,HX_("battle.struct.UPair",2c,fd,72,28),HX_("new",60,d0,53,00)));
            		}
HXLINE( 151)		if ((false == ::MathUtils_obj::inRange(right->get_length(),(int)1,(int)3,null(),null()))) {
HXLINE(  70)			::hxassert::Assert_obj::throwAssertionFailureError(::Array_obj< ::String >::fromData( _hx_array_data_2872fd2c_2,1),hx::SourceInfo(HX_("UPair.hx",0f,7f,a3,85),70,HX_("battle.struct.UPair",2c,fd,72,28),HX_("new",60,d0,53,00)));
            		}
HXLINE(  72)		this->left = left;
HXLINE(  73)		this->right = right;
            	}

Dynamic UPair_obj::__CreateEmpty() { return new UPair_obj; }

void *UPair_obj::_hx_vtable = 0;

Dynamic UPair_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< UPair_obj > _hx_result = new UPair_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool UPair_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x74fa12be;
}

::cpp::VirtualArray UPair_obj::get_both(){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_20_get_both)
HXDLIN(  20)		return this->left->concat(this->right);
            	}


HX_DEFINE_DYNAMIC_FUNC0(UPair_obj,get_both,return )

 ::Dynamic UPair_obj::get( ::battle::_hx_struct::UnitCoords coords){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_25_get)
HXLINE(  26)		::cpp::VirtualArray array;
HXDLIN(  26)		if (hx::IsEq( coords->team,::battle::enums::Team_obj::Left_dyn() )) {
HXLINE(  26)			array = this->left;
            		}
            		else {
HXLINE(  26)			array = this->right;
            		}
HXLINE(  27)		return array->__get(coords->pos);
            	}


HX_DEFINE_DYNAMIC_FUNC1(UPair_obj,get,return )

 ::Dynamic UPair_obj::getByUnit( ::battle::Unit unit){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_32_getByUnit)
HXLINE(  33)		 ::battle::_hx_struct::UnitCoords coords = ::battle::_hx_struct::UnitCoords_obj::get(unit);
HXLINE(  34)		return this->get(coords);
            	}


HX_DEFINE_DYNAMIC_FUNC1(UPair_obj,getByUnit,return )

::cpp::VirtualArray UPair_obj::opposite( ::battle::_hx_struct::UnitCoords coords){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_40_opposite)
HXDLIN(  40)		if (hx::IsEq( coords->team,::battle::enums::Team_obj::Left_dyn() )) {
HXDLIN(  40)			return this->right;
            		}
            		else {
HXDLIN(  40)			return this->left;
            		}
HXDLIN(  40)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(UPair_obj,opposite,return )

::cpp::VirtualArray UPair_obj::allied( ::battle::_hx_struct::UnitCoords coords){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_46_allied)
HXDLIN(  46)		if (hx::IsEq( coords->team,::battle::enums::Team_obj::Left_dyn() )) {
HXDLIN(  46)			return this->left;
            		}
            		else {
HXDLIN(  46)			return this->right;
            		}
HXDLIN(  46)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(UPair_obj,allied,return )

 ::battle::_hx_struct::UnitCoords UPair_obj::find( ::Dynamic obj){
            	HX_GC_STACKFRAME(&_hx_pos_c0939df335bc2eac_51_find)
HXLINE(  52)		{
HXLINE(  52)			int _g1 = (int)0;
HXDLIN(  52)			int _g = this->left->get_length();
HXDLIN(  52)			while((_g1 < _g)){
HXLINE(  52)				_g1 = (_g1 + (int)1);
HXDLIN(  52)				int i = (_g1 - (int)1);
HXLINE(  53)				if (hx::IsEq( this->left->__get(i),obj )) {
HXLINE(  54)					return  ::battle::_hx_struct::UnitCoords_obj::__alloc( HX_CTX ,::battle::enums::Team_obj::Left_dyn(),i);
            				}
            			}
            		}
HXLINE(  55)		{
HXLINE(  55)			int _g11 = (int)0;
HXDLIN(  55)			int _g2 = this->right->get_length();
HXDLIN(  55)			while((_g11 < _g2)){
HXLINE(  55)				_g11 = (_g11 + (int)1);
HXDLIN(  55)				int i1 = (_g11 - (int)1);
HXLINE(  56)				if (hx::IsEq( this->right->__get(i1),obj )) {
HXLINE(  57)					return  ::battle::_hx_struct::UnitCoords_obj::__alloc( HX_CTX ,::battle::enums::Team_obj::Right_dyn(),i1);
            				}
            			}
            		}
HXLINE(  58)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(UPair_obj,find,return )

 ::Dynamic UPair_obj::player(){
            	HX_STACKFRAME(&_hx_pos_c0939df335bc2eac_64_player)
HXDLIN(  64)		return this->left->__get((int)0);
            	}


HX_DEFINE_DYNAMIC_FUNC0(UPair_obj,player,return )

 ::Dynamic UPair_obj::iterator(){
            	HX_GC_STACKFRAME(&_hx_pos_c0939df335bc2eac_78_iterator)
HXDLIN(  78)		return  ::battle::_hx_struct::UPairIterator_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
            	}


HX_DEFINE_DYNAMIC_FUNC0(UPair_obj,iterator,return )


hx::ObjectPtr< UPair_obj > UPair_obj::__new(::cpp::VirtualArray left,::cpp::VirtualArray right) {
	hx::ObjectPtr< UPair_obj > __this = new UPair_obj();
	__this->__construct(left,right);
	return __this;
}

hx::ObjectPtr< UPair_obj > UPair_obj::__alloc(hx::Ctx *_hx_ctx,::cpp::VirtualArray left,::cpp::VirtualArray right) {
	UPair_obj *__this = (UPair_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(UPair_obj), true, "battle.struct.UPair"));
	*(void **)__this = UPair_obj::_hx_vtable;
	__this->__construct(left,right);
	return __this;
}

UPair_obj::UPair_obj()
{
}

void UPair_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(UPair);
	HX_MARK_MEMBER_NAME(left,"left");
	HX_MARK_MEMBER_NAME(right,"right");
	HX_MARK_END_CLASS();
}

void UPair_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(left,"left");
	HX_VISIT_MEMBER_NAME(right,"right");
}

hx::Val UPair_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"get") ) { return hx::Val( get_dyn() ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { return hx::Val( left ); }
		if (HX_FIELD_EQ(inName,"both") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_both() ); }
		if (HX_FIELD_EQ(inName,"find") ) { return hx::Val( find_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"right") ) { return hx::Val( right ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"allied") ) { return hx::Val( allied_dyn() ); }
		if (HX_FIELD_EQ(inName,"player") ) { return hx::Val( player_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"get_both") ) { return hx::Val( get_both_dyn() ); }
		if (HX_FIELD_EQ(inName,"opposite") ) { return hx::Val( opposite_dyn() ); }
		if (HX_FIELD_EQ(inName,"iterator") ) { return hx::Val( iterator_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"getByUnit") ) { return hx::Val( getByUnit_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val UPair_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { left=inValue.Cast< ::cpp::VirtualArray >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"right") ) { right=inValue.Cast< ::cpp::VirtualArray >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void UPair_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("left","\x07","\x08","\xb0","\x47"));
	outFields->push(HX_HCSTRING("right","\xdc","\x0b","\x64","\xe9"));
	outFields->push(HX_HCSTRING("both","\x81","\x88","\x1b","\x41"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo UPair_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*cpp::ArrayBase*/ ,(int)offsetof(UPair_obj,left),HX_HCSTRING("left","\x07","\x08","\xb0","\x47")},
	{hx::fsObject /*cpp::ArrayBase*/ ,(int)offsetof(UPair_obj,right),HX_HCSTRING("right","\xdc","\x0b","\x64","\xe9")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *UPair_obj_sStaticStorageInfo = 0;
#endif

static ::String UPair_obj_sMemberFields[] = {
	HX_HCSTRING("left","\x07","\x08","\xb0","\x47"),
	HX_HCSTRING("right","\xdc","\x0b","\x64","\xe9"),
	HX_HCSTRING("get_both","\x0a","\x44","\xd6","\xc0"),
	HX_HCSTRING("get","\x96","\x80","\x4e","\x00"),
	HX_HCSTRING("getByUnit","\x31","\x0d","\x4f","\x8f"),
	HX_HCSTRING("opposite","\xe7","\xd8","\x09","\xfc"),
	HX_HCSTRING("allied","\x87","\xb6","\x97","\x3f"),
	HX_HCSTRING("find","\x39","\xd0","\xbb","\x43"),
	HX_HCSTRING("player","\x61","\xeb","\xb8","\x37"),
	HX_HCSTRING("iterator","\xee","\x49","\x9a","\x93"),
	::String(null()) };

static void UPair_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(UPair_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void UPair_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(UPair_obj::__mClass,"__mClass");
};

#endif

hx::Class UPair_obj::__mClass;

void UPair_obj::__register()
{
	hx::Object *dummy = new UPair_obj;
	UPair_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("battle.struct.UPair","\x2c","\xfd","\x72","\x28");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = UPair_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(UPair_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< UPair_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = UPair_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = UPair_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = UPair_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace battle
} // end namespace struct
