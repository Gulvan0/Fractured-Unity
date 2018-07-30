// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl_display_BitmapData
#define INCLUDED_openfl_display_BitmapData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(lime,_backend,native,NativeGLRenderContext)
HX_DECLARE_CLASS2(lime,app,Future)
HX_DECLARE_CLASS2(lime,graphics,Image)
HX_DECLARE_CLASS3(lime,graphics,opengl,GLObject)
HX_DECLARE_CLASS2(lime,math,Vector2)
HX_DECLARE_CLASS2(lime,utils,ArrayBufferView)
HX_DECLARE_CLASS2(openfl,_Vector,IVector)
HX_DECLARE_CLASS2(openfl,_Vector,IntVector)
HX_DECLARE_CLASS2(openfl,display,BitmapData)
HX_DECLARE_CLASS2(openfl,display,CairoRenderer)
HX_DECLARE_CLASS2(openfl,display,CanvasRenderer)
HX_DECLARE_CLASS2(openfl,display,DOMRenderer)
HX_DECLARE_CLASS2(openfl,display,DisplayObject)
HX_DECLARE_CLASS2(openfl,display,DisplayObjectRenderer)
HX_DECLARE_CLASS2(openfl,display,Graphics)
HX_DECLARE_CLASS2(openfl,display,IBitmapDrawable)
HX_DECLARE_CLASS2(openfl,display,OpenGLRenderer)
HX_DECLARE_CLASS3(openfl,display3D,textures,TextureBase)
HX_DECLARE_CLASS2(openfl,events,EventDispatcher)
HX_DECLARE_CLASS2(openfl,events,IEventDispatcher)
HX_DECLARE_CLASS2(openfl,filters,BitmapFilter)
HX_DECLARE_CLASS2(openfl,geom,ColorTransform)
HX_DECLARE_CLASS2(openfl,geom,Matrix)
HX_DECLARE_CLASS2(openfl,geom,Point)
HX_DECLARE_CLASS2(openfl,geom,Rectangle)
HX_DECLARE_CLASS2(openfl,utils,ByteArrayData)
HX_DECLARE_CLASS2(openfl,utils,IDataInput)
HX_DECLARE_CLASS2(openfl,utils,IDataOutput)

namespace openfl{
namespace display{


class HXCPP_CLASS_ATTRIBUTES BitmapData_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef BitmapData_obj OBJ_;
		BitmapData_obj();

	public:
		enum { _hx_ClassId = 0x28c743a7 };

		void __construct(int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl.display.BitmapData")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl.display.BitmapData"); }
		static hx::ObjectPtr< BitmapData_obj > __new(int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor);
		static hx::ObjectPtr< BitmapData_obj > __alloc(hx::Ctx *_hx_ctx,int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~BitmapData_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("BitmapData","\xd9","\xb9","\x71","\x2a"); }

		static void __boot();
		static int _hx___bufferStride;
		static  ::Dynamic _hx___supportsBGRA;
		static  ::lime::math::Vector2 _hx___tempVector;
		static int _hx___textureFormat;
		static int _hx___textureInternalFormat;
		static  ::openfl::display::BitmapData fromBase64(::String base64,::String type);
		static ::Dynamic fromBase64_dyn();

		static  ::openfl::display::BitmapData fromBytes( ::openfl::utils::ByteArrayData bytes, ::openfl::utils::ByteArrayData rawAlpha);
		static ::Dynamic fromBytes_dyn();

		static  ::openfl::display::BitmapData fromFile(::String path);
		static ::Dynamic fromFile_dyn();

		static  ::openfl::display::BitmapData fromImage( ::lime::graphics::Image image,hx::Null< bool >  transparent);
		static ::Dynamic fromImage_dyn();

		static  ::openfl::display::BitmapData fromTexture( ::openfl::display3D::textures::TextureBase texture);
		static ::Dynamic fromTexture_dyn();

