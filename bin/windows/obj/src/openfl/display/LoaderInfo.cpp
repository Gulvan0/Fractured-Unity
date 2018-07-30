// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_Loader
#include <openfl/display/Loader.h>
#endif
#ifndef INCLUDED_openfl_display_LoaderInfo
#include <openfl/display/LoaderInfo.h>
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
#ifndef INCLUDED_openfl_events_ProgressEvent
#include <openfl/events/ProgressEvent.h>
#endif
#ifndef INCLUDED_openfl_events_UncaughtErrorEvents
#include <openfl/events/UncaughtErrorEvents.h>
#endif
#ifndef INCLUDED_openfl_system_ApplicationDomain
#include <openfl/system/ApplicationDomain.h>
#endif
#ifndef INCLUDED_openfl_utils_ByteArrayData
#include <openfl/utils/ByteArrayData.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataInput
#include <openfl/utils/IDataInput.h>
#endif
#ifndef INCLUDED_openfl_utils_IDataOutput
#include <openfl/utils/IDataOutput.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_bc206267402385e1_49_new,"openfl.display.LoaderInfo","new",0xaabc917d,"openfl.display.LoaderInfo.new","openfl/display/LoaderInfo.hx",49,0x88528a51)
HX_LOCAL_STACK_FRAME(_hx_pos_bc206267402385e1_84___complete,"openfl.display.LoaderInfo","__complete",0x9858c05c,"openfl.display.LoaderInfo.__complete","openfl/display/LoaderInfo.hx",84,0x88528a51)
HX_LOCAL_STACK_FRAME(_hx_pos_bc206267402385e1_102___update,"openfl.display.LoaderInfo","__update",0x44ca06ec,"openfl.display.LoaderInfo.__update","openfl/display/LoaderInfo.hx",102,0x88528a51)
HX_LOCAL_STACK_FRAME(_hx_pos_bc206267402385e1_62_create,"openfl.display.LoaderInfo","create",0xe80075ff,"openfl.display.LoaderInfo.create","openfl/display/LoaderInfo.hx",62,0x88528a51)
HX_LOCAL_STACK_FRAME(_hx_pos_bc206267402385e1_24_boot,"openfl.display.LoaderInfo","boot",0xb25bbc75,"openfl.display.LoaderInfo.boot","openfl/display/LoaderInfo.hx",24,0x88528a51)
namespace openfl{
namespace display{

void LoaderInfo_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_bc206267402385e1_49_new)
HXLINE(  51)		super::__construct(null());
HXLINE(  53)		this->applicationDomain = ::openfl::_hx_system::ApplicationDomain_obj::currentDomain;
HXLINE(  54)		this->bytesLoaded = (int)0;
HXLINE(  55)		this->bytesTotal = (int)0;
HXLINE(  56)		this->childAllowsParent = true;
HXLINE(  57)		this->parameters =  ::Dynamic(hx::Anon_obj::Create(0));
            	}

Dynamic LoaderInfo_obj::__CreateEmpty() { return new LoaderInfo_obj; }

void *LoaderInfo_obj::_hx_vtable = 0;

Dynamic LoaderInfo_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< LoaderInfo_obj > _hx_result = new LoaderInfo_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool LoaderInfo_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1b123bf8) {
		return inClassId==(int)0x00000001 || inClassId==(int)0x1b123bf8;
	} else {
		return inClassId==(int)0x3c3575f3;
	}
}

