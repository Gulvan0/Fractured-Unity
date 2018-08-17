// Generated by Haxe 3.4.7
#ifndef INCLUDED_roaming_screens_Canvas
#define INCLUDED_roaming_screens_Canvas

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_roaming_screens_ICanvas
#include <roaming/screens/ICanvas.h>
#endif
HX_DECLARE_CLASS0(SSprite)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(roaming,screens,Canvas)
HX_DECLARE_CLASS2(roaming,screens,ICanvas)
HX_DECLARE_CLASS2(roaming,screens,IScreen)
HX_DECLARE_CLASS2(roaming,screens,Screen)

namespace roaming{
namespace screens{


class HXCPP_CLASS_ATTRIBUTES Canvas_obj : public  ::SSprite_obj
{
	public:
		typedef  ::SSprite_obj super;
		typedef Canvas_obj OBJ_;
		Canvas_obj();

	public:
		enum { _hx_ClassId = 0x6ca994c6 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="roaming.screens.Canvas")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"roaming.screens.Canvas"); }
		static hx::ObjectPtr< Canvas_obj > __new();
		static hx::ObjectPtr< Canvas_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Canvas_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("Canvas","\xf8","\xc8","\xd6","\xec"); }

		::Dynamic screen;
		void switchTo( ::roaming::screens::Screen screen);
		::Dynamic switchTo_dyn();

		void init( ::roaming::screens::Screen startingScreen);
		::Dynamic init_dyn();

};

} // end namespace roaming
} // end namespace screens

#endif /* INCLUDED_roaming_screens_Canvas */ 