// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_95f339a1d026d52c
#define INCLUDED_95f339a1d026d52c
#include "hxMath.h"
#endif
#ifndef INCLUDED_Assets
#include <Assets.h>
#endif
#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_MathUtils
#include <MathUtils.h>
#endif
#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_battle_Ability
#include <battle/Ability.h>
#endif
#ifndef INCLUDED_battle_Active
#include <battle/Active.h>
#endif
#ifndef INCLUDED_battle_enums_AbilityType
#include <battle/enums/AbilityType.h>
#endif
#ifndef INCLUDED_battle_struct_Countdown
#include <battle/struct/Countdown.h>
#endif
#ifndef INCLUDED_battle_vision_AbilityCell
#include <battle/vision/AbilityCell.h>
#endif
#ifndef INCLUDED_graphic_Fonts
#include <graphic/Fonts.h>
#endif
#ifndef INCLUDED_graphic_HintTextfield
#include <graphic/HintTextfield.h>
#endif
#ifndef INCLUDED_hxassert_Assert
#include <hxassert/Assert.h>
#endif
#ifndef INCLUDED_lime_app_IModule
#include <lime/app/IModule.h>
#endif
#ifndef INCLUDED_lime_text__UTF8String_UTF8String_Impl_
#include <lime/text/_UTF8String/UTF8String_Impl_.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_Graphics
#include <openfl/display/Graphics.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl_display_Shape
#include <openfl/display/Shape.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_display_Stage
#include <openfl/display/Stage.h>
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
#ifndef INCLUDED_openfl_events_MouseEvent
#include <openfl/events/MouseEvent.h>
#endif
#ifndef INCLUDED_openfl_filters_BitmapFilter
#include <openfl/filters/BitmapFilter.h>
#endif
#ifndef INCLUDED_openfl_filters_DropShadowFilter
#include <openfl/filters/DropShadowFilter.h>
#endif
#ifndef INCLUDED_openfl_filters_GlowFilter
#include <openfl/filters/GlowFilter.h>
#endif
#ifndef INCLUDED_openfl_geom_Point
#include <openfl/geom/Point.h>
#endif
#ifndef INCLUDED_openfl_geom_Rectangle
#include <openfl/geom/Rectangle.h>
#endif
#ifndef INCLUDED_openfl_text_TextField
#include <openfl/text/TextField.h>
#endif
#ifndef INCLUDED_openfl_text_TextFormat
#include <openfl/text/TextFormat.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_111_new,"battle.vision.AbilityCell","new",0xab02d72e,"battle.vision.AbilityCell.new","battle/vision/AbilityCell.hx",111,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_39_decrementCooldown,"battle.vision.AbilityCell","decrementCooldown",0x96cedc2c,"battle.vision.AbilityCell.decrementCooldown","battle/vision/AbilityCell.hx",39,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_56_changeCooldown,"battle.vision.AbilityCell","changeCooldown",0x3d2a792d,"battle.vision.AbilityCell.changeCooldown","battle/vision/AbilityCell.hx",56,0x605e9222)
static const ::String _hx_array_data_3fe8683c_7[] = {
	HX_("Assertion failed: value <= cd.keyValue",d0,43,93,de),
};
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_71_updateCooldown,"battle.vision.AbilityCell","updateCooldown",0x19192ec6,"battle.vision.AbilityCell.updateCooldown","battle/vision/AbilityCell.hx",71,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_76_moveHandler,"battle.vision.AbilityCell","moveHandler",0xf6b96d87,"battle.vision.AbilityCell.moveHandler","battle/vision/AbilityCell.hx",76,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_96_hintHeader,"battle.vision.AbilityCell","hintHeader",0x0eb5a966,"battle.vision.AbilityCell.hintHeader","battle/vision/AbilityCell.hx",96,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_100_hintText,"battle.vision.AbilityCell","hintText",0x04fb9446,"battle.vision.AbilityCell.hintText","battle/vision/AbilityCell.hx",100,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_142_init,"battle.vision.AbilityCell","init",0xf4322882,"battle.vision.AbilityCell.init","battle/vision/AbilityCell.hx",142,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_148_setCDText,"battle.vision.AbilityCell","setCDText",0xa30bae5e,"battle.vision.AbilityCell.setCDText","battle/vision/AbilityCell.hx",148,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_162_setManaText,"battle.vision.AbilityCell","setManaText",0x31d7d364,"battle.vision.AbilityCell.setManaText","battle/vision/AbilityCell.hx",162,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_176_setButtonText,"battle.vision.AbilityCell","setButtonText",0xbd554e4f,"battle.vision.AbilityCell.setButtonText","battle/vision/AbilityCell.hx",176,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_190_drawSegments,"battle.vision.AbilityCell","drawSegments",0xa64728f6,"battle.vision.AbilityCell.drawSegments","battle/vision/AbilityCell.hx",190,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_232_iconVertices,"battle.vision.AbilityCell","iconVertices",0x9780b404,"battle.vision.AbilityCell.iconVertices","battle/vision/AbilityCell.hx",232,0x605e9222)
HX_LOCAL_STACK_FRAME(_hx_pos_d9cfa635af54f7ed_249_drawSeg,"battle.vision.AbilityCell","drawSeg",0x2e0d07bf,"battle.vision.AbilityCell.drawSeg","battle/vision/AbilityCell.hx",249,0x605e9222)
namespace battle{
namespace vision{

void AbilityCell_obj::__construct( ::battle::Ability ab,::String button){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_111_new)
HXLINE( 112)		super::__construct();
HXLINE( 113)		this->icon = ::Assets_obj::getBattleAbility(ab->id);
HXLINE( 114)		this->add(this->icon,(int)0,(int)0);
HXLINE( 115)		bool _hx_tmp;
HXDLIN( 115)		if (hx::IsNotEq( ab->id,::ID_obj::EmptyAbility_dyn() )) {
HXLINE( 115)			_hx_tmp = hx::IsEq( ab->id,::ID_obj::LockAbility_dyn() );
            		}
            		else {
HXLINE( 115)			_hx_tmp = true;
            		}
HXDLIN( 115)		if (_hx_tmp) {
HXLINE( 116)			return;
            		}
HXLINE( 118)		if (hx::IsEq( ab->type,::battle::enums::AbilityType_obj::Active_dyn() )) {
HXLINE( 120)			 ::battle::Active a = ( ( ::battle::Active)(ab) );
HXLINE( 121)			int _hx_tmp1 = a->get_cooldown();
HXDLIN( 121)			this->cd =  ::battle::_hx_struct::Countdown_obj::__alloc( HX_CTX ,_hx_tmp1,a->get_maxCooldown());
HXLINE( 122)			this->setManaText(a->manacost);
HXLINE( 123)			this->setButtonText(button);
HXLINE( 124)			this->cdSegments = ::Array_obj< ::Dynamic>::__new(0);
HXLINE( 125)			this->drawSegments(a->get_maxCooldown());
HXLINE( 126)			this->setCDText();
HXLINE( 127)			this->changeCooldown(a->get_cooldown());
HXLINE( 129)			this->add(this->buttonText,(int)2,(int)1);
HXLINE( 130)			this->add(this->manacostText,(int)38,(int)38);
HXLINE( 131)			{
HXLINE( 131)				int _g = (int)0;
HXDLIN( 131)				::Array< ::Dynamic> _g1 = this->cdSegments;
HXDLIN( 131)				while((_g < _g1->length)){
HXLINE( 131)					 ::openfl::display::Shape seg = _g1->__get(_g).StaticCast<  ::openfl::display::Shape >();
HXDLIN( 131)					_g = (_g + (int)1);
HXLINE( 132)					this->add(seg,(int)28,(int)28);
            				}
            			}
HXLINE( 133)			this->add(this->cdText,(int)0,(int)4);
            		}
HXLINE( 136)		::String _hx_tmp2 = this->hintHeader(ab);
HXDLIN( 136)		this->hint =  ::graphic::HintTextfield_obj::__alloc( HX_CTX ,_hx_tmp2,this->hintText(ab));
HXLINE( 137)		this->hintVisible = false;
HXLINE( 138)		this->addEventListener(HX_("addedToStage",63,22,55,0c),this->init_dyn(),null(),null(),null());
            	}

Dynamic AbilityCell_obj::__CreateEmpty() { return new AbilityCell_obj; }

void *AbilityCell_obj::_hx_vtable = 0;

Dynamic AbilityCell_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< AbilityCell_obj > _hx_result = new AbilityCell_obj();
	_hx_result->__construct(inArgs[0],inArgs[1]);
	return _hx_result;
}

