// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_lime_text__TextDirection_TextDirection_Impl_
#include <lime/text/_TextDirection/TextDirection_Impl_.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_22_reverse,"lime.text._TextDirection.TextDirection_Impl_","reverse",0x86baba53,"lime.text._TextDirection.TextDirection_Impl_.reverse","lime/text/TextDirection.hx",22,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_29_toString,"lime.text._TextDirection.TextDirection_Impl_","toString",0x13615a5b,"lime.text._TextDirection.TextDirection_Impl_.toString","lime/text/TextDirection.hx",29,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_44_get_backward,"lime.text._TextDirection.TextDirection_Impl_","get_backward",0xc0bd1d1b,"lime.text._TextDirection.TextDirection_Impl_.get_backward","lime/text/TextDirection.hx",44,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_51_get_forward,"lime.text._TextDirection.TextDirection_Impl_","get_forward",0x75faaf8d,"lime.text._TextDirection.TextDirection_Impl_.get_forward","lime/text/TextDirection.hx",51,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_58_get_horizontal,"lime.text._TextDirection.TextDirection_Impl_","get_horizontal",0x91e4fc1c,"lime.text._TextDirection.TextDirection_Impl_.get_horizontal","lime/text/TextDirection.hx",58,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_65_get_vertical,"lime.text._TextDirection.TextDirection_Impl_","get_vertical",0x03b9fdae,"lime.text._TextDirection.TextDirection_Impl_.get_vertical","lime/text/TextDirection.hx",65,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_7_boot,"lime.text._TextDirection.TextDirection_Impl_","boot",0x169dca61,"lime.text._TextDirection.TextDirection_Impl_.boot","lime/text/TextDirection.hx",7,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_8_boot,"lime.text._TextDirection.TextDirection_Impl_","boot",0x169dca61,"lime.text._TextDirection.TextDirection_Impl_.boot","lime/text/TextDirection.hx",8,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_9_boot,"lime.text._TextDirection.TextDirection_Impl_","boot",0x169dca61,"lime.text._TextDirection.TextDirection_Impl_.boot","lime/text/TextDirection.hx",9,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_10_boot,"lime.text._TextDirection.TextDirection_Impl_","boot",0x169dca61,"lime.text._TextDirection.TextDirection_Impl_.boot","lime/text/TextDirection.hx",10,0x7a217b74)
HX_LOCAL_STACK_FRAME(_hx_pos_91f9de5fd7125682_11_boot,"lime.text._TextDirection.TextDirection_Impl_","boot",0x169dca61,"lime.text._TextDirection.TextDirection_Impl_.boot","lime/text/TextDirection.hx",11,0x7a217b74)
namespace lime{
namespace text{
namespace _TextDirection{

void TextDirection_Impl__obj::__construct() { }

Dynamic TextDirection_Impl__obj::__CreateEmpty() { return new TextDirection_Impl__obj; }

void *TextDirection_Impl__obj::_hx_vtable = 0;

Dynamic TextDirection_Impl__obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< TextDirection_Impl__obj > _hx_result = new TextDirection_Impl__obj();
	_hx_result->__construct();
	return _hx_result;
}

bool TextDirection_Impl__obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x64fa75fd;
}

int TextDirection_Impl__obj::INVALID;

int TextDirection_Impl__obj::LEFT_TO_RIGHT;

int TextDirection_Impl__obj::RIGHT_TO_LEFT;

int TextDirection_Impl__obj::TOP_TO_BOTTOM;

int TextDirection_Impl__obj::BOTTOM_TO_TOP;

void TextDirection_Impl__obj::reverse(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_22_reverse)
HXDLIN(  22)		this1 = ((int)this1 ^ (int)(int)1);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,reverse,(void))

::String TextDirection_Impl__obj::toString(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_29_toString)
HXDLIN(  29)		switch((int)(this1)){
            			case (int)4: {
HXLINE(  31)				return HX_("leftToRight",1a,97,7b,b5);
            			}
            			break;
            			case (int)5: {
HXLINE(  32)				return HX_("rightToLeft",1e,40,ee,e6);
            			}
            			break;
            			case (int)6: {
HXLINE(  33)				return HX_("topToBottom",7b,ce,19,75);
            			}
            			break;
            			case (int)7: {
HXLINE(  34)				return HX_("bottomToTop",ef,ac,aa,79);
            			}
            			break;
            			default:{
HXLINE(  35)				return HX_("",00,00,00,00);
            			}
            		}
HXLINE(  29)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,toString,return )

bool TextDirection_Impl__obj::get_backward(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_44_get_backward)
HXDLIN(  44)		return (((int)this1 & (int)(int)-3) == (int)5);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,get_backward,return )

bool TextDirection_Impl__obj::get_forward(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_51_get_forward)
HXDLIN(  51)		return (((int)this1 & (int)(int)-3) == (int)4);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,get_forward,return )

bool TextDirection_Impl__obj::get_horizontal(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_58_get_horizontal)
HXDLIN(  58)		return (((int)this1 & (int)(int)-2) == (int)4);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,get_horizontal,return )

bool TextDirection_Impl__obj::get_vertical(int this1){
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_65_get_vertical)
HXDLIN(  65)		return (((int)this1 & (int)(int)-2) == (int)6);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(TextDirection_Impl__obj,get_vertical,return )


