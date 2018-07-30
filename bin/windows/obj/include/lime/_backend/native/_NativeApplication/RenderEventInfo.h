// Generated by Haxe 3.4.7
#ifndef INCLUDED_lime__backend_native__NativeApplication_RenderEventInfo
#define INCLUDED_lime__backend_native__NativeApplication_RenderEventInfo

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS4(lime,_backend,native,_NativeApplication,RenderEventInfo)
HX_DECLARE_CLASS2(lime,graphics,RenderContext)

namespace lime{
namespace _backend{
namespace native{
namespace _NativeApplication{


class HXCPP_CLASS_ATTRIBUTES RenderEventInfo_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef RenderEventInfo_obj OBJ_;
		RenderEventInfo_obj();

	public:
		enum { _hx_ClassId = 0x1799b38f };

		void __construct( ::Dynamic type, ::lime::graphics::RenderContext context);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="lime._backend.native._NativeApplication.RenderEventInfo")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"lime._backend.native._NativeApplication.RenderEventInfo"); }
		static hx::ObjectPtr< RenderEventInfo_obj > __new( ::Dynamic type, ::lime::graphics::RenderContext context);
		static hx::ObjectPtr< RenderEventInfo_obj > __alloc(hx::Ctx *_hx_ctx, ::Dynamic type, ::lime::graphics::RenderContext context);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~RenderEventInfo_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("RenderEventInfo","\x52","\xa3","\xfc","\x3d"); }

		 ::lime::graphics::RenderContext context;
		int type;
		 ::lime::_backend::native::_NativeApplication::RenderEventInfo clone();
		::Dynamic clone_dyn();

};

} // end namespace lime
} // end namespace _backend
} // end namespace native
} // end namespace _NativeApplication

#endif /* INCLUDED_lime__backend_native__NativeApplication_RenderEventInfo */ 