void LoaderInfo_obj::_hx___complete(){
            	HX_GC_STACKFRAME(&_hx_pos_bc206267402385e1_84___complete)
HXDLIN(  84)		if (!(this->_hx___completed)) {
HXLINE(  86)			if ((this->bytesLoaded < this->bytesTotal)) {
HXLINE(  88)				this->bytesLoaded = this->bytesTotal;
            			}
HXLINE(  92)			this->_hx___update(this->bytesLoaded,this->bytesTotal);
HXLINE(  93)			this->_hx___completed = true;
HXLINE(  95)			this->dispatchEvent( ::openfl::events::Event_obj::__alloc( HX_CTX ,HX_("complete",b9,00,c8,7f),null(),null()));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(LoaderInfo_obj,_hx___complete,(void))

void LoaderInfo_obj::_hx___update(int bytesLoaded,int bytesTotal){
            	HX_GC_STACKFRAME(&_hx_pos_bc206267402385e1_102___update)
HXLINE( 104)		this->bytesLoaded = bytesLoaded;
HXLINE( 105)		this->bytesTotal = bytesTotal;
HXLINE( 107)		this->dispatchEvent( ::openfl::events::ProgressEvent_obj::__alloc( HX_CTX ,HX_("progress",ad,f7,2a,86),false,false,bytesLoaded,bytesTotal));
            	}


HX_DEFINE_DYNAMIC_FUNC2(LoaderInfo_obj,_hx___update,(void))

::String LoaderInfo_obj::_hx___rootURL;

 ::openfl::display::LoaderInfo LoaderInfo_obj::create( ::openfl::display::Loader loader){
            	HX_GC_STACKFRAME(&_hx_pos_bc206267402385e1_62_create)
HXLINE(  64)		 ::openfl::display::LoaderInfo loaderInfo =  ::openfl::display::LoaderInfo_obj::__alloc( HX_CTX );
HXLINE(  65)		loaderInfo->uncaughtErrorEvents =  ::openfl::events::UncaughtErrorEvents_obj::__alloc( HX_CTX );
HXLINE(  67)		if (hx::IsNotNull( loader )) {
HXLINE(  69)			loaderInfo->loader = loader;
            		}
            		else {
HXLINE(  73)			loaderInfo->url = ::openfl::display::LoaderInfo_obj::_hx___rootURL;
            		}
HXLINE(  77)		return loaderInfo;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(LoaderInfo_obj,create,return )


hx::ObjectPtr< LoaderInfo_obj > LoaderInfo_obj::__new() {
	hx::ObjectPtr< LoaderInfo_obj > __this = new LoaderInfo_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< LoaderInfo_obj > LoaderInfo_obj::__alloc(hx::Ctx *_hx_ctx) {
	LoaderInfo_obj *__this = (LoaderInfo_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(LoaderInfo_obj), true, "openfl.display.LoaderInfo"));
	*(void **)__this = LoaderInfo_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

LoaderInfo_obj::LoaderInfo_obj()
{
}

void LoaderInfo_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(LoaderInfo);
	HX_MARK_MEMBER_NAME(applicationDomain,"applicationDomain");
	HX_MARK_MEMBER_NAME(bytes,"bytes");
	HX_MARK_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_MARK_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_MARK_MEMBER_NAME(childAllowsParent,"childAllowsParent");
	HX_MARK_MEMBER_NAME(content,"content");
	HX_MARK_MEMBER_NAME(contentType,"contentType");
	HX_MARK_MEMBER_NAME(frameRate,"frameRate");
	HX_MARK_MEMBER_NAME(height,"height");
	HX_MARK_MEMBER_NAME(loader,"loader");
	HX_MARK_MEMBER_NAME(loaderURL,"loaderURL");
	HX_MARK_MEMBER_NAME(parameters,"parameters");
	HX_MARK_MEMBER_NAME(parentAllowsChild,"parentAllowsChild");
	HX_MARK_MEMBER_NAME(sameDomain,"sameDomain");
	HX_MARK_MEMBER_NAME(sharedEvents,"sharedEvents");
	HX_MARK_MEMBER_NAME(uncaughtErrorEvents,"uncaughtErrorEvents");
	HX_MARK_MEMBER_NAME(url,"url");
	HX_MARK_MEMBER_NAME(width,"width");
	HX_MARK_MEMBER_NAME(_hx___completed,"__completed");
	 ::openfl::events::EventDispatcher_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void LoaderInfo_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(applicationDomain,"applicationDomain");
	HX_VISIT_MEMBER_NAME(bytes,"bytes");
	HX_VISIT_MEMBER_NAME(bytesLoaded,"bytesLoaded");
	HX_VISIT_MEMBER_NAME(bytesTotal,"bytesTotal");
	HX_VISIT_MEMBER_NAME(childAllowsParent,"childAllowsParent");
	HX_VISIT_MEMBER_NAME(content,"content");
	HX_VISIT_MEMBER_NAME(contentType,"contentType");
	HX_VISIT_MEMBER_NAME(frameRate,"frameRate");
	HX_VISIT_MEMBER_NAME(height,"height");
	HX_VISIT_MEMBER_NAME(loader,"loader");
	HX_VISIT_MEMBER_NAME(loaderURL,"loaderURL");
	HX_VISIT_MEMBER_NAME(parameters,"parameters");
	HX_VISIT_MEMBER_NAME(parentAllowsChild,"parentAllowsChild");
	HX_VISIT_MEMBER_NAME(sameDomain,"sameDomain");
	HX_VISIT_MEMBER_NAME(sharedEvents,"sharedEvents");
	HX_VISIT_MEMBER_NAME(uncaughtErrorEvents,"uncaughtErrorEvents");
	HX_VISIT_MEMBER_NAME(url,"url");
	HX_VISIT_MEMBER_NAME(width,"width");
	HX_VISIT_MEMBER_NAME(_hx___completed,"__completed");
	 ::openfl::events::EventDispatcher_obj::__Visit(HX_VISIT_ARG);
}

hx::Val LoaderInfo_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"url") ) { return hx::Val( url ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"bytes") ) { return hx::Val( bytes ); }
		if (HX_FIELD_EQ(inName,"width") ) { return hx::Val( width ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { return hx::Val( height ); }
		if (HX_FIELD_EQ(inName,"loader") ) { return hx::Val( loader ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"content") ) { return hx::Val( content ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"__update") ) { return hx::Val( _hx___update_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"frameRate") ) { return hx::Val( frameRate ); }
		if (HX_FIELD_EQ(inName,"loaderURL") ) { return hx::Val( loaderURL ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { return hx::Val( bytesTotal ); }
		if (HX_FIELD_EQ(inName,"parameters") ) { return hx::Val( parameters ); }
		if (HX_FIELD_EQ(inName,"sameDomain") ) { return hx::Val( sameDomain ); }
		if (HX_FIELD_EQ(inName,"__complete") ) { return hx::Val( _hx___complete_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { return hx::Val( bytesLoaded ); }
		if (HX_FIELD_EQ(inName,"contentType") ) { return hx::Val( contentType ); }
		if (HX_FIELD_EQ(inName,"__completed") ) { return hx::Val( _hx___completed ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"sharedEvents") ) { return hx::Val( sharedEvents ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"applicationDomain") ) { return hx::Val( applicationDomain ); }
		if (HX_FIELD_EQ(inName,"childAllowsParent") ) { return hx::Val( childAllowsParent ); }
		if (HX_FIELD_EQ(inName,"parentAllowsChild") ) { return hx::Val( parentAllowsChild ); }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"uncaughtErrorEvents") ) { return hx::Val( uncaughtErrorEvents ); }
	}
	return super::__Field(inName,inCallProp);
}

bool LoaderInfo_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"create") ) { outValue = create_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"__rootURL") ) { outValue = ( _hx___rootURL ); return true; }
	}
	return false;
}

