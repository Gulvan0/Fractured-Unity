// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_data_BattleEvent
#define INCLUDED_battle_data_BattleEvent

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(battle,data,BattleEvent)
namespace battle{
namespace data{


class BattleEvent_obj : public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef BattleEvent_obj OBJ_;

	public:
		BattleEvent_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_HCSTRING("battle.data.BattleEvent","\x54","\x57","\x02","\x0a"); }
		::String __ToString() const { return HX_HCSTRING("BattleEvent.","\x4c","\x8e","\x01","\xd3") + _hx_tag; }

		static ::battle::data::BattleEvent AlacUpdate;
		static inline ::battle::data::BattleEvent AlacUpdate_dyn() { return AlacUpdate; }
		static ::battle::data::BattleEvent Crit;
		static inline ::battle::data::BattleEvent Crit_dyn() { return Crit; }
		static ::battle::data::BattleEvent Death;
		static inline ::battle::data::BattleEvent Death_dyn() { return Death; }
		static ::battle::data::BattleEvent HPUpdate;
		static inline ::battle::data::BattleEvent HPUpdate_dyn() { return HPUpdate; }
		static ::battle::data::BattleEvent ManaUpdate;
		static inline ::battle::data::BattleEvent ManaUpdate_dyn() { return ManaUpdate; }
		static ::battle::data::BattleEvent Miss;
		static inline ::battle::data::BattleEvent Miss_dyn() { return Miss; }
		static ::battle::data::BattleEvent Strike;
		static inline ::battle::data::BattleEvent Strike_dyn() { return Strike; }
		static ::battle::data::BattleEvent Throw;
		static inline ::battle::data::BattleEvent Throw_dyn() { return Throw; }
		static ::battle::data::BattleEvent Tick;
		static inline ::battle::data::BattleEvent Tick_dyn() { return Tick; }
};

} // end namespace battle
} // end namespace data

#endif /* INCLUDED_battle_data_BattleEvent */ 