bool AbilityCell_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1b123bf8) {
		if (inClassId<=(int)0x17120186) {
			if (inClassId<=(int)0x0ddfced7) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x0ddfced7;
			} else {
				return inClassId==(int)0x17120186;
			}
		} else {
			return inClassId==(int)0x19c29573 || inClassId==(int)0x1b123bf8;
		}
	} else {
		if (inClassId<=(int)0x3f2b00af) {
			return inClassId==(int)0x2340f3c8 || inClassId==(int)0x3f2b00af;
		} else {
			return inClassId==(int)0x739fd0b8;
		}
	}
}

void AbilityCell_obj::decrementCooldown(){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_39_decrementCooldown)
HXDLIN(  39)		if ((this->cd->value > (int)0)) {
HXLINE(  41)			{
HXLINE(  41)				int _g = (int)0;
HXDLIN(  41)				::Array< ::Dynamic> _g1 = this->cdSegments;
HXDLIN(  41)				while((_g < _g1->length)){
HXLINE(  41)					 ::openfl::display::Shape seg = _g1->__get(_g).StaticCast<  ::openfl::display::Shape >();
HXDLIN(  41)					_g = (_g + (int)1);
HXLINE(  42)					if ((seg->get_visible() == true)) {
HXLINE(  44)						seg->set_visible(false);
HXLINE(  45)						goto _hx_goto_2;
            					}
            				}
            				_hx_goto_2:;
            			}
HXLINE(  47)			this->cd->value--;
HXLINE(  48)			this->remove(this->cdText);
HXLINE(  49)			this->setCDText();
HXLINE(  50)			 ::openfl::text::TextField _hx_tmp = this->cdText;
HXDLIN(  50)			::String _hx_tmp1;
HXDLIN(  50)			if ((this->cd->value > (int)0)) {
HXLINE(  50)				_hx_tmp1 = ::lime::text::_UTF8String::UTF8String_Impl__obj::fromDynamic(this->cd->value);
            			}
            			else {
HXLINE(  50)				_hx_tmp1 = HX_("",00,00,00,00);
            			}
HXDLIN(  50)			_hx_tmp->set_text(_hx_tmp1);
HXLINE(  51)			this->add(this->cdText,(int)-4,(int)4);
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(AbilityCell_obj,decrementCooldown,(void))

void AbilityCell_obj::changeCooldown(int value){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_56_changeCooldown)
HXLINE( 151)		if ((false == (value <= this->cd->keyValue))) {
HXLINE(  57)			::hxassert::Assert_obj::throwAssertionFailureError(::Array_obj< ::String >::fromData( _hx_array_data_3fe8683c_7,1),hx::SourceInfo(HX_("AbilityCell.hx",f2,95,c8,ae),57,HX_("battle.vision.AbilityCell",3c,68,e8,3f),HX_("changeCooldown",3b,89,dd,52)));
            		}
HXLINE(  58)		{
HXLINE(  58)			int _g1 = (int)0;
HXDLIN(  58)			int _g = value;
HXDLIN(  58)			while((_g1 < _g)){
HXLINE(  58)				_g1 = (_g1 + (int)1);
HXDLIN(  58)				int i = (_g1 - (int)1);
HXLINE(  59)				::Array< ::Dynamic> _hx_tmp = this->cdSegments;
HXDLIN(  59)				_hx_tmp->__get(((this->cd->keyValue - i) - (int)1)).StaticCast<  ::openfl::display::Shape >()->set_visible(true);
            			}
            		}
HXLINE(  60)		{
HXLINE(  60)			int _g11 = value;
HXDLIN(  60)			int _g2 = this->cd->keyValue;
HXDLIN(  60)			while((_g11 < _g2)){
HXLINE(  60)				_g11 = (_g11 + (int)1);
HXDLIN(  60)				int i1 = (_g11 - (int)1);
HXLINE(  61)				::Array< ::Dynamic> _hx_tmp1 = this->cdSegments;
HXDLIN(  61)				_hx_tmp1->__get(((this->cd->keyValue - i1) - (int)1)).StaticCast<  ::openfl::display::Shape >()->set_visible(false);
            			}
            		}
HXLINE(  62)		this->cd->value = value;
HXLINE(  63)		this->remove(this->cdText);
HXLINE(  64)		this->setCDText();
HXLINE(  65)		 ::openfl::text::TextField _hx_tmp2 = this->cdText;
HXDLIN(  65)		::String _hx_tmp3;
HXDLIN(  65)		if ((this->cd->value > (int)0)) {
HXLINE(  65)			_hx_tmp3 = ::lime::text::_UTF8String::UTF8String_Impl__obj::fromDynamic(this->cd->value);
            		}
            		else {
HXLINE(  65)			_hx_tmp3 = HX_("",00,00,00,00);
            		}
HXDLIN(  65)		_hx_tmp2->set_text(_hx_tmp3);
HXLINE(  66)		this->add(this->cdText,(int)-4,(int)4);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,changeCooldown,(void))

