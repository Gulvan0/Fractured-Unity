// Generated by Haxe 3.4.7
#ifndef INCLUDED_Ghost
#define INCLUDED_Ghost

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
HX_DECLARE_CLASS0(Ghost)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,MovieClip)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)



class HXCPP_CLASS_ATTRIBUTES Ghost_obj : public  ::openfl::display::MovieClip_obj
{
	public:
		typedef  ::openfl::display::MovieClip_obj super;
		typedef Ghost_obj OBJ_;
		Ghost_obj();

	public:
		enum { _hx_ClassId = 0x2685ff2f };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="Ghost")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"Ghost"); }
		static hx::ObjectPtr< Ghost_obj > __new();
		static hx::ObjectPtr< Ghost_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Ghost_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Ghost","\x2f","\xff","\x85","\x26"); }

};


#endif /* INCLUDED_Ghost */ 
