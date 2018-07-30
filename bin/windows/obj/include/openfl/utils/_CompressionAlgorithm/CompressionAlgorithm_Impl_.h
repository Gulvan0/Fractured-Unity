// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl_utils__CompressionAlgorithm_CompressionAlgorithm_Impl_
#define INCLUDED_openfl_utils__CompressionAlgorithm_CompressionAlgorithm_Impl_

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,utils,_CompressionAlgorithm,CompressionAlgorithm_Impl_)

namespace openfl{
namespace utils{
namespace _CompressionAlgorithm{


class HXCPP_CLASS_ATTRIBUTES CompressionAlgorithm_Impl__obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef CompressionAlgorithm_Impl__obj OBJ_;
		CompressionAlgorithm_Impl__obj();

	public:
		enum { _hx_ClassId = 0x648bae90 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="openfl.utils._CompressionAlgorithm.CompressionAlgorithm_Impl_")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"openfl.utils._CompressionAlgorithm.CompressionAlgorithm_Impl_"); }

		hx::ObjectPtr< CompressionAlgorithm_Impl__obj > __new() {
			hx::ObjectPtr< CompressionAlgorithm_Impl__obj > __this = new CompressionAlgorithm_Impl__obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< CompressionAlgorithm_Impl__obj > __alloc(hx::Ctx *_hx_ctx) {
			CompressionAlgorithm_Impl__obj *__this = (CompressionAlgorithm_Impl__obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(CompressionAlgorithm_Impl__obj), false, "openfl.utils._CompressionAlgorithm.CompressionAlgorithm_Impl_"));
			*(void **)__this = CompressionAlgorithm_Impl__obj::_hx_vtable;
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~CompressionAlgorithm_Impl__obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("CompressionAlgorithm_Impl_","\xa9","\x3d","\x59","\x0e"); }

		static void __boot();
		static  ::Dynamic DEFLATE;
		static  ::Dynamic LZMA;
		static  ::Dynamic ZLIB;
		static  ::Dynamic fromString(::String value);
		static ::Dynamic fromString_dyn();

		static ::String toString(int value);
		static ::Dynamic toString_dyn();

};

} // end namespace openfl
} // end namespace utils
} // end namespace _CompressionAlgorithm

#endif /* INCLUDED_openfl_utils__CompressionAlgorithm_CompressionAlgorithm_Impl_ */ 