void AbilityCell_obj::updateCooldown(){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_71_updateCooldown)
HXDLIN(  71)		this->changeCooldown(this->cd->keyValue);
            	}


HX_DEFINE_DYNAMIC_FUNC0(AbilityCell_obj,updateCooldown,(void))

void AbilityCell_obj::moveHandler( ::openfl::events::MouseEvent e){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_76_moveHandler)
HXDLIN(  76)		Float point = this->stage->get_mouseX();
HXDLIN(  76)		 ::openfl::geom::Point point1 =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,point,this->stage->get_mouseY());
HXDLIN(  76)		 ::openfl::geom::Rectangle field = this->getRect(this->stage);
HXDLIN(  76)		bool _hx_tmp;
HXDLIN(  76)		bool _hx_tmp1;
HXDLIN(  76)		bool _hx_tmp2;
HXDLIN(  76)		if ((point1->x >= field->x)) {
HXDLIN(  76)			Float point2 = point1->x;
HXDLIN(  76)			_hx_tmp2 = (point2 <= (field->x + field->width));
            		}
            		else {
HXDLIN(  76)			_hx_tmp2 = false;
            		}
HXDLIN(  76)		if (_hx_tmp2) {
HXDLIN(  76)			if ((point1->y >= field->y)) {
HXDLIN(  76)				Float point3 = point1->y;
HXDLIN(  76)				_hx_tmp1 = (point3 <= (field->y + field->height));
            			}
            			else {
HXDLIN(  76)				_hx_tmp1 = false;
            			}
            		}
            		else {
HXDLIN(  76)			_hx_tmp1 = false;
            		}
