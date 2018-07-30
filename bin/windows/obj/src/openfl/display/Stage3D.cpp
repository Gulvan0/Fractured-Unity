// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_haxe_Timer
#include <haxe/Timer.h>
#endif
#ifndef INCLUDED_lime__backend_native_NativeGLRenderContext
#include <lime/_backend/native/NativeGLRenderContext.h>
#endif
#ifndef INCLUDED_lime_app_IModule
#include <lime/app/IModule.h>
#endif
#ifndef INCLUDED_lime_graphics_RendererType
#include <lime/graphics/RendererType.h>
#endif
#ifndef INCLUDED_openfl__Vector_IVector
#include <openfl/_Vector/IVector.h>
#endif
#ifndef INCLUDED_openfl__Vector_ObjectVector
#include <openfl/_Vector/ObjectVector.h>
#endif
#ifndef INCLUDED_openfl__internal_stage3D_GLUtils
#include <openfl/_internal/stage3D/GLUtils.h>
#endif
#ifndef INCLUDED_openfl_display_CairoRenderer
#include <openfl/display/CairoRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_CanvasRenderer
#include <openfl/display/CanvasRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_DOMRenderer
#include <openfl/display/DOMRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectRenderer
#include <openfl/display/DisplayObjectRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_OpenGLRenderer
#include <openfl/display/OpenGLRenderer.h>
#endif
#ifndef INCLUDED_openfl_display_Shader
#include <openfl/display/Shader.h>
#endif
#ifndef INCLUDED_openfl_display_Stage
#include <openfl/display/Stage.h>
#endif
#ifndef INCLUDED_openfl_display_Stage3D
#include <openfl/display/Stage3D.h>
#endif
#ifndef INCLUDED_openfl_display3D_Context3D
#include <openfl/display3D/Context3D.h>
#endif
#ifndef INCLUDED_openfl_display3D_Program3D
#include <openfl/display3D/Program3D.h>
#endif
#ifndef INCLUDED_openfl_events_ErrorEvent
#include <openfl/events/ErrorEvent.h>
#endif
#ifndef INCLUDED_openfl_events_Event
#include <openfl/events/Event.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_TextEvent
#include <openfl/events/TextEvent.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_3e7f1148457df64b_70_new,"openfl.display.Stage3D","new",0x52647737,"openfl.display.Stage3D.new","openfl/display/Stage3D.hx",70,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_82_requestContext3D,"openfl.display.Stage3D","requestContext3D",0x80c219da,"openfl.display.Stage3D.requestContext3D","openfl/display/Stage3D.hx",82,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_97_requestContext3DMatchingProfiles,"openfl.display.Stage3D","requestContext3DMatchingProfiles",0x5b5ae301,"openfl.display.Stage3D.requestContext3DMatchingProfiles","openfl/display/Stage3D.hx",97,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_102___createContext,"openfl.display.Stage3D","__createContext",0x1987b48a,"openfl.display.Stage3D.__createContext","openfl/display/Stage3D.hx",102,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_173___dispatchError,"openfl.display.Stage3D","__dispatchError",0xdb9710e5,"openfl.display.Stage3D.__dispatchError","openfl/display/Stage3D.hx",173,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_183___dispatchCreate,"openfl.display.Stage3D","__dispatchCreate",0x733e9b3f,"openfl.display.Stage3D.__dispatchCreate","openfl/display/Stage3D.hx",183,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_193___renderCairo,"openfl.display.Stage3D","__renderCairo",0x4faad7c9,"openfl.display.Stage3D.__renderCairo","openfl/display/Stage3D.hx",193,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_207___renderCanvas,"openfl.display.Stage3D","__renderCanvas",0x69230677,"openfl.display.Stage3D.__renderCanvas","openfl/display/Stage3D.hx",207,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_221___renderDOM,"openfl.display.Stage3D","__renderDOM",0x9069cb83,"openfl.display.Stage3D.__renderDOM","openfl/display/Stage3D.hx",221,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_245___renderGL,"openfl.display.Stage3D","__renderGL",0x25621024,"openfl.display.Stage3D.__renderGL","openfl/display/Stage3D.hx",245,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_265___resize,"openfl.display.Stage3D","__resize",0x193af2dd,"openfl.display.Stage3D.__resize","openfl/display/Stage3D.hx",265,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_279___resetContext3DStates,"openfl.display.Stage3D","__resetContext3DStates",0x6c934f5c,"openfl.display.Stage3D.__resetContext3DStates","openfl/display/Stage3D.hx",279,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_291_get_x,"openfl.display.Stage3D","get_x",0x0609efe6,"openfl.display.Stage3D.get_x","openfl/display/Stage3D.hx",291,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_296_set_x,"openfl.display.Stage3D","set_x",0xeed8e5f2,"openfl.display.Stage3D.set_x","openfl/display/Stage3D.hx",296,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_315_get_y,"openfl.display.Stage3D","get_y",0x0609efe7,"openfl.display.Stage3D.get_y","openfl/display/Stage3D.hx",315,0x37141b9b)
HX_LOCAL_STACK_FRAME(_hx_pos_3e7f1148457df64b_320_set_y,"openfl.display.Stage3D","set_y",0xeed8e5f3,"openfl.display.Stage3D.set_y","openfl/display/Stage3D.hx",320,0x37141b9b)
namespace openfl{
namespace display{

void Stage3D_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_70_new)
HXLINE(  72)		super::__construct(null());
HXLINE(  74)		this->_hx___x = (int)0;
HXLINE(  75)		this->_hx___y = (int)0;
HXLINE(  77)		this->visible = true;
            	}