		static  ::lime::app::Future loadFromBase64(::String base64,::String type);
		static ::Dynamic loadFromBase64_dyn();

		static  ::lime::app::Future loadFromBytes( ::openfl::utils::ByteArrayData bytes, ::openfl::utils::ByteArrayData rawAlpha);
		static ::Dynamic loadFromBytes_dyn();

		static  ::lime::app::Future loadFromFile(::String path);
		static ::Dynamic loadFromFile_dyn();

		int height;
		 ::lime::graphics::Image image;
		bool readable;
		 ::openfl::geom::Rectangle rect;
		bool transparent;
		int width;
		 ::Dynamic _hx___blendMode;
		 ::lime::graphics::opengl::GLObject _hx___buffer;
		 ::openfl::geom::ColorTransform _hx___bufferColorTransform;
		 ::lime::_backend::native::NativeGLRenderContext _hx___bufferContext;
		Float _hx___bufferAlpha;
		 ::lime::utils::ArrayBufferView _hx___bufferData;
		 ::lime::graphics::opengl::GLObject _hx___framebuffer;
		 ::lime::_backend::native::NativeGLRenderContext _hx___framebufferContext;
		bool _hx___isMask;
		bool _hx___isValid;
		 ::openfl::display::DisplayObject _hx___mask;
		bool _hx___renderable;
		 ::openfl::geom::Matrix _hx___renderTransform;
		 ::openfl::geom::Rectangle _hx___scrollRect;
		 ::Dynamic _hx___surface;
		 ::lime::graphics::opengl::GLObject _hx___texture;
		 ::lime::_backend::native::NativeGLRenderContext _hx___textureContext;
		int _hx___textureVersion;
		 ::openfl::geom::Matrix _hx___transform;
		 ::openfl::geom::Rectangle _hx___uvRect;
		Float _hx___worldAlpha;
		 ::openfl::geom::ColorTransform _hx___worldColorTransform;
		 ::openfl::geom::Matrix _hx___worldTransform;
		int _hx___textureWidth;
		int _hx___textureHeight;
		void applyFilter( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint, ::openfl::filters::BitmapFilter filter);
		::Dynamic applyFilter_dyn();

		 ::openfl::display::BitmapData clone();
		::Dynamic clone_dyn();

		void colorTransform( ::openfl::geom::Rectangle rect, ::openfl::geom::ColorTransform colorTransform);
		::Dynamic colorTransform_dyn();

		 ::Dynamic compare( ::openfl::display::BitmapData otherBitmapData);
		::Dynamic compare_dyn();

		void copyChannel( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint,int sourceChannel,int destChannel);
		::Dynamic copyChannel_dyn();

		void copyPixels( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint, ::openfl::display::BitmapData alphaBitmapData, ::openfl::geom::Point alphaPoint,hx::Null< bool >  mergeAlpha);
		::Dynamic copyPixels_dyn();

		void dispose();
		::Dynamic dispose_dyn();

		void disposeImage();
		::Dynamic disposeImage_dyn();

		void draw(::Dynamic source, ::openfl::geom::Matrix matrix, ::openfl::geom::ColorTransform colorTransform, ::Dynamic blendMode, ::openfl::geom::Rectangle clipRect,hx::Null< bool >  smoothing);
		::Dynamic draw_dyn();

		void drawWithQuality(::Dynamic source, ::openfl::geom::Matrix matrix, ::openfl::geom::ColorTransform colorTransform, ::Dynamic blendMode, ::openfl::geom::Rectangle clipRect,hx::Null< bool >  smoothing, ::Dynamic quality);
		::Dynamic drawWithQuality_dyn();

		 ::openfl::utils::ByteArrayData encode( ::openfl::geom::Rectangle rect, ::Dynamic compressor, ::openfl::utils::ByteArrayData byteArray);
		::Dynamic encode_dyn();

		void fillRect( ::openfl::geom::Rectangle rect,int color);
		::Dynamic fillRect_dyn();