TextDirection_Impl__obj::TextDirection_Impl__obj()
{
}

bool TextDirection_Impl__obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"reverse") ) { outValue = reverse_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"toString") ) { outValue = toString_dyn(); return true; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"get_forward") ) { outValue = get_forward_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"get_backward") ) { outValue = get_backward_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"get_vertical") ) { outValue = get_vertical_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"get_horizontal") ) { outValue = get_horizontal_dyn(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *TextDirection_Impl__obj_sMemberStorageInfo = 0;
static hx::StaticInfo TextDirection_Impl__obj_sStaticStorageInfo[] = {
	{hx::fsInt,(void *) &TextDirection_Impl__obj::INVALID,HX_HCSTRING("INVALID","\xd7","\xae","\x1b","\xbb")},
	{hx::fsInt,(void *) &TextDirection_Impl__obj::LEFT_TO_RIGHT,HX_HCSTRING("LEFT_TO_RIGHT","\x30","\x11","\x7b","\x07")},
	{hx::fsInt,(void *) &TextDirection_Impl__obj::RIGHT_TO_LEFT,HX_HCSTRING("RIGHT_TO_LEFT","\xc8","\x1d","\x8d","\x7b")},
	{hx::fsInt,(void *) &TextDirection_Impl__obj::TOP_TO_BOTTOM,HX_HCSTRING("TOP_TO_BOTTOM","\xe5","\x52","\x9a","\x32")},
	{hx::fsInt,(void *) &TextDirection_Impl__obj::BOTTOM_TO_TOP,HX_HCSTRING("BOTTOM_TO_TOP","\x85","\xec","\xed","\xb3")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static void TextDirection_Impl__obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::INVALID,"INVALID");
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::LEFT_TO_RIGHT,"LEFT_TO_RIGHT");
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::RIGHT_TO_LEFT,"RIGHT_TO_LEFT");
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::TOP_TO_BOTTOM,"TOP_TO_BOTTOM");
	HX_MARK_MEMBER_NAME(TextDirection_Impl__obj::BOTTOM_TO_TOP,"BOTTOM_TO_TOP");
};

#ifdef HXCPP_VISIT_ALLOCS
static void TextDirection_Impl__obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::INVALID,"INVALID");
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::LEFT_TO_RIGHT,"LEFT_TO_RIGHT");
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::RIGHT_TO_LEFT,"RIGHT_TO_LEFT");
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::TOP_TO_BOTTOM,"TOP_TO_BOTTOM");
	HX_VISIT_MEMBER_NAME(TextDirection_Impl__obj::BOTTOM_TO_TOP,"BOTTOM_TO_TOP");
};

#endif

hx::Class TextDirection_Impl__obj::__mClass;

static ::String TextDirection_Impl__obj_sStaticFields[] = {
	HX_HCSTRING("INVALID","\xd7","\xae","\x1b","\xbb"),
	HX_HCSTRING("LEFT_TO_RIGHT","\x30","\x11","\x7b","\x07"),
	HX_HCSTRING("RIGHT_TO_LEFT","\xc8","\x1d","\x8d","\x7b"),
	HX_HCSTRING("TOP_TO_BOTTOM","\xe5","\x52","\x9a","\x32"),
	HX_HCSTRING("BOTTOM_TO_TOP","\x85","\xec","\xed","\xb3"),
	HX_HCSTRING("reverse","\x22","\x39","\xfc","\x1a"),
	HX_HCSTRING("toString","\xac","\xd0","\x6e","\x38"),
	HX_HCSTRING("get_backward","\xec","\x8f","\x32","\xdc"),
	HX_HCSTRING("get_forward","\xdc","\x41","\xc5","\x6b"),
	HX_HCSTRING("get_horizontal","\x2d","\x85","\xb9","\x8b"),
	HX_HCSTRING("get_vertical","\x7f","\x70","\x2f","\x1f"),
	::String(null())
};

void TextDirection_Impl__obj::__register()
{
	hx::Object *dummy = new TextDirection_Impl__obj;
	TextDirection_Impl__obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lime.text._TextDirection.TextDirection_Impl_","\x9f","\xc8","\xb5","\x49");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &TextDirection_Impl__obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = TextDirection_Impl__obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(TextDirection_Impl__obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< TextDirection_Impl__obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = TextDirection_Impl__obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = TextDirection_Impl__obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = TextDirection_Impl__obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

void TextDirection_Impl__obj::__boot()
{
{
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_7_boot)
HXDLIN(   7)		INVALID = (int)0;
            	}
{
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_8_boot)
HXDLIN(   8)		LEFT_TO_RIGHT = (int)4;
            	}
{
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_9_boot)
HXDLIN(   9)		RIGHT_TO_LEFT = (int)5;
            	}
{
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_10_boot)
HXDLIN(  10)		TOP_TO_BOTTOM = (int)6;
            	}
{
            	HX_STACKFRAME(&_hx_pos_91f9de5fd7125682_11_boot)
HXDLIN(  11)		BOTTOM_TO_TOP = (int)7;
            	}
}

} // end namespace lime
} // end namespace text
} // end namespace _TextDirection
