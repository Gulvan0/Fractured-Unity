// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__internal_symbols_ButtonSymbol
#define INCLUDED_openfl__internal_symbols_ButtonSymbol

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl__internal_symbols_SWFSymbol
#include <openfl/_internal/symbols/SWFSymbol.h>
#endif
HX_DECLARE_CLASS3(openfl,_internal,swf,SWFLite)
HX_DECLARE_CLASS3(openfl,_internal,symbols,ButtonSymbol)
HX_DECLARE_CLASS3(openfl,_internal,symbols,SWFSymbol)
HX_DECLARE_CLASS3(openfl,_internal,symbols,SpriteSymbol)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)

namespace openfl{
namespace _internal{
namespace symbols{


class HXCPP_CLASS_ATTRIBUTES ButtonSymbol_obj : public  ::openfl::_internal::symbols::SWFSymbol_obj
{
	public:
		typedef  ::openfl::_internal::symbols::SWFSymbol_obj super;
		typedef ButtonSymbol_obj OBJ_;
		ButtonSymbol_obj();

	public:
		enum { _hx_ClassId = 0x2b7075fd };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._internal.symbols.ButtonSymbol")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._internal.symbols.ButtonSymbol"); }
		static hx::ObjectPtr< ButtonSymbol_obj > __new();
		static hx::ObjectPtr< ButtonSymbol_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~ButtonSymbol_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("ButtonSymbol","\x0a","\xd3","\xad","\x5e"); }

		 ::openfl::_internal::symbols::SpriteSymbol downState;
		 ::openfl::_internal::symbols::SpriteSymbol hitState;
		 ::openfl::_internal::symbols::SpriteSymbol overState;
		 ::openfl::_internal::symbols::SpriteSymbol upState;
		 ::openfl::display::DisplayObject _hx___createObject( ::openfl::_internal::swf::SWFLite swf);

};

} // end namespace openfl
} // end namespace _internal
} // end namespace symbols

#endif /* INCLUDED_openfl__internal_symbols_ButtonSymbol */ 
