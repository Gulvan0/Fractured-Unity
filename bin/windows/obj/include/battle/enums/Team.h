// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_enums_Team
#define INCLUDED_battle_enums_Team

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(battle,enums,Team)
namespace battle{
namespace enums{


class Team_obj : public hx::EnumBase_obj
{
	typedef hx::EnumBase_obj super;
		typedef Team_obj OBJ_;

	public:
		Team_obj() {};
		HX_DO_ENUM_RTTI;
		static void __boot();
		static void __register();
		static bool __GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp);
		::String GetEnumName( ) const { return HX_HCSTRING("battle.enums.Team","\xcf","\xcf","\xf0","\xe1"); }
		::String __ToString() const { return HX_HCSTRING("Team.","\xd1","\x40","\xb5","\xa0") + _hx_tag; }

		static ::battle::enums::Team Left;
		static inline ::battle::enums::Team Left_dyn() { return Left; }
		static ::battle::enums::Team Right;
		static inline ::battle::enums::Team Right_dyn() { return Right; }
};

} // end namespace battle
} // end namespace enums

#endif /* INCLUDED_battle_enums_Team */ 
