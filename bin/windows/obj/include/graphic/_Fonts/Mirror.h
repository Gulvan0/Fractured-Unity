// Generated by Haxe 3.4.7
#ifndef INCLUDED_graphic__Fonts_Mirror
#define INCLUDED_graphic__Fonts_Mirror

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_text_Font
#include <openfl/text/Font.h>
#endif
HX_DECLARE_CLASS2(graphic,_Fonts,Mirror)
HX_DECLARE_CLASS2(lime,text,Font)
HX_DECLARE_CLASS2(openfl,text,Font)

namespace graphic{
namespace _Fonts{


class HXCPP_CLASS_ATTRIBUTES Mirror_obj : public  ::openfl::text::Font_obj
{
	public:
		typedef  ::openfl::text::Font_obj super;
		typedef Mirror_obj OBJ_;
		Mirror_obj();

	public:
		enum { _hx_ClassId = 0x05d13e88 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="graphic._Fonts.Mirror")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"graphic._Fonts.Mirror"); }
		static hx::ObjectPtr< Mirror_obj > __new();
		static hx::ObjectPtr< Mirror_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Mirror_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Mirror","\x5f","\xe6","\x3e","\x8a"); }

		static void __boot();
		static ::String resourceName;
};

} // end namespace graphic
} // end namespace _Fonts

#endif /* INCLUDED_graphic__Fonts_Mirror */ 