HXDLIN(  76)		if (_hx_tmp1) {
HXDLIN(  76)			_hx_tmp = true;
            		}
            		else {
HXDLIN(  76)			_hx_tmp = false;
            		}
HXDLIN(  76)		if (_hx_tmp) {
HXLINE(  78)			if (!(this->hintVisible)) {
HXLINE(  80)				this->stage->addChild(this->hint);
HXLINE(  81)				this->hintVisible = true;
            			}
HXLINE(  83)			 ::graphic::HintTextfield _hx_tmp3 = this->hint;
HXDLIN(  83)			_hx_tmp3->set_x(this->stage->get_mouseX());
HXLINE(  84)			 ::graphic::HintTextfield _hx_tmp4 = this->hint;
HXDLIN(  84)			Float _hx_tmp5 = this->stage->get_mouseY();
HXDLIN(  84)			_hx_tmp4->set_y((_hx_tmp5 - this->hint->get_textHeight()));
            		}
            		else {
HXLINE(  86)			if (this->hintVisible) {
HXLINE(  88)				this->stage->removeChild(this->hint);
HXLINE(  89)				this->hintVisible = false;
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,moveHandler,(void))

::String AbilityCell_obj::hintHeader( ::battle::Ability ab){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_96_hintHeader)
HXDLIN(  96)		::String _hx_tmp;
HXDLIN(  96)		if (hx::IsEq( ab->type,::battle::enums::AbilityType_obj::Active_dyn() )) {
HXDLIN(  96)			_hx_tmp = HX_("(A)",f0,92,1e,00);
            		}
            		else {
HXDLIN(  96)			_hx_tmp = HX_("(P)",01,a0,1e,00);
            		}
HXDLIN(  96)		return (ab->name + _hx_tmp);
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,hintHeader,return )

::String AbilityCell_obj::hintText( ::battle::Ability ab){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_100_hintText)
HXLINE( 101)		::String result = (HX_("",00,00,00,00) + ab->description);
HXLINE( 102)		if (hx::IsEq( ab->type,::battle::enums::AbilityType_obj::Active_dyn() )) {
HXLINE( 104)			 ::battle::Active a = ( ( ::battle::Active)(ab) );
HXLINE( 105)			::String result1 = ((HX_("\nCD: ",91,e4,7e,ee) + (a->get_maxCooldown() - (int)1)) + HX_(", MC: ",f0,e7,9e,37));
HXDLIN( 105)			result = (result + (result1 + a->manacost));
            		}
HXLINE( 107)		return result;
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,hintText,return )

void AbilityCell_obj::init( ::openfl::events::Event e){
            	HX_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_142_init)
HXLINE( 143)		this->stage->addEventListener(HX_("mouseMove",d6,9b,b5,f4),this->moveHandler_dyn(),true,(int)0,true);
HXLINE( 144)		this->removeEventListener(HX_("addedToStage",63,22,55,0c),this->init_dyn(),null());
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,init,(void))

void AbilityCell_obj::setCDText(){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_148_setCDText)
HXLINE( 149)		 ::openfl::text::TextFormat format =  ::openfl::text::TextFormat_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null());
HXLINE( 150)		format->color = (int)10461087;
HXLINE( 151)		format->size = (int)40;
HXLINE( 152)		format->align = (int)0;
HXLINE( 153)		format->font = ::graphic::Fonts_obj::MIRROR;
HXLINE( 154)		this->cdText =  ::openfl::text::TextField_obj::__alloc( HX_CTX );
HXLINE( 155)		this->cdText->set_embedFonts(true);
HXLINE( 156)		this->cdText->setTextFormat(format,null(),null());
HXLINE( 157)		this->cdText->set_width((int)56);
HXLINE( 158)		 ::openfl::text::TextField _hx_tmp = this->cdText;
HXDLIN( 158)		_hx_tmp->set_filters(::Array_obj< ::Dynamic>::__new(1)->init(0, ::openfl::filters::DropShadowFilter_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null())));
            	}


HX_DEFINE_DYNAMIC_FUNC0(AbilityCell_obj,setCDText,(void))

void AbilityCell_obj::setManaText(int manacost){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_162_setManaText)
HXLINE( 163)		 ::openfl::text::TextFormat format =  ::openfl::text::TextFormat_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null());
HXLINE( 164)		format->color = (int)16777215;
HXLINE( 165)		format->bold = true;
HXLINE( 166)		format->size = (int)10;
HXLINE( 167)		format->align = (int)0;
HXLINE( 168)		this->manacostText =  ::openfl::text::TextField_obj::__alloc( HX_CTX );
HXLINE( 169)		this->manacostText->setTextFormat(format,null(),null());
HXLINE( 170)		this->manacostText->set_width((int)15);
HXLINE( 171)		 ::openfl::text::TextField _hx_tmp = this->manacostText;
HXDLIN( 171)		_hx_tmp->set_text(::lime::text::_UTF8String::UTF8String_Impl__obj::fromDynamic(manacost));
HXLINE( 172)		 ::openfl::text::TextField _hx_tmp1 = this->manacostText;
HXDLIN( 172)		_hx_tmp1->set_filters(::Array_obj< ::Dynamic>::__new(1)->init(0, ::openfl::filters::GlowFilter_obj::__alloc( HX_CTX ,(int)5866495,((Float)0.7),null(),null(),null(),null(),null(),null())));
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,setManaText,(void))

