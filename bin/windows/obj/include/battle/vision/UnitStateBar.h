// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_vision_UnitStateBar
#define INCLUDED_battle_vision_UnitStateBar

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_battle_IModelObserver
#include <battle/IModelObserver.h>
#endif
HX_DECLARE_CLASS0(Element)
HX_DECLARE_CLASS0(ID)
HX_DECLARE_CLASS0(SSprite)
HX_DECLARE_CLASS1(battle,Buff)
HX_DECLARE_CLASS1(battle,IModelObserver)
HX_DECLARE_CLASS1(battle,IObservableModel)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,enums,Source)
HX_DECLARE_CLASS2(battle,enums,StrikeType)
HX_DECLARE_CLASS2(battle,enums,Team)
HX_DECLARE_CLASS2(battle,_hx_struct,UPair)
HX_DECLARE_CLASS2(battle,_hx_struct,UnitCoords)
HX_DECLARE_CLASS2(battle,vision,BarType)
HX_DECLARE_CLASS2(battle,vision,TextfieldType)
HX_DECLARE_CLASS2(battle,vision,UnitStateBar)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,text,TextField)

namespace battle{
namespace vision{


class HXCPP_CLASS_ATTRIBUTES UnitStateBar_obj : public  ::SSprite_obj
{
	public:
		typedef  ::SSprite_obj super;
		typedef UnitStateBar_obj OBJ_;
		UnitStateBar_obj();

	public:
		enum { _hx_ClassId = 0x2e1d480a };

		void __construct(::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies,::Dynamic model);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.vision.UnitStateBar")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.vision.UnitStateBar"); }
		static hx::ObjectPtr< UnitStateBar_obj > __new(::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies,::Dynamic model);
		static hx::ObjectPtr< UnitStateBar_obj > __alloc(hx::Ctx *_hx_ctx,::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies,::Dynamic model);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~UnitStateBar_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("UnitStateBar","\x06","\x4b","\x33","\xe1"); }

		static void __boot();
		static Float xPos;
		static Float yPos;
		static Float XMAINOFFSET;
		static Float BARW;
		static Float BARH;
		static Float BARBOXW;
		static Float BARBOXH;
		static Float BUFFW;
		static Float BUFFH;
		static Float BUFFOFFSET;
		static Float MAINY(int pos);
		static ::Dynamic MAINY_dyn();

		static Float BARX( ::battle::enums::Team team);
		static ::Dynamic BARX_dyn();

		static Float BARBOXX( ::battle::enums::Team team);
		static ::Dynamic BARBOXX_dyn();

		static Float TEXTFIELDX( ::battle::enums::Team team, ::battle::vision::TextfieldType type);
		static ::Dynamic TEXTFIELDX_dyn();

		static Float TEXTFIELDY(int pos, ::battle::vision::TextfieldType type);
		static ::Dynamic TEXTFIELDY_dyn();

		static Float TEXTFIELDW( ::battle::vision::TextfieldType type);
		static ::Dynamic TEXTFIELDW_dyn();

		static Float BARY(int pos, ::battle::vision::BarType type);
		static ::Dynamic BARY_dyn();

		static Float BUFFX( ::battle::enums::Team team,int n);
		static ::Dynamic BUFFX_dyn();

		static Float BUFFY(int pos);
		static ::Dynamic BUFFY_dyn();

		::Dynamic model;
		 ::openfl::display::DisplayObject upperBar;
		 ::battle::_hx_struct::UPair names;
		 ::battle::_hx_struct::UPair boxes;
		 ::battle::_hx_struct::UPair HPbars;
		 ::battle::_hx_struct::UPair HPs;
		 ::battle::_hx_struct::UPair manas;
		 ::battle::_hx_struct::UPair manaBars;
		 ::battle::_hx_struct::UPair buffs;
		void init( ::battle::_hx_struct::UPair pair);
		::Dynamic init_dyn();

		 ::openfl::text::TextField createTF( ::battle::Unit unit, ::battle::vision::TextfieldType type);
		::Dynamic createTF_dyn();

		void hpUpdate( ::battle::Unit target,int dhp, ::Element element,bool crit, ::battle::enums::Source source);
		::Dynamic hpUpdate_dyn();

		void manaUpdate( ::battle::Unit target,int dmana, ::battle::enums::Source source);
		::Dynamic manaUpdate_dyn();

		void alacUpdate( ::battle::Unit unit,Float dalac, ::battle::enums::Source source);
		::Dynamic alacUpdate_dyn();

		void buffQueueUpdate( ::battle::_hx_struct::UnitCoords unit,::Array< ::Dynamic> queue);
		::Dynamic buffQueueUpdate_dyn();

		void preTick( ::battle::Unit current);
		::Dynamic preTick_dyn();

		void tick( ::battle::Unit current);
		::Dynamic tick_dyn();

		void miss( ::battle::_hx_struct::UnitCoords target, ::Element element);
		::Dynamic miss_dyn();

		void death( ::battle::_hx_struct::UnitCoords unit);
		::Dynamic death_dyn();

		void abSelected(int num);
		::Dynamic abSelected_dyn();

		void abDeselected(int num);
		::Dynamic abDeselected_dyn();

		void abThrown( ::battle::_hx_struct::UnitCoords target, ::battle::_hx_struct::UnitCoords caster, ::ID id, ::battle::enums::StrikeType type, ::Element element);
		::Dynamic abThrown_dyn();

		void abStriked( ::battle::_hx_struct::UnitCoords target, ::battle::_hx_struct::UnitCoords caster, ::ID id, ::battle::enums::StrikeType type, ::Element element);
		::Dynamic abStriked_dyn();

		void warn(::String text);
		::Dynamic warn_dyn();

};

} // end namespace battle
} // end namespace vision

#endif /* INCLUDED_battle_vision_UnitStateBar */ 
