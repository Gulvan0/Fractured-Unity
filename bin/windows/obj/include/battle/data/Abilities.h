// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_data_Abilities
#define INCLUDED_battle_data_Abilities

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Element)
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS1(battle,IMutableModel)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,data,Abilities)
HX_DECLARE_CLASS2(battle,_hx_struct,UnitCoords)

namespace battle{
namespace data{


class HXCPP_CLASS_ATTRIBUTES Abilities_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Abilities_obj OBJ_;
		Abilities_obj();

	public:
		enum { _hx_ClassId = 0x04bfdce2 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="battle.data.Abilities")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"battle.data.Abilities"); }

		hx::ObjectPtr< Abilities_obj > __new() {
			hx::ObjectPtr< Abilities_obj > __this = new Abilities_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< Abilities_obj > __alloc(hx::Ctx *_hx_ctx) {
			Abilities_obj *__this = (Abilities_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Abilities_obj), false, "battle.data.Abilities"));
			*(void **)__this = Abilities_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Abilities_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Abilities","\x68","\xb4","\x83","\x73"); }

		static void __boot();
		static ::Dynamic model;
		static bool flag;
		static  ::battle::Unit target;
		static  ::battle::Unit caster;
		static  ::Element element;
		static void init(::Dynamic m);
		static ::Dynamic init_dyn();

		static void useAbility( ::ID id, ::battle::_hx_struct::UnitCoords targetCoords, ::battle::_hx_struct::UnitCoords casterCoords, ::Element e);
		static ::Dynamic useAbility_dyn();

		static void shockTherapy();
		static ::Dynamic shockTherapy_dyn();

		static void highVoltage();
		static ::Dynamic highVoltage_dyn();

		static void electricalStorm();
		static ::Dynamic electricalStorm_dyn();

		static void charge();
		static ::Dynamic charge_dyn();

		static void lightningBolt();
		static ::Dynamic lightningBolt_dyn();

		static void voltSnare();
		static ::Dynamic voltSnare_dyn();

		static void energize();
		static ::Dynamic energize_dyn();

		static void disrupt();
		static ::Dynamic disrupt_dyn();

		static void arcFlash();
		static ::Dynamic arcFlash_dyn();

		static void empBlast();
		static ::Dynamic empBlast_dyn();

		static void ghostStrike();
		static ::Dynamic ghostStrike_dyn();

		static void stub();
		static ::Dynamic stub_dyn();

};

} // end namespace battle
} // end namespace data

#endif /* INCLUDED_battle_data_Abilities */ 