Dynamic Stage3D_obj::__CreateEmpty() { return new Stage3D_obj; }

void *Stage3D_obj::_hx_vtable = 0;

Dynamic Stage3D_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Stage3D_obj > _hx_result = new Stage3D_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Stage3D_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1b123bf8) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x1b123bf8;
	} else {
		return inClassId==(int)0x6b07d441;
	}
}

void Stage3D_obj::requestContext3D( ::Dynamic __o_context3DRenderMode, ::Dynamic __o_profile){
 ::Dynamic context3DRenderMode = __o_context3DRenderMode.Default(0);
 ::Dynamic profile = __o_profile.Default(0);
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_82_requestContext3D)
HXLINE(  84)		this->_hx___contextRequested = true;
HXLINE(  86)		if (hx::IsNotNull( this->context3D )) {
HXLINE(  88)			::haxe::Timer_obj::delay(this->_hx___dispatchCreate_dyn(),(int)1);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,requestContext3D,(void))

void Stage3D_obj::requestContext3DMatchingProfiles( ::openfl::_Vector::ObjectVector profiles){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_97_requestContext3DMatchingProfiles)
HXDLIN(  97)		this->requestContext3D(null(),null());
            	}


HX_DEFINE_DYNAMIC_FUNC1(Stage3D_obj,requestContext3DMatchingProfiles,(void))

void Stage3D_obj::_hx___createContext( ::openfl::display::Stage stage, ::openfl::display::DisplayObjectRenderer renderer){
            	HX_GC_STACKFRAME(&_hx_pos_3e7f1148457df64b_102___createContext)
HXLINE( 104)		this->_hx___stage = stage;
HXLINE( 106)		if (hx::IsEq( renderer->_hx___type,::lime::graphics::RendererType_obj::OPENGL_dyn() )) {
HXLINE( 108)			this->context3D =  ::openfl::display3D::Context3D_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this),renderer);
HXLINE( 109)			this->_hx___dispatchCreate();
            		}
            		else {
HXLINE( 111)			bool _hx_tmp = hx::IsEq( renderer->_hx___type,::lime::graphics::RendererType_obj::DOM_dyn() );
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___createContext,(void))

