// Generated by Haxe 3.4.7
#ifndef INCLUDED_motion_LinearPath
#define INCLUDED_motion_LinearPath

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_motion_BezierPath
#include <motion/BezierPath.h>
#endif
HX_DECLARE_STACK_FRAME(_hx_pos_d9fc247df9f32b0a_228_new)
HX_DECLARE_CLASS1(motion,BezierPath)
HX_DECLARE_CLASS1(motion,LinearPath)

namespace motion{


class HXCPP_CLASS_ATTRIBUTES LinearPath_obj : public  ::motion::BezierPath_obj
{
	public:
		typedef  ::motion::BezierPath_obj super;
		typedef LinearPath_obj OBJ_;
		LinearPath_obj();

	public:
		enum { _hx_ClassId = 0x7aeb41fc };

		void __construct(Float end,Float strength);
		inline void *operator new(size_t inSize, bool inContainer=false,const char *inName="motion.LinearPath")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,false,"motion.LinearPath"); }

		hx::ObjectPtr< LinearPath_obj > __new(Float end,Float strength) {
			hx::ObjectPtr< LinearPath_obj > __this = new LinearPath_obj();
			__this->__construct(end,strength);
			return __this;
		}

		static hx::ObjectPtr< LinearPath_obj > __alloc(hx::Ctx *_hx_ctx,Float end,Float strength) {
			LinearPath_obj *__this = (LinearPath_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(LinearPath_obj), false, "motion.LinearPath"));
			*(void **)__this = LinearPath_obj::_hx_vtable;
{
            	HX_STACKFRAME(&_hx_pos_d9fc247df9f32b0a_228_new)
HXDLIN( 228)		__this->super::__construct(end,(int)0,strength);
            	}
		
			return __this;
		}

		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~LinearPath_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static void __register();
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("LinearPath","\x4a","\xbe","\x3b","\x38"); }

		Float calculate(Float start,Float k);

};

} // end namespace motion

#endif /* INCLUDED_motion_LinearPath */ 