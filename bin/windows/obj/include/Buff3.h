// Generated by Haxe 3.4.7
#ifndef INCLUDED_Buff3
#define INCLUDED_Buff3

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
HX_DECLARE_CLASS0(Buff3)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,MovieClip)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)



class HXCPP_CLASS_ATTRIBUTES Buff3_obj : public  ::openfl::display::MovieClip_obj
{
	public:
		typedef  ::openfl::display::MovieClip_obj super;
		typedef Buff3_obj OBJ_;
		Buff3_obj();

	public:
		enum { _hx_ClassId = 0x4e15fee0 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="Buff3")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"Buff3"); }
		static hx::ObjectPtr< Buff3_obj > __new();
		static hx::ObjectPtr< Buff3_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Buff3_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Buff3","\xe0","\xfe","\x15","\x4e"); }

};


#endif /* INCLUDED_Buff3 */ 
