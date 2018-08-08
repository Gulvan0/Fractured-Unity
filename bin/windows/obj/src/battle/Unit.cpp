// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_Linear
#include <Linear.h>
#endif
#ifndef INCLUDED_XMLUtils
#include <XMLUtils.h>
#endif
#ifndef INCLUDED_battle_Ability
#include <battle/Ability.h>
#endif
#ifndef INCLUDED_battle_Active
#include <battle/Active.h>
#endif
#ifndef INCLUDED_battle_Unit
#include <battle/Unit.h>
#endif
#ifndef INCLUDED_battle_enums_Team
#include <battle/enums/Team.h>
#endif
#ifndef INCLUDED_battle_enums_UnitType
#include <battle/enums/UnitType.h>
#endif
#ifndef INCLUDED_battle_struct_BuffQueue
#include <battle/struct/BuffQueue.h>
#endif
#ifndef INCLUDED_battle_struct_FloatPool
#include <battle/struct/FloatPool.h>
#endif
#ifndef INCLUDED_battle_struct_Pool
#include <battle/struct/Pool.h>
#endif
#ifndef INCLUDED_battle_struct_Wheel
#include <battle/struct/Wheel.h>
#endif
#ifndef INCLUDED_hxassert_Assert
#include <hxassert/Assert.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_8d41d918a9427d69_81_new,"battle.Unit","new",0x15366b8c,"battle.Unit.new","battle/Unit.hx",81,0x8880bb83)
static const ::String _hx_array_data_53a6f59a_1[] = {
	HX_("Assertion failed: position >= 0 && position <= 2",e5,9d,6e,9e),
};
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_65_tick,"battle.Unit","tick",0x7e61eeb1,"battle.Unit.tick","battle/Unit.hx",65,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_72_isStunned,"battle.Unit","isStunned",0x496d1cb5,"battle.Unit.isStunned","battle/Unit.hx",72,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_77_isAlive,"battle.Unit","isAlive",0x5d84a8af,"battle.Unit.isAlive","battle/Unit.hx",77,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_114_figureRelation,"battle.Unit","figureRelation",0xd7412f54,"battle.Unit.figureRelation","battle/Unit.hx",114,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_124_checkManacost,"battle.Unit","checkManacost",0xafe87168,"battle.Unit.checkManacost","battle/Unit.hx",124,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_129_isPlayer,"battle.Unit","isPlayer",0x70a1ec3f,"battle.Unit.isPlayer","battle/Unit.hx",129,0x8880bb83)
HX_LOCAL_STACK_FRAME(_hx_pos_8d41d918a9427d69_134_same,"battle.Unit","same",0x7db2aeba,"battle.Unit.same","battle/Unit.hx",134,0x8880bb83)
namespace battle{

void Unit_obj::__construct( ::ID id, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams){
            	HX_GC_STACKFRAME(&_hx_pos_8d41d918a9427d69_81_new)
HXLINE( 151)		bool _hx_tmp;
HXDLIN( 151)		if ((position >= (int)0)) {
HXLINE( 151)			_hx_tmp = (position <= (int)2);
            		}
            		else {
HXLINE( 151)			_hx_tmp = false;
            		}
HXDLIN( 151)		if ((false == _hx_tmp)) {
HXLINE(  82)			::hxassert::Assert_obj::throwAssertionFailureError(::Array_obj< ::String >::fromData( _hx_array_data_53a6f59a_1,1),hx::SourceInfo(HX_("Unit.hx",9a,0a,c5,8b),82,HX_("battle.Unit",9a,f5,a6,53),HX_("new",60,d0,53,00)));
            		}
HXLINE(  84)		if (hx::IsNull( params )) {
HXLINE(  85)			params = ::XMLUtils_obj::parseUnit(id);
            		}
HXLINE(  87)		this->id = id;
HXLINE(  88)		this->name = ( (::String)(params->__Field(HX_("name",4b,72,ff,48),hx::paccDynamic)) );
HXLINE(  89)		this->team = team;
HXLINE(  90)		this->position = position;
HXLINE(  92)		this->wheel =  ::battle::_hx_struct::Wheel_obj::__alloc( HX_CTX , ::Dynamic(params->__Field(HX_("wheel",9b,34,ba,c9),hx::paccDynamic)),(int)8);
HXLINE(  93)		this->hpPool =  ::battle::_hx_struct::Pool_obj::__alloc( HX_CTX , ::Dynamic(params->__Field(HX_("hp",08,5b,00,00),hx::paccDynamic)), ::Dynamic(params->__Field(HX_("hp",08,5b,00,00),hx::paccDynamic)),null());
HXLINE(  94)		this->manaPool =  ::battle::_hx_struct::Pool_obj::__alloc( HX_CTX , ::Dynamic(params->__Field(HX_("mana",87,3c,56,48),hx::paccDynamic)), ::Dynamic(params->__Field(HX_("mana",87,3c,56,48),hx::paccDynamic)),null());
HXLINE(  95)		this->alacrityPool =  ::battle::_hx_struct::FloatPool_obj::__alloc( HX_CTX ,(int)0,(int)100,null());
HXLINE(  97)		this->strength = ( (int)(params->__Field(HX_("strength",81,d2,8e,8e),hx::paccDynamic)) );
HXLINE(  98)		this->flow = ( (int)(params->__Field(HX_("flow",ee,17,be,43),hx::paccDynamic)) );
HXLINE(  99)		this->intellect = ( (int)(params->__Field(HX_("intellect",80,07,6d,c9),hx::paccDynamic)) );
HXLINE( 101)		 ::battle::_hx_struct::BuffQueue _hx_tmp1;
HXDLIN( 101)		if (hx::IsNotNull( subparams )) {
HXLINE( 101)			_hx_tmp1 = ( ( ::battle::_hx_struct::BuffQueue)(subparams->__Field(HX_("buffQueue",be,76,84,2f),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 101)			_hx_tmp1 =  ::battle::_hx_struct::BuffQueue_obj::__alloc( HX_CTX );
            		}
HXDLIN( 101)		this->buffQueue = _hx_tmp1;
HXLINE( 103)		 ::Linear _hx_tmp2;
HXDLIN( 103)		if (hx::IsNotNull( subparams )) {
HXLINE( 103)			_hx_tmp2 = ( ( ::Linear)(subparams->__Field(HX_("damageIn",34,0a,7d,cc),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 103)			_hx_tmp2 =  ::Linear_obj::__alloc( HX_CTX ,(int)1,(int)0);
            		}
HXDLIN( 103)		this->damageIn = _hx_tmp2;
HXLINE( 104)		 ::Linear _hx_tmp3;
HXDLIN( 104)		if (hx::IsNotNull( subparams )) {
HXLINE( 104)			_hx_tmp3 = ( ( ::Linear)(subparams->__Field(HX_("damageOut",5f,77,f0,20),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 104)			_hx_tmp3 =  ::Linear_obj::__alloc( HX_CTX ,(int)1,(int)0);
            		}
HXDLIN( 104)		this->damageOut = _hx_tmp3;
HXLINE( 105)		 ::Linear _hx_tmp4;
HXDLIN( 105)		if (hx::IsNotNull( subparams )) {
HXLINE( 105)			_hx_tmp4 = ( ( ::Linear)(subparams->__Field(HX_("healIn",2d,03,06,fd),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 105)			_hx_tmp4 =  ::Linear_obj::__alloc( HX_CTX ,(int)1,(int)0);
            		}
HXDLIN( 105)		this->healIn = _hx_tmp4;
HXLINE( 106)		 ::Linear _hx_tmp5;
HXDLIN( 106)		if (hx::IsNotNull( subparams )) {
HXLINE( 106)			_hx_tmp5 = ( ( ::Linear)(subparams->__Field(HX_("healOut",46,58,41,68),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 106)			_hx_tmp5 =  ::Linear_obj::__alloc( HX_CTX ,(int)1,(int)0);
            		}
HXDLIN( 106)		this->healOut = _hx_tmp5;
HXLINE( 108)		 ::Linear _hx_tmp6;
HXDLIN( 108)		if (hx::IsNotNull( subparams )) {
HXLINE( 108)			_hx_tmp6 = ( ( ::Linear)(subparams->__Field(HX_("critChance",ee,bd,be,85),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 108)			_hx_tmp6 =  ::Linear_obj::__alloc( HX_CTX ,(int)0,(int)0);
            		}
HXDLIN( 108)		this->critChance = _hx_tmp6;
HXLINE( 109)		 ::Linear _hx_tmp7;
HXDLIN( 109)		if (hx::IsNotNull( subparams )) {
HXLINE( 109)			_hx_tmp7 = ( ( ::Linear)(subparams->__Field(HX_("critDamage",69,c0,30,ec),hx::paccDynamic)) );
            		}
            		else {
HXLINE( 109)			_hx_tmp7 =  ::Linear_obj::__alloc( HX_CTX ,(int)1,(int)0);
            		}
HXDLIN( 109)		this->critDamage = _hx_tmp7;
            	}

Dynamic Unit_obj::__CreateEmpty() { return new Unit_obj; }

void *Unit_obj::_hx_vtable = 0;

Dynamic Unit_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Unit_obj > _hx_result = new Unit_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4]);
	return _hx_result;
}

bool Unit_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x0e64089c;
}

void Unit_obj::tick(){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_65_tick)
HXLINE(  66)		this->wheel->tick();
HXLINE(  67)		this->buffQueue->tick();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,tick,(void))

bool Unit_obj::isStunned(){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_72_isStunned)
HXDLIN(  72)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,isStunned,return )

bool Unit_obj::isAlive(){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_77_isAlive)
HXDLIN(  77)		return (this->hpPool->value > (int)0);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,isAlive,return )

 ::battle::enums::UnitType Unit_obj::figureRelation( ::battle::Unit unit){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_114_figureRelation)
HXDLIN( 114)		if (hx::IsNotEq( this->team,unit->team )) {
HXLINE( 115)			return ::battle::enums::UnitType_obj::Enemy_dyn();
            		}
            		else {
HXLINE( 116)			if ((this->position == unit->position)) {
HXLINE( 117)				return ::battle::enums::UnitType_obj::Self_dyn();
            			}
            			else {
HXLINE( 119)				return ::battle::enums::UnitType_obj::Ally_dyn();
            			}
            		}
HXLINE( 114)		return null();
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,figureRelation,return )

bool Unit_obj::checkManacost(int abilityNum){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_124_checkManacost)
HXDLIN( 124)		int _hx_tmp = this->manaPool->value;
HXDLIN( 124)		return (_hx_tmp >= this->wheel->getActive(abilityNum)->manacost);
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,checkManacost,return )

bool Unit_obj::isPlayer(){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_129_isPlayer)
HXDLIN( 129)		if (hx::IsEq( this->team,::battle::enums::Team_obj::Left_dyn() )) {
HXDLIN( 129)			return (this->position == (int)0);
            		}
            		else {
HXDLIN( 129)			return false;
            		}
HXDLIN( 129)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC0(Unit_obj,isPlayer,return )

bool Unit_obj::same( ::battle::Unit unit){
            	HX_STACKFRAME(&_hx_pos_8d41d918a9427d69_134_same)
HXDLIN( 134)		if (hx::IsEq( this->team,unit->team )) {
HXDLIN( 134)			return (this->position == unit->position);
            		}
            		else {
HXDLIN( 134)			return false;
            		}
HXDLIN( 134)		return false;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Unit_obj,same,return )


hx::ObjectPtr< Unit_obj > Unit_obj::__new( ::ID id, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams) {
	hx::ObjectPtr< Unit_obj > __this = new Unit_obj();
	__this->__construct(id,team,position,params,subparams);
	return __this;
}

hx::ObjectPtr< Unit_obj > Unit_obj::__alloc(hx::Ctx *_hx_ctx, ::ID id, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams) {
	Unit_obj *__this = (Unit_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Unit_obj), true, "battle.Unit"));
	*(void **)__this = Unit_obj::_hx_vtable;
	__this->__construct(id,team,position,params,subparams);
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
	HX_MARK_MEMBER_NAME(team,"team");
	HX_MARK_MEMBER_NAME(position,"position");
	HX_MARK_MEMBER_NAME(wheel,"wheel");
	HX_MARK_MEMBER_NAME(hpPool,"hpPool");
	HX_MARK_MEMBER_NAME(manaPool,"manaPool");
	HX_MARK_MEMBER_NAME(alacrityPool,"alacrityPool");
	HX_MARK_MEMBER_NAME(buffQueue,"buffQueue");
	HX_MARK_MEMBER_NAME(strength,"strength");
	HX_MARK_MEMBER_NAME(flow,"flow");
	HX_MARK_MEMBER_NAME(intellect,"intellect");
	HX_MARK_MEMBER_NAME(damageIn,"damageIn");
	HX_MARK_MEMBER_NAME(damageOut,"damageOut");
	HX_MARK_MEMBER_NAME(healIn,"healIn");
	HX_MARK_MEMBER_NAME(healOut,"healOut");
	HX_MARK_MEMBER_NAME(critChance,"critChance");
	HX_MARK_MEMBER_NAME(critDamage,"critDamage");
	HX_MARK_END_CLASS();
}

void Unit_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(id,"id");
	HX_VISIT_MEMBER_NAME(name,"name");
	HX_VISIT_MEMBER_NAME(team,"team");
	HX_VISIT_MEMBER_NAME(position,"position");
	HX_VISIT_MEMBER_NAME(wheel,"wheel");
	HX_VISIT_MEMBER_NAME(hpPool,"hpPool");
	HX_VISIT_MEMBER_NAME(manaPool,"manaPool");
	HX_VISIT_MEMBER_NAME(alacrityPool,"alacrityPool");
	HX_VISIT_MEMBER_NAME(buffQueue,"buffQueue");
	HX_VISIT_MEMBER_NAME(strength,"strength");
	HX_VISIT_MEMBER_NAME(flow,"flow");
	HX_VISIT_MEMBER_NAME(intellect,"intellect");
	HX_VISIT_MEMBER_NAME(damageIn,"damageIn");
	HX_VISIT_MEMBER_NAME(damageOut,"damageOut");
	HX_VISIT_MEMBER_NAME(healIn,"healIn");
	HX_VISIT_MEMBER_NAME(healOut,"healOut");
	HX_VISIT_MEMBER_NAME(critChance,"critChance");
	HX_VISIT_MEMBER_NAME(critDamage,"critDamage");
}

hx::Val Unit_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { return hx::Val( id ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { return hx::Val( name ); }
		if (HX_FIELD_EQ(inName,"team") ) { return hx::Val( team ); }
		if (HX_FIELD_EQ(inName,"flow") ) { return hx::Val( flow ); }
		if (HX_FIELD_EQ(inName,"tick") ) { return hx::Val( tick_dyn() ); }
		if (HX_FIELD_EQ(inName,"same") ) { return hx::Val( same_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { return hx::Val( wheel ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"hpPool") ) { return hx::Val( hpPool ); }
		if (HX_FIELD_EQ(inName,"healIn") ) { return hx::Val( healIn ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"healOut") ) { return hx::Val( healOut ); }
		if (HX_FIELD_EQ(inName,"isAlive") ) { return hx::Val( isAlive_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"position") ) { return hx::Val( position ); }
		if (HX_FIELD_EQ(inName,"manaPool") ) { return hx::Val( manaPool ); }
		if (HX_FIELD_EQ(inName,"strength") ) { return hx::Val( strength ); }
		if (HX_FIELD_EQ(inName,"damageIn") ) { return hx::Val( damageIn ); }
		if (HX_FIELD_EQ(inName,"isPlayer") ) { return hx::Val( isPlayer_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"buffQueue") ) { return hx::Val( buffQueue ); }
		if (HX_FIELD_EQ(inName,"intellect") ) { return hx::Val( intellect ); }
		if (HX_FIELD_EQ(inName,"damageOut") ) { return hx::Val( damageOut ); }
		if (HX_FIELD_EQ(inName,"isStunned") ) { return hx::Val( isStunned_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"critChance") ) { return hx::Val( critChance ); }
		if (HX_FIELD_EQ(inName,"critDamage") ) { return hx::Val( critDamage ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"alacrityPool") ) { return hx::Val( alacrityPool ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"checkManacost") ) { return hx::Val( checkManacost_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"figureRelation") ) { return hx::Val( figureRelation_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Unit_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"id") ) { id=inValue.Cast<  ::ID >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { name=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"team") ) { team=inValue.Cast<  ::battle::enums::Team >(); return inValue; }
		if (HX_FIELD_EQ(inName,"flow") ) { flow=inValue.Cast< int >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"wheel") ) { wheel=inValue.Cast<  ::battle::_hx_struct::Wheel >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"hpPool") ) { hpPool=inValue.Cast<  ::battle::_hx_struct::Pool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"healIn") ) { healIn=inValue.Cast<  ::Linear >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"healOut") ) { healOut=inValue.Cast<  ::Linear >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"position") ) { position=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"manaPool") ) { manaPool=inValue.Cast<  ::battle::_hx_struct::Pool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"strength") ) { strength=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"damageIn") ) { damageIn=inValue.Cast<  ::Linear >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"buffQueue") ) { buffQueue=inValue.Cast<  ::battle::_hx_struct::BuffQueue >(); return inValue; }
		if (HX_FIELD_EQ(inName,"intellect") ) { intellect=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"damageOut") ) { damageOut=inValue.Cast<  ::Linear >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"critChance") ) { critChance=inValue.Cast<  ::Linear >(); return inValue; }
		if (HX_FIELD_EQ(inName,"critDamage") ) { critDamage=inValue.Cast<  ::Linear >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"alacrityPool") ) { alacrityPool=inValue.Cast<  ::battle::_hx_struct::FloatPool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Unit_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"));
	outFields->push(HX_HCSTRING("name","\x4b","\x72","\xff","\x48"));
	outFields->push(HX_HCSTRING("team","\x9d","\xb8","\xf9","\x4c"));
	outFields->push(HX_HCSTRING("position","\xa9","\xa0","\xfa","\xca"));
	outFields->push(HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"));
	outFields->push(HX_HCSTRING("hpPool","\x04","\x2c","\x34","\x47"));
	outFields->push(HX_HCSTRING("manaPool","\x03","\x39","\x72","\x26"));
	outFields->push(HX_HCSTRING("alacrityPool","\x85","\x0f","\xcd","\x7f"));
	outFields->push(HX_HCSTRING("buffQueue","\xbe","\x76","\x84","\x2f"));
	outFields->push(HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e"));
	outFields->push(HX_HCSTRING("flow","\xee","\x17","\xbe","\x43"));
	outFields->push(HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9"));
	outFields->push(HX_HCSTRING("damageIn","\x34","\x0a","\x7d","\xcc"));
	outFields->push(HX_HCSTRING("damageOut","\x5f","\x77","\xf0","\x20"));
	outFields->push(HX_HCSTRING("healIn","\x2d","\x03","\x06","\xfd"));
	outFields->push(HX_HCSTRING("healOut","\x46","\x58","\x41","\x68"));
	outFields->push(HX_HCSTRING("critChance","\xee","\xbd","\xbe","\x85"));
	outFields->push(HX_HCSTRING("critDamage","\x69","\xc0","\x30","\xec"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Unit_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::ID*/ ,(int)offsetof(Unit_obj,id),HX_HCSTRING("id","\xdb","\x5b","\x00","\x00")},
	{hx::fsString,(int)offsetof(Unit_obj,name),HX_HCSTRING("name","\x4b","\x72","\xff","\x48")},
	{hx::fsObject /*::battle::enums::Team*/ ,(int)offsetof(Unit_obj,team),HX_HCSTRING("team","\x9d","\xb8","\xf9","\x4c")},
	{hx::fsInt,(int)offsetof(Unit_obj,position),HX_HCSTRING("position","\xa9","\xa0","\xfa","\xca")},
	{hx::fsObject /*::battle::_hx_struct::Wheel*/ ,(int)offsetof(Unit_obj,wheel),HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9")},
	{hx::fsObject /*::battle::_hx_struct::Pool*/ ,(int)offsetof(Unit_obj,hpPool),HX_HCSTRING("hpPool","\x04","\x2c","\x34","\x47")},
	{hx::fsObject /*::battle::_hx_struct::Pool*/ ,(int)offsetof(Unit_obj,manaPool),HX_HCSTRING("manaPool","\x03","\x39","\x72","\x26")},
	{hx::fsObject /*::battle::_hx_struct::FloatPool*/ ,(int)offsetof(Unit_obj,alacrityPool),HX_HCSTRING("alacrityPool","\x85","\x0f","\xcd","\x7f")},
	{hx::fsObject /*::battle::_hx_struct::BuffQueue*/ ,(int)offsetof(Unit_obj,buffQueue),HX_HCSTRING("buffQueue","\xbe","\x76","\x84","\x2f")},
	{hx::fsInt,(int)offsetof(Unit_obj,strength),HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e")},
	{hx::fsInt,(int)offsetof(Unit_obj,flow),HX_HCSTRING("flow","\xee","\x17","\xbe","\x43")},
	{hx::fsInt,(int)offsetof(Unit_obj,intellect),HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,damageIn),HX_HCSTRING("damageIn","\x34","\x0a","\x7d","\xcc")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,damageOut),HX_HCSTRING("damageOut","\x5f","\x77","\xf0","\x20")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,healIn),HX_HCSTRING("healIn","\x2d","\x03","\x06","\xfd")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,healOut),HX_HCSTRING("healOut","\x46","\x58","\x41","\x68")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,critChance),HX_HCSTRING("critChance","\xee","\xbd","\xbe","\x85")},
	{hx::fsObject /*::Linear*/ ,(int)offsetof(Unit_obj,critDamage),HX_HCSTRING("critDamage","\x69","\xc0","\x30","\xec")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Unit_obj_sStaticStorageInfo = 0;
#endif

static ::String Unit_obj_sMemberFields[] = {
	HX_HCSTRING("id","\xdb","\x5b","\x00","\x00"),
	HX_HCSTRING("name","\x4b","\x72","\xff","\x48"),
	HX_HCSTRING("team","\x9d","\xb8","\xf9","\x4c"),
	HX_HCSTRING("position","\xa9","\xa0","\xfa","\xca"),
	HX_HCSTRING("wheel","\x9b","\x34","\xba","\xc9"),
	HX_HCSTRING("hpPool","\x04","\x2c","\x34","\x47"),
	HX_HCSTRING("manaPool","\x03","\x39","\x72","\x26"),
	HX_HCSTRING("alacrityPool","\x85","\x0f","\xcd","\x7f"),
	HX_HCSTRING("buffQueue","\xbe","\x76","\x84","\x2f"),
	HX_HCSTRING("strength","\x81","\xd2","\x8e","\x8e"),
	HX_HCSTRING("flow","\xee","\x17","\xbe","\x43"),
	HX_HCSTRING("intellect","\x80","\x07","\x6d","\xc9"),
	HX_HCSTRING("damageIn","\x34","\x0a","\x7d","\xcc"),
	HX_HCSTRING("damageOut","\x5f","\x77","\xf0","\x20"),
	HX_HCSTRING("healIn","\x2d","\x03","\x06","\xfd"),
	HX_HCSTRING("healOut","\x46","\x58","\x41","\x68"),
	HX_HCSTRING("critChance","\xee","\xbd","\xbe","\x85"),
	HX_HCSTRING("critDamage","\x69","\xc0","\x30","\xec"),
	HX_HCSTRING("tick","\x5d","\xc3","\xfc","\x4c"),
	HX_HCSTRING("isStunned","\x89","\xd8","\x73","\xba"),
	HX_HCSTRING("isAlive","\x83","\x07","\x17","\xbe"),
	HX_HCSTRING("figureRelation","\x00","\x13","\x9d","\x70"),
	HX_HCSTRING("checkManacost","\x3c","\xa7","\x5b","\x1b"),
	HX_HCSTRING("isPlayer","\xeb","\x86","\x22","\x90"),
	HX_HCSTRING("same","\x66","\x83","\x4d","\x4c"),
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
	__mClass->mName = HX_HCSTRING("battle.Unit","\x9a","\xf5","\xa6","\x53");
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

} // end namespace battle