void Stage3D_obj::_hx___dispatchError(){
            	HX_GC_STACKFRAME(&_hx_pos_3e7f1148457df64b_173___dispatchError)
HXLINE( 175)		this->_hx___contextRequested = false;
HXLINE( 176)		this->dispatchEvent( ::openfl::events::ErrorEvent_obj::__alloc( HX_CTX ,HX_("error",c8,cb,29,73),false,false,HX_("Context3D not available",9c,fc,63,d3),null()));
            	}


HX_DEFINE_DYNAMIC_FUNC0(Stage3D_obj,_hx___dispatchError,(void))

void Stage3D_obj::_hx___dispatchCreate(){
            	HX_GC_STACKFRAME(&_hx_pos_3e7f1148457df64b_183___dispatchCreate)
HXDLIN( 183)		if (this->_hx___contextRequested) {
HXLINE( 185)			this->_hx___contextRequested = false;
HXLINE( 186)			this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("context3DCreate",7c,bf,59,7b),null(),null()));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(Stage3D_obj,_hx___dispatchCreate,(void))

void Stage3D_obj::_hx___renderCairo( ::openfl::display::Stage stage, ::openfl::display::CairoRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_193___renderCairo)
HXLINE( 195)		if (!(this->visible)) {
HXLINE( 195)			return;
            		}
HXLINE( 197)		if (this->_hx___contextRequested) {
HXLINE( 199)			this->_hx___dispatchError();
HXLINE( 200)			this->_hx___contextRequested = false;
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___renderCairo,(void))

void Stage3D_obj::_hx___renderCanvas( ::openfl::display::Stage stage, ::openfl::display::CanvasRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_207___renderCanvas)
HXLINE( 209)		if (!(this->visible)) {
HXLINE( 209)			return;
            		}
HXLINE( 211)		if (this->_hx___contextRequested) {
HXLINE( 213)			this->_hx___dispatchError();
HXLINE( 214)			this->_hx___contextRequested = false;
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___renderCanvas,(void))

void Stage3D_obj::_hx___renderDOM( ::openfl::display::Stage stage, ::openfl::display::DOMRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_221___renderDOM)
HXLINE( 223)		if (!(this->visible)) {
HXLINE( 223)			return;
            		}
HXLINE( 225)		bool _hx_tmp;
HXDLIN( 225)		if (this->_hx___contextRequested) {
HXLINE( 225)			_hx_tmp = hx::IsNull( this->context3D );
            		}
            		else {
HXLINE( 225)			_hx_tmp = false;
            		}
HXDLIN( 225)		if (_hx_tmp) {
HXLINE( 227)			this->_hx___createContext(stage,renderer);
            		}
HXLINE( 231)		if (hx::IsNotNull( this->context3D )) {
HXLINE( 237)			this->_hx___resetContext3DStates();
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___renderDOM,(void))

void Stage3D_obj::_hx___renderGL( ::openfl::display::Stage stage, ::openfl::display::OpenGLRenderer renderer){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_245___renderGL)
HXLINE( 247)		if (!(this->visible)) {
HXLINE( 247)			return;
            		}
HXLINE( 249)		bool _hx_tmp;
HXDLIN( 249)		if (this->_hx___contextRequested) {
HXLINE( 249)			_hx_tmp = hx::IsNull( this->context3D );
            		}
            		else {
HXLINE( 249)			_hx_tmp = false;
            		}
HXDLIN( 249)		if (_hx_tmp) {
HXLINE( 251)			this->_hx___createContext(stage,renderer);
            		}
