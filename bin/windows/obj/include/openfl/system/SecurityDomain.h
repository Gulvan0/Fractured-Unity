// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl_system_SecurityDomain
#define INCLUDED_openfl_system_SecurityDomain

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_STACK_FRAME(_hx_pos_708c5fba9d37bf54_16_new)
HX_DECLARE_CLASS2(openfl,_hx_system,SecurityDomain)

namespace openfl{
namespace _hx_system{


class HXCPP_CLASS_ATTRIBUTES SecurityDomain_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef SecurityDomain_obj OBJ_;
		SecurityDomain_obj();

	public:
		enum { _hx_ClassId = 0x0be6b06f };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="openfl.system.SecurityDomain")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"openfl.system.SecurityDomain"); }

		hx::ObjectPtr< SecurityDomain_obj > __new() {
			hx::ObjectPtr< SecurityDomain_obj > __this = new SecurityDomain_obj();
			__this->__construct();
			return __this;
		}

		static hx::ObjectPtr< SecurityDomain_obj > __alloc(hx::Ctx *_hx_ctx) {
			SecurityDomain_obj *__this = (SecurityDomain_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(SecurityDomain_obj), false, "openfl.system.SecurityDomain"));
			*(void **)__this = SecurityDomain_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_708c5fba9d37bf54_16_new)
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SecurityDomain_obj();

		HX_DO_RTTI_ALL;
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("SecurityDomain","\x44","\x64","\x95","\x10"); }

		static void __boot();
		static  ::openfl::_hx_system::SecurityDomain currentDomain;
};

} // end namespace openfl
} // end namespace system

#endif /* INCLUDED_openfl_system_SecurityDomain */ 
