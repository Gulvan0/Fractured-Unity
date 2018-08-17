// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_vision_Common
#define INCLUDED_battle_vision_Common

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
HX_DECLARE_CLASS0(SSprite)
HX_DECLARE_CLASS0(Zone)
HX_DECLARE_CLASS1(battle,EffectHandler)
HX_DECLARE_CLASS1(battle,IModelObserver)
HX_DECLARE_CLASS1(battle,IMutableModel)
HX_DECLARE_CLASS1(battle,IObservableModel)
HX_DECLARE_CLASS1(battle,ISimpleModel)
HX_DECLARE_CLASS1(battle,Model)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,_hx_struct,UPair)
HX_DECLARE_CLASS2(battle,vision,AbilityBar)
HX_DECLARE_CLASS2(battle,vision,Common)
HX_DECLARE_CLASS2(battle,vision,UnitStateBar)
HX_DECLARE_CLASS2(battle,vision,UnitsAndBolts)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,KeyboardEvent)
HX_DECLARE_CLASS2(openfl,events,MouseEvent)

namespace battle{
namespace vision{


class HXCPP_CLASS_ATTRIBUTES Common_obj : public  ::SSprite_obj
{
	public:
		typedef  ::SSprite_obj super;
		typedef Common_obj OBJ_;
		Common_obj();

	public:
		enum { _hx_ClassId = 0x12db1feb };

		void __construct( ::Zone zone,::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies, ::battle::Model model);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.vision.Common")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.vision.Common"); }
		static hx::ObjectPtr< Common_obj > __new( ::Zone zone,::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies, ::battle::Model model);
		static hx::ObjectPtr< Common_obj > __alloc(hx::Ctx *_hx_ctx, ::Zone zone,::Array< ::Dynamic> allies,::Array< ::Dynamic> enemies, ::battle::Model model);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Common_obj();

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
		::String __ToString() const { return HX_HCSTRING("Common","\x4b","\xe9","\xc2","\xfb"); }

		static void __boot();
		static bool shiftKey;
		static Float ABILITYBARH;
		static Float ABILITYBARX;
		static Float ABILITYBARY;
		static Float STATEBARX;
		static Float STATEBARY;
		 ::battle::Model model;
		 ::openfl::display::DisplayObject bg;
		 ::battle::vision::UnitStateBar stateBar;
		 ::battle::vision::AbilityBar abilityBar;
		 ::battle::vision::UnitsAndBolts objects;
		 ::battle::EffectHandler effectHandler;
		void keyUpHandler( ::openfl::events::KeyboardEvent e);
		::Dynamic keyUpHandler_dyn();

		void keyHandler( ::openfl::events::KeyboardEvent e);
		::Dynamic keyHandler_dyn();

		void clickHandler( ::openfl::events::MouseEvent e);
		::Dynamic clickHandler_dyn();

		void init( ::battle::_hx_struct::UPair pair);
		::Dynamic init_dyn();

};

} // end namespace battle
} // end namespace vision

#endif /* INCLUDED_battle_vision_Common */ 