HXLINE( 255)		if (hx::IsNotNull( this->context3D )) {
HXLINE( 257)			this->_hx___resetContext3DStates();
HXLINE( 258)			{
HXLINE( 258)				if (hx::IsNotNull( this->context3D )) {
HXLINE( 258)					renderer->_hx___setBlendMode(null());
HXDLIN( 258)					if (hx::IsNotNull( renderer->_hx___currentShader )) {
HXLINE( 258)						renderer->setShader(null());
HXDLIN( 258)						if (hx::IsNotNull( this->context3D->_hx___program )) {
HXLINE( 258)							this->context3D->_hx___program->_hx___use();
            						}
            					}
            				}
HXDLIN( 258)				if (::openfl::_internal::stage3D::GLUtils_obj::debug) {
HXLINE( 258)					renderer->gl->getError();
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___renderGL,(void))

void Stage3D_obj::_hx___resize(int width,int height){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_265___resize)
            	}


HX_DEFINE_DYNAMIC_FUNC2(Stage3D_obj,_hx___resize,(void))

void Stage3D_obj::_hx___resetContext3DStates(){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_279___resetContext3DStates)
HXLINE( 282)		this->context3D->_hx___updateBlendFactors();
HXLINE( 284)		this->context3D->_hx___updateBackbufferViewport();
            	}


HX_DEFINE_DYNAMIC_FUNC0(Stage3D_obj,_hx___resetContext3DStates,(void))

Float Stage3D_obj::get_x(){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_291_get_x)
HXDLIN( 291)		return this->_hx___x;
            	}


HX_DEFINE_DYNAMIC_FUNC0(Stage3D_obj,get_x,return )

Float Stage3D_obj::set_x(Float value){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_296_set_x)
HXLINE( 298)		if ((this->_hx___x == value)) {
HXLINE( 298)			return value;
            		}
HXLINE( 300)		this->_hx___x = value;
HXLINE( 302)		if (hx::IsNotNull( this->context3D )) {
HXLINE( 304)			this->context3D->_hx___updateBackbufferViewport();
            		}
HXLINE( 308)		return value;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Stage3D_obj,set_x,return )

Float Stage3D_obj::get_y(){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_315_get_y)
HXDLIN( 315)		return this->_hx___y;
            	}


HX_DEFINE_DYNAMIC_FUNC0(Stage3D_obj,get_y,return )

Float Stage3D_obj::set_y(Float value){
            	HX_STACKFRAME(&_hx_pos_3e7f1148457df64b_320_set_y)
HXLINE( 322)		if ((this->_hx___y == value)) {
HXLINE( 322)			return value;
            		}
HXLINE( 324)		this->_hx___y = value;
HXLINE( 326)		if (hx::IsNotNull( this->context3D )) {
HXLINE( 328)			this->context3D->_hx___updateBackbufferViewport();
            		}
HXLINE( 332)		return value;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Stage3D_obj,set_y,return )

bool Stage3D_obj::_hx___active;


hx::ObjectPtr< Stage3D_obj > Stage3D_obj::__new() {
	hx::ObjectPtr< Stage3D_obj > __this = new Stage3D_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< Stage3D_obj > Stage3D_obj::__alloc(hx::Ctx *_hx_ctx) {
	Stage3D_obj *__this = (Stage3D_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Stage3D_obj), true, "openfl.display.Stage3D"));
	*(void **)__this = Stage3D_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Stage3D_obj::Stage3D_obj()
{
}