void AbilityCell_obj::setButtonText(::String button){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_176_setButtonText)
HXLINE( 177)		 ::openfl::text::TextFormat format =  ::openfl::text::TextFormat_obj::__alloc( HX_CTX ,null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null());
HXLINE( 178)		format->color = (int)0;
HXLINE( 179)		format->bold = true;
HXLINE( 180)		format->size = (int)13;
HXLINE( 181)		format->align = (int)0;
HXLINE( 182)		this->buttonText =  ::openfl::text::TextField_obj::__alloc( HX_CTX );
HXLINE( 183)		this->buttonText->setTextFormat(format,null(),null());
HXLINE( 184)		this->buttonText->set_width((int)13);
HXLINE( 185)		this->buttonText->set_text(button);
HXLINE( 186)		 ::openfl::text::TextField _hx_tmp = this->buttonText;
HXDLIN( 186)		_hx_tmp->set_filters(::Array_obj< ::Dynamic>::__new(1)->init(0, ::openfl::filters::GlowFilter_obj::__alloc( HX_CTX ,(int)7368816,null(),null(),null(),null(),null(),null(),null())));
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,setButtonText,(void))

void AbilityCell_obj::drawSegments(int q){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_190_drawSegments)
HXLINE( 191)		Float angle = ((Float)(int)1 / (Float)q);
HXLINE( 192)		 ::openfl::geom::Point prevPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)0,(int)-28);
HXLINE( 193)		Float t = ((int)2 * ::Math_obj::PI);
HXLINE( 195)		{
HXLINE( 195)			int _g1 = (int)1;
HXDLIN( 195)			int _g = (q + (int)1);
HXDLIN( 195)			while((_g1 < _g)){
HXLINE( 195)				_g1 = (_g1 + (int)1);
HXDLIN( 195)				int i = (_g1 - (int)1);
HXLINE( 197)				 ::openfl::geom::Point vertex = this->iconVertices(prevPoint,(int)4)->__get((int)0).StaticCast<  ::openfl::geom::Point >();
HXLINE( 198)				int len = (int)0;
HXLINE( 199)				 ::openfl::geom::Point nextPoint;
HXLINE( 200)				Float a = (vertex->x - prevPoint->x);
HXDLIN( 200)				Float a1 = -(::Math_obj::pow((a + (vertex->y - prevPoint->y)),(int)2));
HXDLIN( 200)				Float a2 = (a1 + ::Math_obj::pow(prevPoint->x,(int)2));
HXDLIN( 200)				Float a3 = ((a2 + ::Math_obj::pow(prevPoint->y,(int)2)) + (int)1568);
HXDLIN( 200)				Float a4 = (prevPoint->x * prevPoint->x);
HXDLIN( 200)				Float a5 = ((Float)a3 / (Float)((int)56 * ::Math_obj::sqrt(((int)2 * (a4 + (prevPoint->y * prevPoint->y))))));
HXLINE( 202)				if ((q == (int)1)) {
HXLINE( 203)					len = (int)4;
            				}
            				else {
HXLINE( 205)					int _g2 = (int)0;
HXDLIN( 205)					while((_g2 < (int)4)){
HXLINE( 205)						_g2 = (_g2 + (int)1);
HXDLIN( 205)						int j = (_g2 - (int)1);
HXLINE( 206)						bool _hx_tmp;
HXDLIN( 206)						if ((::Math_obj::cos(((angle - (((Float)0.25) * j)) * t)) <= a5)) {
HXLINE( 206)							_hx_tmp = ((angle - (((Float)0.25) * j)) > (int)0);
            						}
            						else {
HXLINE( 206)							_hx_tmp = false;
            						}
HXDLIN( 206)						if (_hx_tmp) {
HXLINE( 207)							len = (len + (int)1);
            						}
            						else {
HXLINE( 209)							goto _hx_goto_17;
            						}
            					}
            					_hx_goto_17:;
            				}
HXLINE( 211)				Float fangle = (angle * i);
HXLINE( 213)				if ((i == q)) {
HXLINE( 214)					nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)0,(int)-28);
            				}
            				else {
HXLINE( 215)					if ((fangle < ((Float)0.125))) {
HXLINE( 216)						nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(::Math_obj::tan((t * fangle)) * (int)28),(int)-28);
            					}
            					else {
HXLINE( 217)						if ((fangle < ((Float)0.375))) {
HXLINE( 218)							nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)28,(::Math_obj::tan(((fangle - ((Float)0.25)) * t)) * (int)28));
            						}
            						else {
HXLINE( 219)							if ((fangle < ((Float)0.625))) {
HXLINE( 220)								nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(::Math_obj::tan(((((Float)0.5) - fangle) * t)) * (int)28),(int)28);
            							}
            							else {
HXLINE( 221)								if ((fangle < ((Float)0.875))) {
HXLINE( 222)									nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)-28,(::Math_obj::tan(((((Float)0.75) - fangle) * t)) * (int)28));
            								}
            								else {
HXLINE( 224)									nextPoint =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(::Math_obj::tan(((fangle - (int)1) * t)) * (int)28),(int)-28);
            								}
            							}
            						}
            					}
            				}
