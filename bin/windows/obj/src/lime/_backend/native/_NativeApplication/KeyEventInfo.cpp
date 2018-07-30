// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_lime__backend_native__NativeApplication_KeyEventInfo
#include <lime/_backend/native/_NativeApplication/KeyEventInfo.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_4be9d6956d8ea946_936_new,"lime._backend.native._NativeApplication.KeyEventInfo","new",0x9d1330f8,"lime._backend.native._NativeApplication.KeyEventInfo.new","lime/_backend/native/NativeApplication.hx",936,0xb13849fd)
HX_LOCAL_STACK_FRAME(_hx_pos_4be9d6956d8ea946_948_clone,"lime._backend.native._NativeApplication.KeyEventInfo","clone",0x1c2dc9f5,"lime._backend.native._NativeApplication.KeyEventInfo.clone","lime/_backend/native/NativeApplication.hx",948,0xb13849fd)
namespace lime{
namespace _backend{
namespace native{
namespace _NativeApplication{

void KeyEventInfo_obj::__construct( ::Dynamic type,hx::Null< int >  __o_windowID,hx::Null< int >  __o_keyCode,hx::Null< int >  __o_modifier){
int windowID = __o_windowID.Default(0);
int keyCode = __o_keyCode.Default(0);
int modifier = __o_modifier.Default(0);
            	HX_STACKFRAME(&_hx_pos_4be9d6956d8ea946_936_new)
HXLINE( 938)		this->type = type;
HXLINE( 939)		this->windowID = windowID;
HXLINE( 940)		this->keyCode = keyCode;
HXLINE( 941)		this->modifier = modifier;
            	}

Dynamic KeyEventInfo_obj::__CreateEmpty() { return new KeyEventInfo_obj; }

void *KeyEventInfo_obj::_hx_vtable = 0;

Dynamic KeyEventInfo_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< KeyEventInfo_obj > _hx_result = new KeyEventInfo_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool KeyEventInfo_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x7b2e1704;
}

 ::lime::_backend::native::_NativeApplication::KeyEventInfo KeyEventInfo_obj::clone(){
            	HX_GC_STACKFRAME(&_hx_pos_4be9d6956d8ea946_948_clone)
HXDLIN( 948)		return  ::lime::_backend::native::_NativeApplication::KeyEventInfo_obj::__alloc( HX_CTX ,this->type,this->windowID,this->keyCode,this->modifier);
            	}


HX_DEFINE_DYNAMIC_FUNC0(KeyEventInfo_obj,clone,return )


KeyEventInfo_obj::KeyEventInfo_obj()
{
}

hx::Val KeyEventInfo_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"type") ) { return hx::Val( type ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return hx::Val( clone_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"keyCode") ) { return hx::Val( keyCode ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"modifier") ) { return hx::Val( modifier ); }
		if (HX_FIELD_EQ(inName,"windowID") ) { return hx::Val( windowID ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val KeyEventInfo_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"type") ) { type=inValue.Cast< int >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"keyCode") ) { keyCode=inValue.Cast< int >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"modifier") ) { modifier=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"windowID") ) { windowID=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void KeyEventInfo_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("keyCode","\x6c","\x22","\x9e","\x9b"));
	outFields->push(HX_HCSTRING("modifier","\x57","\xdb","\xc7","\x16"));
	outFields->push(HX_HCSTRING("type","\xba","\xf2","\x08","\x4d"));
	outFields->push(HX_HCSTRING("windowID","\xcb","\xaf","\xcd","\x7d"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo KeyEventInfo_obj_sMemberStorageInfo[] = {
	{hx::fsInt,(int)offsetof(KeyEventInfo_obj,keyCode),HX_HCSTRING("keyCode","\x6c","\x22","\x9e","\x9b")},
	{hx::fsInt,(int)offsetof(KeyEventInfo_obj,modifier),HX_HCSTRING("modifier","\x57","\xdb","\xc7","\x16")},
	{hx::fsInt,(int)offsetof(KeyEventInfo_obj,type),HX_HCSTRING("type","\xba","\xf2","\x08","\x4d")},
	{hx::fsInt,(int)offsetof(KeyEventInfo_obj,windowID),HX_HCSTRING("windowID","\xcb","\xaf","\xcd","\x7d")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *KeyEventInfo_obj_sStaticStorageInfo = 0;
#endif

static ::String KeyEventInfo_obj_sMemberFields[] = {
	HX_HCSTRING("keyCode","\x6c","\x22","\x9e","\x9b"),
	HX_HCSTRING("modifier","\x57","\xdb","\xc7","\x16"),
	HX_HCSTRING("type","\xba","\xf2","\x08","\x4d"),
	HX_HCSTRING("windowID","\xcb","\xaf","\xcd","\x7d"),
	HX_HCSTRING("clone","\x5d","\x13","\x63","\x48"),
	::String(null()) };

static void KeyEventInfo_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(KeyEventInfo_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void KeyEventInfo_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(KeyEventInfo_obj::__mClass,"__mClass");
};

#endif

hx::Class KeyEventInfo_obj::__mClass;

void KeyEventInfo_obj::__register()
{
	hx::Object *dummy = new KeyEventInfo_obj;
	KeyEventInfo_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lime._backend.native._NativeApplication.KeyEventInfo","\x06","\x95","\x01","\x41");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = KeyEventInfo_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(KeyEventInfo_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< KeyEventInfo_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = KeyEventInfo_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = KeyEventInfo_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = KeyEventInfo_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lime
} // end namespace _backend
} // end namespace native
} // end namespace _NativeApplication