void Stage3D_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Stage3D);
	HX_MARK_MEMBER_NAME(context3D,"context3D");
	HX_MARK_MEMBER_NAME(visible,"visible");
	HX_MARK_MEMBER_NAME(_hx___contextRequested,"__contextRequested");
	HX_MARK_MEMBER_NAME(_hx___stage,"__stage");
	HX_MARK_MEMBER_NAME(_hx___x,"__x");
	HX_MARK_MEMBER_NAME(_hx___y,"__y");
	 ::openfl::events::EventDispatcher_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Stage3D_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(context3D,"context3D");
	HX_VISIT_MEMBER_NAME(visible,"visible");
	HX_VISIT_MEMBER_NAME(_hx___contextRequested,"__contextRequested");
	HX_VISIT_MEMBER_NAME(_hx___stage,"__stage");
	HX_VISIT_MEMBER_NAME(_hx___x,"__x");
	HX_VISIT_MEMBER_NAME(_hx___y,"__y");
	 ::openfl::events::EventDispatcher_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Stage3D_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_x() ); }
		if (HX_FIELD_EQ(inName,"y") ) { if (inCallProp == hx::paccAlways) return hx::Val( get_y() ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"__x") ) { return hx::Val( _hx___x ); }
		if (HX_FIELD_EQ(inName,"__y") ) { return hx::Val( _hx___y ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"get_x") ) { return hx::Val( get_x_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_x") ) { return hx::Val( set_x_dyn() ); }
		if (HX_FIELD_EQ(inName,"get_y") ) { return hx::Val( get_y_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_y") ) { return hx::Val( set_y_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"visible") ) { return hx::Val( visible ); }
		if (HX_FIELD_EQ(inName,"__stage") ) { return hx::Val( _hx___stage ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__resize") ) { return hx::Val( _hx___resize_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"context3D") ) { return hx::Val( context3D ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"__renderGL") ) { return hx::Val( _hx___renderGL_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"__renderDOM") ) { return hx::Val( _hx___renderDOM_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"__renderCairo") ) { return hx::Val( _hx___renderCairo_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"__renderCanvas") ) { return hx::Val( _hx___renderCanvas_dyn() ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"__createContext") ) { return hx::Val( _hx___createContext_dyn() ); }
		if (HX_FIELD_EQ(inName,"__dispatchError") ) { return hx::Val( _hx___dispatchError_dyn() ); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"requestContext3D") ) { return hx::Val( requestContext3D_dyn() ); }
		if (HX_FIELD_EQ(inName,"__dispatchCreate") ) { return hx::Val( _hx___dispatchCreate_dyn() ); }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"__contextRequested") ) { return hx::Val( _hx___contextRequested ); }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"__resetContext3DStates") ) { return hx::Val( _hx___resetContext3DStates_dyn() ); }
		break;
	case 32:
		if (HX_FIELD_EQ(inName,"requestContext3DMatchingProfiles") ) { return hx::Val( requestContext3DMatchingProfiles_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

bool Stage3D_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"__active") ) { outValue = ( _hx___active ); return true; }
	}
	return false;
}

hx::Val Stage3D_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"x") ) { if (inCallProp == hx::paccAlways) return hx::Val( set_x(inValue.Cast< Float >()) ); }
		if (HX_FIELD_EQ(inName,"y") ) { if (inCallProp == hx::paccAlways) return hx::Val( set_y(inValue.Cast< Float >()) ); }
		break;
	case 3:
		if (HX_FIELD_EQ(inName,"__x") ) { _hx___x=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__y") ) { _hx___y=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"visible") ) { visible=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__stage") ) { _hx___stage=inValue.Cast<  ::openfl::display::Stage >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"context3D") ) { context3D=inValue.Cast<  ::openfl::display3D::Context3D >(); return inValue; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"__contextRequested") ) { _hx___contextRequested=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool Stage3D_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"__active") ) { _hx___active=ioValue.Cast< bool >(); return true; }
	}
	return false;
}