hx::Val LoaderInfo_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"url") ) { url=inValue.Cast< ::String >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"bytes") ) { bytes=inValue.Cast<  ::openfl::utils::ByteArrayData >(); return inValue; }
		if (HX_FIELD_EQ(inName,"width") ) { width=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"height") ) { height=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"loader") ) { loader=inValue.Cast<  ::openfl::display::Loader >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"content") ) { content=inValue.Cast<  ::openfl::display::DisplayObject >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"frameRate") ) { frameRate=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"loaderURL") ) { loaderURL=inValue.Cast< ::String >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"bytesTotal") ) { bytesTotal=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"parameters") ) { parameters=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"sameDomain") ) { sameDomain=inValue.Cast< bool >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"bytesLoaded") ) { bytesLoaded=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"contentType") ) { contentType=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"__completed") ) { _hx___completed=inValue.Cast< bool >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"sharedEvents") ) { sharedEvents=inValue.Cast<  ::openfl::events::EventDispatcher >(); return inValue; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"applicationDomain") ) { applicationDomain=inValue.Cast<  ::openfl::_hx_system::ApplicationDomain >(); return inValue; }
		if (HX_FIELD_EQ(inName,"childAllowsParent") ) { childAllowsParent=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"parentAllowsChild") ) { parentAllowsChild=inValue.Cast< bool >(); return inValue; }
		break;
	case 19:
		if (HX_FIELD_EQ(inName,"uncaughtErrorEvents") ) { uncaughtErrorEvents=inValue.Cast<  ::openfl::events::UncaughtErrorEvents >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

bool LoaderInfo_obj::__SetStatic(const ::String &inName,Dynamic &ioValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 9:
		if (HX_FIELD_EQ(inName,"__rootURL") ) { _hx___rootURL=ioValue.Cast< ::String >(); return true; }
	}
	return false;
}

