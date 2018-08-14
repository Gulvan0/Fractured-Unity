// Generated by Haxe 3.4.7
#ifndef INCLUDED_roaming_screens_SRoaming
#define INCLUDED_roaming_screens_SRoaming

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_roaming_screens_IScreen
#include <roaming/screens/IScreen.h>
#endif
HX_DECLARE_CLASS0(SSprite)
HX_DECLARE_CLASS0(Zone)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,MovieClip)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,MouseEvent)
HX_DECLARE_CLASS2(openfl,geom,Point)
HX_DECLARE_CLASS2(roaming,screens,ICanvas)
HX_DECLARE_CLASS2(roaming,screens,IScreen)
HX_DECLARE_CLASS2(roaming,screens,SRoaming)

namespace roaming{
namespace screens{


class HXCPP_CLASS_ATTRIBUTES SRoaming_obj : public  ::SSprite_obj
{
	public:
		typedef  ::SSprite_obj super;
		typedef SRoaming_obj OBJ_;
		SRoaming_obj();

	public:
		enum { _hx_ClassId = 0x14f84e00 };

		void __construct(::Dynamic canvas);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="roaming.screens.SRoaming")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"roaming.screens.SRoaming"); }
		static hx::ObjectPtr< SRoaming_obj > __new(::Dynamic canvas);
		static hx::ObjectPtr< SRoaming_obj > __alloc(hx::Ctx *_hx_ctx,::Dynamic canvas);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SRoaming_obj();

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
		::String __ToString() const { return HX_HCSTRING("SRoaming","\x86","\xaa","\x12","\x61"); }

		static void __boot();
		static  ::openfl::geom::Point abScrBtn;
		static Float bgX( ::Zone zone);
		static ::Dynamic bgX_dyn();

		static Float bgY( ::Zone zone);
		static ::Dynamic bgY_dyn();

		static Float arrowX( ::Zone zone);
		static ::Dynamic arrowX_dyn();

		static Float arrowY( ::Zone zone);
		static ::Dynamic arrowY_dyn();

		::Dynamic canvas;
		 ::openfl::display::MovieClip background;
		 ::openfl::display::MovieClip nextBattle;
		 ::openfl::display::MovieClip abilityScreenBtn;
		void abScreenRequest( ::openfl::events::MouseEvent e);
		::Dynamic abScreenRequest_dyn();

		void init();
		::Dynamic init_dyn();

};

} // end namespace roaming
} // end namespace screens

#endif /* INCLUDED_roaming_screens_SRoaming */ 