		void floodFill(int x,int y,int color);
		::Dynamic floodFill_dyn();

		 ::openfl::geom::Rectangle generateFilterRect( ::openfl::geom::Rectangle sourceRect, ::openfl::filters::BitmapFilter filter);
		::Dynamic generateFilterRect_dyn();

		 ::lime::graphics::opengl::GLObject getBuffer( ::lime::_backend::native::NativeGLRenderContext gl);
		::Dynamic getBuffer_dyn();

		 ::openfl::geom::Rectangle getColorBoundsRect(int mask,int color,hx::Null< bool >  findColor);
		::Dynamic getColorBoundsRect_dyn();

		int getPixel(int x,int y);
		::Dynamic getPixel_dyn();

		int getPixel32(int x,int y);
		::Dynamic getPixel32_dyn();

		 ::openfl::utils::ByteArrayData getPixels( ::openfl::geom::Rectangle rect);
		::Dynamic getPixels_dyn();

		 ::Dynamic getSurface();
		::Dynamic getSurface_dyn();

		 ::lime::graphics::opengl::GLObject getTexture( ::lime::_backend::native::NativeGLRenderContext gl);
		::Dynamic getTexture_dyn();

		 ::openfl::_Vector::IntVector getVector( ::openfl::geom::Rectangle rect);
		::Dynamic getVector_dyn();

		::Array< ::Dynamic> histogram( ::openfl::geom::Rectangle hRect);
		::Dynamic histogram_dyn();

		bool hitTest( ::openfl::geom::Point firstPoint,int firstAlphaThreshold, ::Dynamic secondObject, ::openfl::geom::Point secondBitmapDataPoint,hx::Null< int >  secondAlphaThreshold);
		::Dynamic hitTest_dyn();

		void lock();
		::Dynamic lock_dyn();

		void merge( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint,int redMultiplier,int greenMultiplier,int blueMultiplier,int alphaMultiplier);
		::Dynamic merge_dyn();

		void noise(int randomSeed,hx::Null< int >  low,hx::Null< int >  high,hx::Null< int >  channelOptions,hx::Null< bool >  grayScale);
		::Dynamic noise_dyn();

		void paletteMap( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint,::Array< int > redArray,::Array< int > greenArray,::Array< int > blueArray,::Array< int > alphaArray);
		::Dynamic paletteMap_dyn();

		void perlinNoise(Float baseX,Float baseY,int numOctaves,int randomSeed,bool stitch,bool fractalNoise,hx::Null< int >  channelOptions,hx::Null< bool >  grayScale,::Array< ::Dynamic> offsets);
		::Dynamic perlinNoise_dyn();

		void scroll(int x,int y);
		::Dynamic scroll_dyn();

		void setPixel(int x,int y,int color);
		::Dynamic setPixel_dyn();

		void setPixel32(int x,int y,int color);
		::Dynamic setPixel32_dyn();

		void setPixels( ::openfl::geom::Rectangle rect, ::openfl::utils::ByteArrayData byteArray);
		::Dynamic setPixels_dyn();

		void setVector( ::openfl::geom::Rectangle rect, ::openfl::_Vector::IntVector inputVector);
		::Dynamic setVector_dyn();

		int threshold( ::openfl::display::BitmapData sourceBitmapData, ::openfl::geom::Rectangle sourceRect, ::openfl::geom::Point destPoint,::String operation,int threshold,hx::Null< int >  color,hx::Null< int >  mask,hx::Null< bool >  copySource);
		::Dynamic threshold_dyn();

		void unlock( ::openfl::geom::Rectangle changeRect);
		::Dynamic unlock_dyn();

		void _hx___applyAlpha( ::openfl::utils::ByteArrayData alpha);
		::Dynamic _hx___applyAlpha_dyn();

		void _hx___drawCairo(::Dynamic source, ::openfl::display::CairoRenderer renderer);
		::Dynamic _hx___drawCairo_dyn();