void LoaderInfo_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("applicationDomain","\xb4","\x2c","\xdb","\xa3"));
	outFields->push(HX_HCSTRING("bytes","\x6b","\x08","\x98","\xbd"));
	outFields->push(HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99"));
	outFields->push(HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45"));
	outFields->push(HX_HCSTRING("childAllowsParent","\x50","\xb0","\x90","\x17"));
	outFields->push(HX_HCSTRING("content","\x39","\x8d","\x77","\x19"));
	outFields->push(HX_HCSTRING("contentType","\x93","\x3c","\x7b","\x2a"));
	outFields->push(HX_HCSTRING("frameRate","\xad","\x11","\x25","\x39"));
	outFields->push(HX_HCSTRING("height","\xe7","\x07","\x4c","\x02"));
	outFields->push(HX_HCSTRING("loader","\x13","\x48","\x6f","\x58"));
	outFields->push(HX_HCSTRING("loaderURL","\x1c","\x8d","\x1d","\xfb"));
	outFields->push(HX_HCSTRING("parameters","\xaa","\xbe","\x7e","\x51"));
	outFields->push(HX_HCSTRING("parentAllowsChild","\x68","\x78","\xd5","\x78"));
	outFields->push(HX_HCSTRING("sameDomain","\x4a","\x39","\x74","\x73"));
	outFields->push(HX_HCSTRING("sharedEvents","\x9e","\x2b","\x5a","\x49"));
	outFields->push(HX_HCSTRING("uncaughtErrorEvents","\x6c","\x14","\x2c","\x48"));
	outFields->push(HX_HCSTRING("url","\x6f","\x2b","\x59","\x00"));
	outFields->push(HX_HCSTRING("width","\x06","\xb6","\x62","\xca"));
	outFields->push(HX_HCSTRING("__completed","\x6b","\xea","\x64","\x7d"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo LoaderInfo_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::openfl::_hx_system::ApplicationDomain*/ ,(int)offsetof(LoaderInfo_obj,applicationDomain),HX_HCSTRING("applicationDomain","\xb4","\x2c","\xdb","\xa3")},
	{hx::fsObject /*::openfl::utils::ByteArrayData*/ ,(int)offsetof(LoaderInfo_obj,bytes),HX_HCSTRING("bytes","\x6b","\x08","\x98","\xbd")},
	{hx::fsInt,(int)offsetof(LoaderInfo_obj,bytesLoaded),HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99")},
	{hx::fsInt,(int)offsetof(LoaderInfo_obj,bytesTotal),HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45")},
	{hx::fsBool,(int)offsetof(LoaderInfo_obj,childAllowsParent),HX_HCSTRING("childAllowsParent","\x50","\xb0","\x90","\x17")},
	{hx::fsObject /*::openfl::display::DisplayObject*/ ,(int)offsetof(LoaderInfo_obj,content),HX_HCSTRING("content","\x39","\x8d","\x77","\x19")},
	{hx::fsString,(int)offsetof(LoaderInfo_obj,contentType),HX_HCSTRING("contentType","\x93","\x3c","\x7b","\x2a")},
	{hx::fsFloat,(int)offsetof(LoaderInfo_obj,frameRate),HX_HCSTRING("frameRate","\xad","\x11","\x25","\x39")},
	{hx::fsInt,(int)offsetof(LoaderInfo_obj,height),HX_HCSTRING("height","\xe7","\x07","\x4c","\x02")},
	{hx::fsObject /*::openfl::display::Loader*/ ,(int)offsetof(LoaderInfo_obj,loader),HX_HCSTRING("loader","\x13","\x48","\x6f","\x58")},
	{hx::fsString,(int)offsetof(LoaderInfo_obj,loaderURL),HX_HCSTRING("loaderURL","\x1c","\x8d","\x1d","\xfb")},
	{hx::fsObject /*Dynamic*/ ,(int)offsetof(LoaderInfo_obj,parameters),HX_HCSTRING("parameters","\xaa","\xbe","\x7e","\x51")},
	{hx::fsBool,(int)offsetof(LoaderInfo_obj,parentAllowsChild),HX_HCSTRING("parentAllowsChild","\x68","\x78","\xd5","\x78")},
	{hx::fsBool,(int)offsetof(LoaderInfo_obj,sameDomain),HX_HCSTRING("sameDomain","\x4a","\x39","\x74","\x73")},
	{hx::fsObject /*::openfl::events::EventDispatcher*/ ,(int)offsetof(LoaderInfo_obj,sharedEvents),HX_HCSTRING("sharedEvents","\x9e","\x2b","\x5a","\x49")},
	{hx::fsObject /*::openfl::events::UncaughtErrorEvents*/ ,(int)offsetof(LoaderInfo_obj,uncaughtErrorEvents),HX_HCSTRING("uncaughtErrorEvents","\x6c","\x14","\x2c","\x48")},
	{hx::fsString,(int)offsetof(LoaderInfo_obj,url),HX_HCSTRING("url","\x6f","\x2b","\x59","\x00")},
	{hx::fsInt,(int)offsetof(LoaderInfo_obj,width),HX_HCSTRING("width","\x06","\xb6","\x62","\xca")},
	{hx::fsBool,(int)offsetof(LoaderInfo_obj,_hx___completed),HX_HCSTRING("__completed","\x6b","\xea","\x64","\x7d")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo LoaderInfo_obj_sStaticStorageInfo[] = {
	{hx::fsString,(void *) &LoaderInfo_obj::_hx___rootURL,HX_HCSTRING("__rootURL","\x4d","\x2b","\xe2","\x9d")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String LoaderInfo_obj_sMemberFields[] = {
	HX_HCSTRING("applicationDomain","\xb4","\x2c","\xdb","\xa3"),
	HX_HCSTRING("bytes","\x6b","\x08","\x98","\xbd"),
	HX_HCSTRING("bytesLoaded","\xd0","\x66","\xca","\x99"),
	HX_HCSTRING("bytesTotal","\x59","\x57","\xda","\x45"),
	HX_HCSTRING("childAllowsParent","\x50","\xb0","\x90","\x17"),
	HX_HCSTRING("content","\x39","\x8d","\x77","\x19"),
	HX_HCSTRING("contentType","\x93","\x3c","\x7b","\x2a"),
	HX_HCSTRING("frameRate","\xad","\x11","\x25","\x39"),
	HX_HCSTRING("height","\xe7","\x07","\x4c","\x02"),
	HX_HCSTRING("loader","\x13","\x48","\x6f","\x58"),
	HX_HCSTRING("loaderURL","\x1c","\x8d","\x1d","\xfb"),
	HX_HCSTRING("parameters","\xaa","\xbe","\x7e","\x51"),
	HX_HCSTRING("parentAllowsChild","\x68","\x78","\xd5","\x78"),
	HX_HCSTRING("sameDomain","\x4a","\x39","\x74","\x73"),
	HX_HCSTRING("sharedEvents","\x9e","\x2b","\x5a","\x49"),
	HX_HCSTRING("uncaughtErrorEvents","\x6c","\x14","\x2c","\x48"),
	HX_HCSTRING("url","\x6f","\x2b","\x59","\x00"),
	HX_HCSTRING("width","\x06","\xb6","\x62","\xca"),
	HX_HCSTRING("__completed","\x6b","\xea","\x64","\x7d"),
	HX_HCSTRING("__complete","\xd9","\x73","\x00","\x23"),
	HX_HCSTRING("__update","\x29","\xf1","\x34","\x2f"),
	::String(null()) };

static void LoaderInfo_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LoaderInfo_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(LoaderInfo_obj::_hx___rootURL,"__rootURL");
};

#ifdef HXCPP_VISIT_ALLOCS
static void LoaderInfo_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LoaderInfo_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(LoaderInfo_obj::_hx___rootURL,"__rootURL");
};

#endif

hx::Class LoaderInfo_obj::__mClass;

static ::String LoaderInfo_obj_sStaticFields[] = {
	HX_HCSTRING("__rootURL","\x4d","\x2b","\xe2","\x9d"),
	HX_HCSTRING("create","\xfc","\x66","\x0f","\x7c"),
	::String(null())
};

void LoaderInfo_obj::__register()
{
	hx::Object *dummy = new LoaderInfo_obj;
	LoaderInfo_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("openfl.display.LoaderInfo","\x0b","\x0f","\x65","\x1d");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &LoaderInfo_obj::__GetStatic;
	__mClass->mSetStaticField = &LoaderInfo_obj::__SetStatic;
	__mClass->mMarkFunc = LoaderInfo_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(LoaderInfo_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(LoaderInfo_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< LoaderInfo_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = LoaderInfo_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LoaderInfo_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LoaderInfo_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void LoaderInfo_obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_bc206267402385e1_24_boot)
HXDLIN(  24)		_hx___rootURL = HX_("",00,00,00,00);
            	}
}

} // end namespace openfl
} // end namespace display