HXLINE( 226)				::Array< ::Dynamic> _hx_tmp1 = this->cdSegments;
HXDLIN( 226)				_hx_tmp1->push(this->drawSeg(::Array_obj< ::Dynamic>::__new(1)->init(0,prevPoint)->concat(this->iconVertices(prevPoint,len))->concat(::Array_obj< ::Dynamic>::__new(1)->init(0,nextPoint))));
HXLINE( 227)				prevPoint = nextPoint;
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,drawSegments,(void))

::Array< ::Dynamic> AbilityCell_obj::iconVertices( ::openfl::geom::Point p,int len){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_232_iconVertices)
HXLINE( 233)		 ::openfl::geom::Point a =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)28,(int)-28);
HXDLIN( 233)		 ::openfl::geom::Point a1 =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)28,(int)28);
HXDLIN( 233)		 ::openfl::geom::Point a2 =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)-28,(int)28);
HXDLIN( 233)		::Array< ::Dynamic> a3 = ::Array_obj< ::Dynamic>::__new(4)->init(0,a)->init(1,a1)->init(2,a2)->init(3, ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)-28,(int)-28));
HXLINE( 235)		int index = (int)0;
HXLINE( 236)		bool _hx_tmp;
HXDLIN( 236)		if ((p->x == (int)28)) {
HXLINE( 236)			_hx_tmp = (p->y != (int)28);
            		}
            		else {
HXLINE( 236)			_hx_tmp = false;
            		}
HXDLIN( 236)		if (_hx_tmp) {
HXLINE( 237)			index = (int)1;
            		}
            		else {
HXLINE( 238)			bool _hx_tmp1;
HXDLIN( 238)			if ((p->x == (int)-28)) {
HXLINE( 238)				_hx_tmp1 = (p->y != (int)-28);
            			}
            			else {
HXLINE( 238)				_hx_tmp1 = false;
            			}
HXDLIN( 238)			if (_hx_tmp1) {
HXLINE( 239)				index = (int)3;
            			}
            			else {
HXLINE( 240)				if ((p->y == (int)28)) {
HXLINE( 241)					index = (int)2;
            				}
            				else {
HXLINE( 242)					if ((p->y == (int)-28)) {
HXLINE( 243)						index = (int)0;
            					}
            				}
            			}
            		}
HXLINE( 245)		::Array< ::Dynamic> _g = ::Array_obj< ::Dynamic>::__new(0);
HXDLIN( 245)		{
HXLINE( 245)			int _g2 = (int)0;
HXDLIN( 245)			int _g1 = len;
HXDLIN( 245)			while((_g2 < _g1)){
HXLINE( 245)				_g2 = (_g2 + (int)1);
HXDLIN( 245)				int i = (_g2 - (int)1);
HXDLIN( 245)				_g->push(a3->__get(hx::Mod((i + index),(int)4)).StaticCast<  ::openfl::geom::Point >());
            			}
            		}
HXDLIN( 245)		return _g;
            	}


HX_DEFINE_DYNAMIC_FUNC2(AbilityCell_obj,iconVertices,return )

 ::openfl::display::Shape AbilityCell_obj::drawSeg(::Array< ::Dynamic> vertices){
            	HX_GC_STACKFRAME(&_hx_pos_d9cfa635af54f7ed_249_drawSeg)
HXLINE( 250)		 ::openfl::display::Shape seg =  ::openfl::display::Shape_obj::__alloc( HX_CTX );
HXLINE( 251)		seg->get_graphics()->lineStyle((int)0,(int)0,((Float)0.135),null(),null(),null(),null(),null());
HXLINE( 252)		seg->get_graphics()->moveTo((int)0,(int)0);
HXLINE( 253)		seg->get_graphics()->beginFill((int)0,((Float)0.7));
HXLINE( 254)		{
HXLINE( 254)			int _g = (int)0;
HXDLIN( 254)			while((_g < vertices->length)){
HXLINE( 254)				 ::openfl::geom::Point p = vertices->__get(_g).StaticCast<  ::openfl::geom::Point >();
HXDLIN( 254)				_g = (_g + (int)1);
HXLINE( 256)				Float x = p->x;
HXDLIN( 256)				Float y = p->y;
HXLINE( 257)				if ((::Math_obj::abs(x) == (int)28)) {
HXLINE( 258)					x = (x - (::MathUtils_obj::sign(x) * ((Float)3.42)));
            				}
HXLINE( 259)				if ((::Math_obj::abs(y) == (int)28)) {
HXLINE( 260)					y = (y - (::MathUtils_obj::sign(y) * ((Float)3.42)));
            				}
HXLINE( 261)				seg->get_graphics()->lineTo(x,y);
            			}
            		}
HXLINE( 263)		seg->get_graphics()->lineTo((int)0,(int)0);
HXLINE( 264)		seg->get_graphics()->endFill();
HXLINE( 265)		return seg;
            	}


