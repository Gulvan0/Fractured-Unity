// Generated by Haxe 3.4.7
#ifndef INCLUDED_lime_text_unifill_InternalEncoding
#define INCLUDED_lime_text_unifill_InternalEncoding

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(lime,text,unifill,InternalEncoding)

namespace lime{
namespace text{
namespace unifill{


class HXCPP_CLASS_ATTRIBUTES InternalEncoding_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef InternalEncoding_obj OBJ_;
		InternalEncoding_obj();

	public:
		enum { _hx_ClassId = 0x6403309d };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="lime.text.unifill.InternalEncoding")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"lime.text.unifill.InternalEncoding"); }

		hx::ObjectPtr< InternalEncoding_obj > __new() {
			hx::ObjectPtr< InternalEncoding_obj > __this = new InternalEncoding_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< InternalEncoding_obj > __alloc(hx::Ctx *_hx_ctx) {
			InternalEncoding_obj *__this = (InternalEncoding_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(InternalEncoding_obj), false, "lime.text.unifill.InternalEncoding"));
			*(void **)__this = InternalEncoding_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~InternalEncoding_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("InternalEncoding","\x50","\x91","\x40","\x17"); }

		static ::String get_internalEncoding();
		static ::Dynamic get_internalEncoding_dyn();

		static int codeUnitAt(::String s,int index);
		static ::Dynamic codeUnitAt_dyn();

		static int codePointAt(::String s,int index);
		static ::Dynamic codePointAt_dyn();

		static ::String charAt(::String s,int index);
		static ::Dynamic charAt_dyn();

		static int codePointCount(::String s,int beginIndex,int endIndex);
		static ::Dynamic codePointCount_dyn();

		static int codePointWidthAt(::String s,int index);
		static ::Dynamic codePointWidthAt_dyn();

		static int codePointWidthBefore(::String s,int index);
		static ::Dynamic codePointWidthBefore_dyn();

		static int offsetByCodePoints(::String s,int index,int codePointOffset);
		static ::Dynamic offsetByCodePoints_dyn();

		static int backwardOffsetByCodePoints(::String s,int index,int codePointOffset);
		static ::Dynamic backwardOffsetByCodePoints_dyn();

		static ::String fromCodePoint(int codePoint);
		static ::Dynamic fromCodePoint_dyn();

		static ::String fromCodePoints( ::Dynamic codePoints);
		static ::Dynamic fromCodePoints_dyn();

		static void validate(::String s);
		static ::Dynamic validate_dyn();

		static bool isValidString(::String s);
		static ::Dynamic isValidString_dyn();

		static void encodeWith( ::Dynamic f,int c);
		static ::Dynamic encodeWith_dyn();

};

} // end namespace lime
} // end namespace text
} // end namespace unifill

#endif /* INCLUDED_lime_text_unifill_InternalEncoding */ 
