// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_Unit
#define INCLUDED_battle_Unit

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Element)
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS0(Linear)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,enums,Team)
HX_DECLARE_CLASS2(battle,enums,UnitType)
HX_DECLARE_CLASS2(battle,_hx_struct,BuffQueue)
HX_DECLARE_CLASS2(battle,_hx_struct,FloatPool)
HX_DECLARE_CLASS2(battle,_hx_struct,Pool)
HX_DECLARE_CLASS2(battle,_hx_struct,Wheel)

namespace battle{


class HXCPP_CLASS_ATTRIBUTES Unit_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Unit_obj OBJ_;
		Unit_obj();

	public:
		enum { _hx_ClassId = 0x0e64089c };

		void __construct( ::ID id, ::Element element, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.Unit")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.Unit"); }
		static hx::ObjectPtr< Unit_obj > __new( ::ID id, ::Element element, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams);
		static hx::ObjectPtr< Unit_obj > __alloc(hx::Ctx *_hx_ctx, ::ID id, ::Element element, ::battle::enums::Team team,int position, ::Dynamic params, ::Dynamic subparams);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Unit_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Unit","\xa4","\xf6","\x82","\x38"); }

		 ::ID id;
		::String name;
		 ::Element element;
		 ::battle::enums::Team team;
		int position;
		 ::battle::_hx_struct::Wheel wheel;
		 ::battle::_hx_struct::Pool hpPool;
		 ::battle::_hx_struct::Pool manaPool;
		 ::battle::_hx_struct::FloatPool alacrityPool;
		 ::battle::_hx_struct::BuffQueue buffQueue;
		int strength;
		int flow;
		int intellect;
		 ::Linear damageIn;
		 ::Linear damageOut;
		 ::Linear healIn;
		 ::Linear healOut;
		 ::Linear critChance;
		 ::Linear critDamage;
		void tick();
		::Dynamic tick_dyn();

		bool isStunned();
		::Dynamic isStunned_dyn();

		bool isAlive();
		::Dynamic isAlive_dyn();

		 ::battle::enums::UnitType figureRelation( ::battle::Unit unit);
		::Dynamic figureRelation_dyn();

		bool checkManacost(int abilityNum);
		::Dynamic checkManacost_dyn();

		bool isPlayer();
		::Dynamic isPlayer_dyn();

		bool same( ::battle::Unit unit);
		::Dynamic same_dyn();

};

} // end namespace battle

#endif /* INCLUDED_battle_Unit */ 