// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_Active
#define INCLUDED_battle_Active

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_battle_Ability
#include <battle/Ability.h>
#endif
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS1(battle,Ability)
HX_DECLARE_CLASS1(battle,Active)
HX_DECLARE_CLASS2(battle,enums,AbilityTarget)
HX_DECLARE_CLASS2(battle,enums,StrikeType)
HX_DECLARE_CLASS2(battle,enums,UnitType)
HX_DECLARE_CLASS2(battle,_hx_struct,Countdown)

namespace battle{


class HXCPP_CLASS_ATTRIBUTES Active_obj : public  ::battle::Ability_obj
{
	public:
		typedef  ::battle::Ability_obj super;
		typedef Active_obj OBJ_;
		Active_obj();

	public:
		enum { _hx_ClassId = 0x289e35de };

		void __construct( ::ID id);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.Active")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.Active"); }
		static hx::ObjectPtr< Active_obj > __new( ::ID id);
		static hx::ObjectPtr< Active_obj > __alloc(hx::Ctx *_hx_ctx, ::ID id);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Active_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Active","\xe6","\xb5","\xda","\x4a"); }

		 ::battle::enums::StrikeType strikeType;
		 ::battle::enums::AbilityTarget possibleTarget;
		bool aoe;
		 ::battle::_hx_struct::Countdown _cooldown;
		int cooldown;
		int maxCooldown;
		int manacost;
		void putOnCooldown();
		::Dynamic putOnCooldown_dyn();

		void tick();
		::Dynamic tick_dyn();

		bool checkOnCooldown();
		::Dynamic checkOnCooldown_dyn();

		bool checkValidity( ::battle::enums::UnitType relation);
		::Dynamic checkValidity_dyn();

		int get_cooldown();
		::Dynamic get_cooldown_dyn();

		int get_maxCooldown();
		::Dynamic get_maxCooldown_dyn();

};

} // end namespace battle

#endif /* INCLUDED_battle_Active */ 
