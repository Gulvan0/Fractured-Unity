// Generated by Haxe 3.4.7
#ifndef INCLUDED_NoAbility
#define INCLUDED_NoAbility

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
HX_DECLARE_CLASS0(NoAbility)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,MovieClip)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)



class HXCPP_CLASS_ATTRIBUTES NoAbility_obj : public  ::openfl::display::MovieClip_obj
{
	public:
		typedef  ::openfl::display::MovieClip_obj super;
		typedef NoAbility_obj OBJ_;
		NoAbility_obj();

	public:
		enum { _hx_ClassId = 0x017b4fb9 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="NoAbility")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"NoAbility"); }
		static hx::ObjectPtr< NoAbility_obj > __new();
		static hx::ObjectPtr< NoAbility_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~NoAbility_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("NoAbility","\x49","\x03","\x20","\x8d"); }

};


#endif /* INCLUDED_NoAbility */ 
