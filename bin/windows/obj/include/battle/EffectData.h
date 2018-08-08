// Generated by Haxe 3.4.7
#ifndef INCLUDED_battle_EffectData
#define INCLUDED_battle_EffectData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Element)
HX_DECLARE_CLASS1(battle,EffectData)
HX_DECLARE_CLASS1(battle,Unit)
HX_DECLARE_CLASS2(battle,enums,Source)

namespace battle{


class HXCPP_CLASS_ATTRIBUTES EffectData_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef EffectData_obj OBJ_;
		EffectData_obj();

	public:
		enum { _hx_ClassId = 0x7de1e0bf };

		void __construct( ::battle::Unit target, ::battle::Unit caster, ::Dynamic delta, ::Element element, ::battle::enums::Source source);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="battle.EffectData")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"battle.EffectData"); }
		static hx::ObjectPtr< EffectData_obj > __new( ::battle::Unit target, ::battle::Unit caster, ::Dynamic delta, ::Element element, ::battle::enums::Source source);
		static hx::ObjectPtr< EffectData_obj > __alloc(hx::Ctx *_hx_ctx, ::battle::Unit target, ::battle::Unit caster, ::Dynamic delta, ::Element element, ::battle::enums::Source source);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~EffectData_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("EffectData","\x7b","\xfd","\x5f","\x9f"); }

		 ::battle::Unit target;
		 ::battle::Unit caster;
		 ::Dynamic delta;
		 ::Element element;
		 ::battle::enums::Source source;
};

} // end namespace battle

#endif /* INCLUDED_battle_EffectData */ 