		void _hx___drawCanvas(::Dynamic source, ::openfl::display::CanvasRenderer renderer);
		::Dynamic _hx___drawCanvas_dyn();

		void _hx___drawGL(::Dynamic source, ::openfl::display::OpenGLRenderer renderer);
		::Dynamic _hx___drawGL_dyn();

		void _hx___fillRect( ::openfl::geom::Rectangle rect,int color,bool allowFramebuffer);
		::Dynamic _hx___fillRect_dyn();

		void _hx___fromBase64(::String base64,::String type);
		::Dynamic _hx___fromBase64_dyn();

		void _hx___fromBytes( ::openfl::utils::ByteArrayData bytes, ::openfl::utils::ByteArrayData rawAlpha);
		::Dynamic _hx___fromBytes_dyn();

		void _hx___fromFile(::String path);
		::Dynamic _hx___fromFile_dyn();

		void _hx___fromImage( ::lime::graphics::Image image);
		::Dynamic _hx___fromImage_dyn();

		void _hx___getBounds( ::openfl::geom::Rectangle rect, ::openfl::geom::Matrix matrix);
		::Dynamic _hx___getBounds_dyn();

		 ::lime::graphics::opengl::GLObject _hx___getFramebuffer( ::lime::_backend::native::NativeGLRenderContext gl);
		::Dynamic _hx___getFramebuffer_dyn();

		 ::lime::app::Future _hx___loadFromBase64(::String base64,::String type);
		::Dynamic _hx___loadFromBase64_dyn();

		 ::lime::app::Future _hx___loadFromBytes( ::openfl::utils::ByteArrayData bytes, ::openfl::utils::ByteArrayData rawAlpha);
		::Dynamic _hx___loadFromBytes_dyn();

		 ::lime::app::Future _hx___loadFromFile(::String path);
		::Dynamic _hx___loadFromFile_dyn();

		void _hx___renderCairo( ::openfl::display::CairoRenderer renderer);
		::Dynamic _hx___renderCairo_dyn();

		void _hx___renderCairoMask( ::openfl::display::CairoRenderer renderer);
		::Dynamic _hx___renderCairoMask_dyn();

		void _hx___renderCanvas( ::openfl::display::CanvasRenderer renderer);
		::Dynamic _hx___renderCanvas_dyn();

		void _hx___renderCanvasMask( ::openfl::display::CanvasRenderer renderer);
		::Dynamic _hx___renderCanvasMask_dyn();

		void _hx___renderDOM( ::openfl::display::DOMRenderer renderer);
		::Dynamic _hx___renderDOM_dyn();

		void _hx___renderGL( ::openfl::display::OpenGLRenderer renderer);
		::Dynamic _hx___renderGL_dyn();

		void _hx___renderGLMask( ::openfl::display::OpenGLRenderer renderer);
		::Dynamic _hx___renderGLMask_dyn();

		void _hx___resize(int width,int height);
		::Dynamic _hx___resize_dyn();

		void _hx___setUVRect( ::lime::_backend::native::NativeGLRenderContext gl,Float x,Float y,Float width,Float height);
		::Dynamic _hx___setUVRect_dyn();

		void _hx___sync();
		::Dynamic _hx___sync_dyn();

		void _hx___update(bool transformOnly,bool updateChildren);
		::Dynamic _hx___update_dyn();

		void _hx___updateChildren(bool transformOnly);
		::Dynamic _hx___updateChildren_dyn();

		void _hx___updateMask( ::openfl::display::Graphics maskGraphics);
		::Dynamic _hx___updateMask_dyn();

		void _hx___updateTransforms( ::openfl::geom::Matrix overrideTransform);
		::Dynamic _hx___updateTransforms_dyn();

};

} // end namespace openfl
} // end namespace display

#endif /* INCLUDED_openfl_display_BitmapData */ 