HX_DEFINE_DYNAMIC_FUNC1(AbilityCell_obj,drawSeg,return )


hx::ObjectPtr< AbilityCell_obj > AbilityCell_obj::__new( ::battle::Ability ab,::String button) {
	hx::ObjectPtr< AbilityCell_obj > __this = new AbilityCell_obj();
	__this->__construct(ab,button);
	return __this;
}

hx::ObjectPtr< AbilityCell_obj > AbilityCell_obj::__alloc(hx::Ctx *_hx_ctx, ::battle::Ability ab,::String button) {
	AbilityCell_obj *__this = (AbilityCell_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(AbilityCell_obj), true, "battle.vision.AbilityCell"));
	*(void **)__this = AbilityCell_obj::_hx_vtable;
	__this->__construct(ab,button);
	return __this;
}

AbilityCell_obj::AbilityCell_obj()
{
}

void AbilityCell_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(AbilityCell);
	HX_MARK_MEMBER_NAME(cd,"cd");
	HX_MARK_MEMBER_NAME(icon,"icon");
	HX_MARK_MEMBER_NAME(cdSegments,"cdSegments");
	HX_MARK_MEMBER_NAME(cdText,"cdText");
	HX_MARK_MEMBER_NAME(manacostText,"manacostText");
	HX_MARK_MEMBER_NAME(buttonText,"buttonText");
	HX_MARK_MEMBER_NAME(hint,"hint");
	HX_MARK_MEMBER_NAME(hintVisible,"hintVisible");
	 ::openfl::display::Sprite_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void AbilityCell_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(cd,"cd");
	HX_VISIT_MEMBER_NAME(icon,"icon");
	HX_VISIT_MEMBER_NAME(cdSegments,"cdSegments");
	HX_VISIT_MEMBER_NAME(cdText,"cdText");
	HX_VISIT_MEMBER_NAME(manacostText,"manacostText");
	HX_VISIT_MEMBER_NAME(buttonText,"buttonText");
	HX_VISIT_MEMBER_NAME(hint,"hint");
	HX_VISIT_MEMBER_NAME(hintVisible,"hintVisible");
	 ::openfl::display::Sprite_obj::__Visit(HX_VISIT_ARG);
}