void Stage3D_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("context3D","\x60","\x5c","\xfc","\x16"));
	outFields->push(HX_HCSTRING("visible","\x72","\x78","\x24","\xa3"));
	outFields->push(HX_HCSTRING("x","\x78","\x00","\x00","\x00"));
	outFields->push(HX_HCSTRING("y","\x79","\x00","\x00","\x00"));
	outFields->push(HX_HCSTRING("__contextRequested","\x9f","\x10","\x4e","\x81"));
	outFields->push(HX_HCSTRING("__stage","\x9e","\xc3","\x69","\xee"));
	outFields->push(HX_HCSTRING("__x","\x58","\x69","\x48","\x00"));
	outFields->push(HX_HCSTRING("__y","\x59","\x69","\x48","\x00"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Stage3D_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::openfl::display3D::Context3D*/ ,(int)offsetof(Stage3D_obj,context3D),HX_HCSTRING("context3D","\x60","\x5c","\xfc","\x16")},
	{hx::fsBool,(int)offsetof(Stage3D_obj,visible),HX_HCSTRING("visible","\x72","\x78","\x24","\xa3")},
	{hx::fsBool,(int)offsetof(Stage3D_obj,_hx___contextRequested),HX_HCSTRING("__contextRequested","\x9f","\x10","\x4e","\x81")},
	{hx::fsObject /*::openfl::display::Stage*/ ,(int)offsetof(Stage3D_obj,_hx___stage),HX_HCSTRING("__stage","\x9e","\xc3","\x69","\xee")},
	{hx::fsFloat,(int)offsetof(Stage3D_obj,_hx___x),HX_HCSTRING("__x","\x58","\x69","\x48","\x00")},
	{hx::fsFloat,(int)offsetof(Stage3D_obj,_hx___y),HX_HCSTRING("__y","\x59","\x69","\x48","\x00")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo Stage3D_obj_sStaticStorageInfo[] = {
	{hx::fsBool,(void *) &Stage3D_obj::_hx___active,HX_HCSTRING("__active","\xe6","\xac","\x75","\xbe")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String Stage3D_obj_sMemberFields[] = {
	HX_HCSTRING("context3D","\x60","\x5c","\xfc","\x16"),
	HX_HCSTRING("visible","\x72","\x78","\x24","\xa3"),
	HX_HCSTRING("__contextRequested","\x9f","\x10","\x4e","\x81"),
	HX_HCSTRING("__stage","\x9e","\xc3","\x69","\xee"),
	HX_HCSTRING("__x","\x58","\x69","\x48","\x00"),
	HX_HCSTRING("__y","\x59","\x69","\x48","\x00"),
	HX_HCSTRING("requestContext3D","\x11","\x7b","\x31","\xf9"),
	HX_HCSTRING("requestContext3DMatchingProfiles","\x38","\x62","\xbe","\x66"),
	HX_HCSTRING("__createContext","\x33","\xa7","\x6c","\x89"),
	HX_HCSTRING("__dispatchError","\x8e","\x03","\x7c","\x4b"),
	HX_HCSTRING("__dispatchCreate","\x76","\xfc","\xad","\xeb"),
	HX_HCSTRING("__renderCairo","\x32","\x9e","\x42","\x55"),
	HX_HCSTRING("__renderCanvas","\xee","\xdb","\x58","\x48"),
	HX_HCSTRING("__renderDOM","\xac","\xf5","\x83","\xfb"),
	HX_HCSTRING("__renderGL","\x1b","\x1e","\x14","\x56"),
	HX_HCSTRING("__resize","\x14","\xc5","\xaa","\xb0"),
	HX_HCSTRING("__resetContext3DStates","\xd3","\xf3","\x5d","\xf3"),
	HX_HCSTRING("get_x","\x4f","\xa5","\x60","\x91"),
	HX_HCSTRING("set_x","\x5b","\x9b","\x2f","\x7a"),
	HX_HCSTRING("get_y","\x50","\xa5","\x60","\x91"),
	HX_HCSTRING("set_y","\x5c","\x9b","\x2f","\x7a"),
	::String(null()) };

static void Stage3D_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Stage3D_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Stage3D_obj::_hx___active,"__active");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Stage3D_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Stage3D_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Stage3D_obj::_hx___active,"__active");
};

#endif

hx::Class Stage3D_obj::__mClass;

static ::String Stage3D_obj_sStaticFields[] = {
	HX_HCSTRING("__active","\xe6","\xac","\x75","\xbe"),
	::String(null())
};

void Stage3D_obj::__register()
{
	hx::Object *dummy = new Stage3D_obj;
	Stage3D_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl.display.Stage3D","\xc5","\x0f","\x85","\x9c");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &Stage3D_obj::__GetStatic;
	__mClass->mSetStaticField = &Stage3D_obj::__SetStatic;
	__mClass->mMarkFunc = Stage3D_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(Stage3D_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Stage3D_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Stage3D_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Stage3D_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Stage3D_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Stage3D_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace openfl
} // end namespace display
