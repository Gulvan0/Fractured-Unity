// Generated by Haxe 3.4.7
#ifndef INCLUDED_hxassert_Assert
#define INCLUDED_hxassert_Assert

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(hxassert,Assert)
HX_DECLARE_CLASS1(hxassert,AssertionFailureError)

namespace hxassert{


class HXCPP_CLASS_ATTRIBUTES Assert_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef Assert_obj OBJ_;
		Assert_obj();

	public:
		enum { _hx_ClassId = 0x53d6917c };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="hxassert.Assert")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"hxassert.Assert"); }

		hx::ObjectPtr< Assert_obj > __new() {
			hx::ObjectPtr< Assert_obj > __this = new Assert_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< Assert_obj > __alloc(hx::Ctx *_hx_ctx) {
			Assert_obj *__this = (Assert_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Assert_obj), false, "hxassert.Assert"));
			*(void **)__this = Assert_obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Assert_obj();

		HX_DO_RTTI_ALL;
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Assert","\xe6","\xba","\x97","\x80"); }

		static void __boot();
		static  ::Dynamic on( ::Dynamic handler);

		static void fail(::String reason, ::Dynamic position);

		static void throwError( ::hxassert::AssertionFailureError error);

		static void throwAssertionFailureError(::Array< ::String > messages, ::Dynamic position);

		static ::Array< ::Dynamic> _handlers;
};

} // end namespace hxassert

#endif /* INCLUDED_hxassert_Assert */ 