hx::Val AbilityCell_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"cd") ) { return hx::Val( cd ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"icon") ) { return hx::Val( icon ); }
		if (HX_FIELD_EQ(inName,"hint") ) { return hx::Val( hint ); }
		if (HX_FIELD_EQ(inName,"init") ) { return hx::Val( init_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"cdText") ) { return hx::Val( cdText ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"drawSeg") ) { return hx::Val( drawSeg_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"hintText") ) { return hx::Val( hintText_dyn() ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"setCDText") ) { return hx::Val( setCDText_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"cdSegments") ) { return hx::Val( cdSegments ); }
		if (HX_FIELD_EQ(inName,"buttonText") ) { return hx::Val( buttonText ); }
		if (HX_FIELD_EQ(inName,"hintHeader") ) { return hx::Val( hintHeader_dyn() ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"hintVisible") ) { return hx::Val( hintVisible ); }
		if (HX_FIELD_EQ(inName,"moveHandler") ) { return hx::Val( moveHandler_dyn() ); }
		if (HX_FIELD_EQ(inName,"setManaText") ) { return hx::Val( setManaText_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"manacostText") ) { return hx::Val( manacostText ); }
		if (HX_FIELD_EQ(inName,"drawSegments") ) { return hx::Val( drawSegments_dyn() ); }
		if (HX_FIELD_EQ(inName,"iconVertices") ) { return hx::Val( iconVertices_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"setButtonText") ) { return hx::Val( setButtonText_dyn() ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"changeCooldown") ) { return hx::Val( changeCooldown_dyn() ); }
		if (HX_FIELD_EQ(inName,"updateCooldown") ) { return hx::Val( updateCooldown_dyn() ); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"decrementCooldown") ) { return hx::Val( decrementCooldown_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val AbilityCell_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"cd") ) { cd=inValue.Cast<  ::battle::_hx_struct::Countdown >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"icon") ) { icon=inValue.Cast<  ::openfl::display::MovieClip >(); return inValue; }
		if (HX_FIELD_EQ(inName,"hint") ) { hint=inValue.Cast<  ::graphic::HintTextfield >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"cdText") ) { cdText=inValue.Cast<  ::openfl::text::TextField >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"cdSegments") ) { cdSegments=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		if (HX_FIELD_EQ(inName,"buttonText") ) { buttonText=inValue.Cast<  ::openfl::text::TextField >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"hintVisible") ) { hintVisible=inValue.Cast< bool >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"manacostText") ) { manacostText=inValue.Cast<  ::openfl::text::TextField >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void AbilityCell_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("cd","\xa1","\x56","\x00","\x00"));
	outFields->push(HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45"));
	outFields->push(HX_HCSTRING("cdSegments","\x21","\x09","\xf2","\xea"));
	outFields->push(HX_HCSTRING("cdText","\xee","\xb3","\x39","\x61"));
	outFields->push(HX_HCSTRING("manacostText","\x21","\xfd","\xe9","\x83"));
	outFields->push(HX_HCSTRING("buttonText","\xbf","\x3b","\xf0","\xb6"));
	outFields->push(HX_HCSTRING("hint","\x87","\x3d","\x0e","\x45"));
	outFields->push(HX_HCSTRING("hintVisible","\xab","\x31","\xf3","\x37"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo AbilityCell_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::battle::_hx_struct::Countdown*/ ,(int)offsetof(AbilityCell_obj,cd),HX_HCSTRING("cd","\xa1","\x56","\x00","\x00")},
	{hx::fsObject /*::openfl::display::MovieClip*/ ,(int)offsetof(AbilityCell_obj,icon),HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45")},
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(AbilityCell_obj,cdSegments),HX_HCSTRING("cdSegments","\x21","\x09","\xf2","\xea")},
	{hx::fsObject /*::openfl::text::TextField*/ ,(int)offsetof(AbilityCell_obj,cdText),HX_HCSTRING("cdText","\xee","\xb3","\x39","\x61")},
	{hx::fsObject /*::openfl::text::TextField*/ ,(int)offsetof(AbilityCell_obj,manacostText),HX_HCSTRING("manacostText","\x21","\xfd","\xe9","\x83")},
	{hx::fsObject /*::openfl::text::TextField*/ ,(int)offsetof(AbilityCell_obj,buttonText),HX_HCSTRING("buttonText","\xbf","\x3b","\xf0","\xb6")},
	{hx::fsObject /*::graphic::HintTextfield*/ ,(int)offsetof(AbilityCell_obj,hint),HX_HCSTRING("hint","\x87","\x3d","\x0e","\x45")},
	{hx::fsBool,(int)offsetof(AbilityCell_obj,hintVisible),HX_HCSTRING("hintVisible","\xab","\x31","\xf3","\x37")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *AbilityCell_obj_sStaticStorageInfo = 0;
#endif

static ::String AbilityCell_obj_sMemberFields[] = {
	HX_HCSTRING("cd","\xa1","\x56","\x00","\x00"),
	HX_HCSTRING("icon","\x79","\xe7","\xb2","\x45"),
	HX_HCSTRING("cdSegments","\x21","\x09","\xf2","\xea"),
	HX_HCSTRING("cdText","\xee","\xb3","\x39","\x61"),
	HX_HCSTRING("manacostText","\x21","\xfd","\xe9","\x83"),
	HX_HCSTRING("buttonText","\xbf","\x3b","\xf0","\xb6"),
	HX_HCSTRING("hint","\x87","\x3d","\x0e","\x45"),
	HX_HCSTRING("hintVisible","\xab","\x31","\xf3","\x37"),
	HX_HCSTRING("decrementCooldown","\xde","\xc8","\xa6","\x6f"),
	HX_HCSTRING("changeCooldown","\x3b","\x89","\xdd","\x52"),
	HX_HCSTRING("updateCooldown","\xd4","\x3e","\xcc","\x2e"),
	HX_HCSTRING("moveHandler","\xb9","\xe8","\x51","\x1e"),
	HX_HCSTRING("hintHeader","\x74","\x1a","\x40","\x40"),
	HX_HCSTRING("hintText","\xd4","\x05","\x5c","\x48"),
	HX_HCSTRING("init","\x10","\x3b","\xbb","\x45"),
	HX_HCSTRING("setCDText","\x10","\x99","\x0e","\x54"),
	HX_HCSTRING("setManaText","\x96","\x4e","\x70","\x59"),
	HX_HCSTRING("setButtonText","\x01","\x7a","\x68","\x58"),
	HX_HCSTRING("drawSegments","\x84","\x79","\x1a","\x24"),
	HX_HCSTRING("iconVertices","\x92","\x04","\x54","\x15"),
	HX_HCSTRING("drawSeg","\xf1","\x81","\xd7","\xfb"),
	::String(null()) };

static void AbilityCell_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(AbilityCell_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void AbilityCell_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(AbilityCell_obj::__mClass,"__mClass");
};

#endif

hx::Class AbilityCell_obj::__mClass;

void AbilityCell_obj::__register()
{
	hx::Object *dummy = new AbilityCell_obj;
	AbilityCell_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("battle.vision.AbilityCell","\x3c","\x68","\xe8","\x3f");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = AbilityCell_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(AbilityCell_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< AbilityCell_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = AbilityCell_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = AbilityCell_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = AbilityCell_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace battle
} // end namespace vision