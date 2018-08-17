// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_Passive
#define INCLUDED_battle_Passive

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_battle_Ability
#include <battle/Ability.h>
#endif
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS1(battle,Ability)
HX_DECLARE_CLASS1(battle,Passive)
HX_DECLARE_CLASS2(battle,data,BattleEvent)

namespace battle{


class HXCPP_CLASS_ATTRIBUTES Passive_obj : public  ::battle::Ability_obj
{
	public:
		typedef  ::battle::Ability_obj super;
		typedef Passive_obj OBJ_;
		Passive_obj();

	public:
		enum { _hx_ClassId = 0x7807e88f };

		void __construct( ::ID id);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.Passive")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.Passive"); }
		static hx::ObjectPtr< Passive_obj > __new( ::ID id);
		static hx::ObjectPtr< Passive_obj > __alloc(hx::Ctx *_hx_ctx, ::ID id);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Passive_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Passive","\x87","\x6f","\xbb","\x4a"); }

		::Array< ::Dynamic> triggers;
		bool reactsTo( ::battle::data::BattleEvent event);
		::Dynamic reactsTo_dyn();

};

} // end namespace battle

#endif /* INCLUDED_battle_Passive */ 