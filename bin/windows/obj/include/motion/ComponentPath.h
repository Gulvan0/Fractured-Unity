// Generated by Haxe 3.4.7
#ifndef INCLUDED_motion_ComponentPath
#define INCLUDED_motion_ComponentPath

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_motion_IComponentPath
#include <motion/IComponentPath.h>
#endif
HX_DECLARE_CLASS1(motion,BezierPath)
HX_DECLARE_CLASS1(motion,ComponentPath)
HX_DECLARE_CLASS1(motion,IComponentPath)

namespace motion{


class HXCPP_CLASS_ATTRIBUTES ComponentPath_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef ComponentPath_obj OBJ_;
		ComponentPath_obj();

	public:
		enum { _hx_ClassId = 0x79b0fdc8 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="motion.ComponentPath")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"motion.ComponentPath"); }
		static hx::ObjectPtr< ComponentPath_obj > __new();
		static hx::ObjectPtr< ComponentPath_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~ComponentPath_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("ComponentPath","\xe2","\xf4","\xe2","\x2f"); }

		Float start;
		Float end;
		::Array< ::Dynamic> paths;
		Float totalStrength;
		void addPath( ::motion::BezierPath path);
		::Dynamic addPath_dyn();

		Float calculate(Float k);
		::Dynamic calculate_dyn();

		Float get_end();
		::Dynamic get_end_dyn();

};

} // end namespace motion

#endif /* INCLUDED_motion_ComponentPath */ 
