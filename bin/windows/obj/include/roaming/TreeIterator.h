// Generated by Haxe 3.4.7
#ifndef INCLUDED_roaming_TreeIterator
#define INCLUDED_roaming_TreeIterator

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(roaming,Ability)
HX_DECLARE_CLASS1(roaming,Tree)
HX_DECLARE_CLASS1(roaming,TreeAbility)
HX_DECLARE_CLASS1(roaming,TreeIterator)

namespace roaming{


class HXCPP_CLASS_ATTRIBUTES TreeIterator_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef TreeIterator_obj OBJ_;
		TreeIterator_obj();

	public:
		enum { _hx_ClassId = 0x403b62dd };

		void __construct( ::roaming::Tree tree);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="roaming.TreeIterator")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"roaming.TreeIterator"); }
		static hx::ObjectPtr< TreeIterator_obj > __new( ::roaming::Tree tree);
		static hx::ObjectPtr< TreeIterator_obj > __alloc(hx::Ctx *_hx_ctx, ::roaming::Tree tree);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~TreeIterator_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("TreeIterator","\x8c","\x79","\xc7","\x79"); }

		 ::roaming::Tree tree;
		int width;
		int height;
		int i;
		int j;
		bool hasNext();
		::Dynamic hasNext_dyn();

		 ::roaming::TreeAbility next();
		::Dynamic next_dyn();

};

} // end namespace roaming

#endif /* INCLUDED_roaming_TreeIterator */ 
