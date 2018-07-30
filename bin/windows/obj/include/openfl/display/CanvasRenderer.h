// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl_display_CanvasRenderer
#define INCLUDED_openfl_display_CanvasRenderer

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_DisplayObjectRenderer
#include <openfl/display/DisplayObjectRenderer.h>
#endif
HX_DECLARE_CLASS2(lime,app,IModule)
HX_DECLARE_CLASS2(lime,graphics,CanvasRenderContext)
HX_DECLARE_CLASS2(openfl,display,CanvasRenderer)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectRenderer)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,InteractiveObject)
HX_DECLARE_CLASS2(openfl,display,Stage)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,geom,Matrix)
HX_DECLARE_CLASS2(openfl,geom,Rectangle)

namespace openfl{
namespace display{


class HXCPP_CLASS_ATTRIBUTES CanvasRenderer_obj : public  ::openfl::display::DisplayObjectRenderer_obj
{
	public:
		typedef  ::openfl::display::DisplayObjectRenderer_obj super;
		typedef CanvasRenderer_obj OBJ_;
		CanvasRenderer_obj();

	public:
		enum { _hx_ClassId = 0x0388830d };

		void __construct( ::lime::graphics::CanvasRenderContext context);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.display.CanvasRenderer")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl.display.CanvasRenderer"); }
		static hx::ObjectPtr< CanvasRenderer_obj > __new( ::lime::graphics::CanvasRenderContext context);
		static hx::ObjectPtr< CanvasRenderer_obj > __alloc(hx::Ctx *_hx_ctx, ::lime::graphics::CanvasRenderContext context);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~CanvasRenderer_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("CanvasRenderer","\x5b","\x02","\x4a","\x33"); }

		 ::lime::graphics::CanvasRenderContext context;
		Float pixelRatio;
		bool _hx___isDOM;
		 ::openfl::geom::Matrix _hx___tempMatrix;
		void applySmoothing( ::lime::graphics::CanvasRenderContext context,bool value);
		::Dynamic applySmoothing_dyn();

		void setTransform( ::openfl::geom::Matrix transform, ::lime::graphics::CanvasRenderContext context);
		::Dynamic setTransform_dyn();

		void _hx___clear();

		void _hx___popMask();

		void _hx___popMaskObject( ::openfl::display::DisplayObject object,hx::Null< bool >  handleScrollRect);

		void _hx___popMaskRect();

		void _hx___pushMask( ::openfl::display::DisplayObject mask);

		void _hx___pushMaskObject( ::openfl::display::DisplayObject object,hx::Null< bool >  handleScrollRect);

		void _hx___pushMaskRect( ::openfl::geom::Rectangle rect, ::openfl::geom::Matrix transform);

		void _hx___render(::Dynamic object);

		void _hx___renderStage3D( ::openfl::display::Stage stage);

		void _hx___setBlendMode( ::Dynamic value);

};

} // end namespace openfl
} // end namespace display

#endif /* INCLUDED_openfl_display_CanvasRenderer */ 
