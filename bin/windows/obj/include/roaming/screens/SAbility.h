// Generated by Haxe 3.4.7
#ifndef INCLUDED_roaming_screens_SAbility
#define INCLUDED_roaming_screens_SAbility

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_roaming_screens_ISAbility
#include <roaming/screens/ISAbility.h>
#endif
#ifndef INCLUDED_roaming_screens_IScreen
#include <roaming/screens/IScreen.h>
#endif
HX_DECLARE_CLASS0(SSprite)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,MovieClip)
HX_DECLARE_CLASS2(openfl,display,Sprite)
HX_DECLARE_CLASS2(openfl,events,Event)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,events,MouseEvent)
HX_DECLARE_CLASS2(openfl,geom,Point)
HX_DECLARE_CLASS2(roaming,enums,Attribute)
HX_DECLARE_CLASS2(roaming,screens,ICanvas)
HX_DECLARE_CLASS2(roaming,screens,ISAbility)
HX_DECLARE_CLASS2(roaming,screens,IScreen)
HX_DECLARE_CLASS2(roaming,screens,SAbility)
HX_DECLARE_CLASS3(roaming,screens,components,AttributeContainer)
HX_DECLARE_CLASS3(roaming,screens,components,PointsAndRespec)
HX_DECLARE_CLASS3(roaming,screens,components,TreeContainer)
HX_DECLARE_CLASS3(roaming,screens,components,WheelContainer)

namespace roaming{
namespace screens{


class HXCPP_CLASS_ATTRIBUTES SAbility_obj : public  ::SSprite_obj
{
	public:
		typedef  ::SSprite_obj super;
		typedef SAbility_obj OBJ_;
		SAbility_obj();

	public:
		enum { _hx_ClassId = 0x390564e5 };

		void __construct(::Dynamic canvas);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="roaming.screens.SAbility")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"roaming.screens.SAbility"); }
		static hx::ObjectPtr< SAbility_obj > __new(::Dynamic canvas);
		static hx::ObjectPtr< SAbility_obj > __alloc(hx::Ctx *_hx_ctx,::Dynamic canvas);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SAbility_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("SAbility","\x97","\x89","\x0d","\x06"); }

		::Dynamic canvas;
		 ::roaming::screens::components::TreeContainer treeContainer;
		 ::roaming::screens::components::WheelContainer wheelContainer;
		 ::roaming::screens::components::AttributeContainer attribContainer;
		 ::roaming::screens::components::PointsAndRespec parContainer;
		 ::openfl::display::MovieClip closeButton;
		void init();
		::Dynamic init_dyn();

		void put(int i,int j);
		::Dynamic put_dyn();

		void splice(int i);
		::Dynamic splice_dyn();

		void learn(int i,int j);
		::Dynamic learn_dyn();

		void power( ::roaming::enums::Attribute att);
		::Dynamic power_dyn();

		void respec();
		::Dynamic respec_dyn();

		void onClick( ::openfl::events::MouseEvent e);
		::Dynamic onClick_dyn();

		void onRightClick( ::openfl::events::MouseEvent e);
		::Dynamic onRightClick_dyn();

		 ::openfl::geom::Point treeCont;
		 ::openfl::geom::Point wheelCont;
		 ::openfl::geom::Point attribCont;
		 ::openfl::geom::Point parCont;
		Float exitY;
		Float exitX();
		::Dynamic exitX_dyn();

		Float getAbRadius();
		::Dynamic getAbRadius_dyn();

};

} // end namespace roaming
} // end namespace screens

#endif /* INCLUDED_roaming_screens_SAbility */ 
