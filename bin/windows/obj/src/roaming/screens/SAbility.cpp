// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_AbilityScreenBG
#include <AbilityScreenBG.h>
#endif
#ifndef INCLUDED_CloseAbScreen
#include <CloseAbScreen.h>
#endif
#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_SSprite
#include <SSprite.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_XMLUtils
#include <XMLUtils.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_lime_app_IModule
#include <lime/app/IModule.h>
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
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
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
#ifndef INCLUDED_openfl_geom_Point
#include <openfl/geom/Point.h>
#endif
#ifndef INCLUDED_openfl_geom_Rectangle
#include <openfl/geom/Rectangle.h>
#endif
#ifndef INCLUDED_roaming_Ability
#include <roaming/Ability.h>
#endif
#ifndef INCLUDED_roaming_Player
#include <roaming/Player.h>
#endif
#ifndef INCLUDED_roaming_Tree
#include <roaming/Tree.h>
#endif
#ifndef INCLUDED_roaming_TreeAbility
#include <roaming/TreeAbility.h>
#endif
#ifndef INCLUDED_roaming_Unit
#include <roaming/Unit.h>
#endif
#ifndef INCLUDED_roaming_enums_Attribute
#include <roaming/enums/Attribute.h>
#endif
#ifndef INCLUDED_roaming_screens_ICanvas
#include <roaming/screens/ICanvas.h>
#endif
#ifndef INCLUDED_roaming_screens_ISAbility
#include <roaming/screens/ISAbility.h>
#endif
#ifndef INCLUDED_roaming_screens_IScreen
#include <roaming/screens/IScreen.h>
#endif
#ifndef INCLUDED_roaming_screens_SAbility
#include <roaming/screens/SAbility.h>
#endif
#ifndef INCLUDED_roaming_screens_Screen
#include <roaming/screens/Screen.h>
#endif
#ifndef INCLUDED_roaming_screens_components_AttributeContainer
#include <roaming/screens/components/AttributeContainer.h>
#endif
#ifndef INCLUDED_roaming_screens_components_PointsAndRespec
#include <roaming/screens/components/PointsAndRespec.h>
#endif
#ifndef INCLUDED_roaming_screens_components_TreeContainer
#include <roaming/screens/components/TreeContainer.h>
#endif
#ifndef INCLUDED_roaming_screens_components_WheelContainer
#include <roaming/screens/components/WheelContainer.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_39_new,"roaming.screens.SAbility","new",0x06013f45,"roaming.screens.SAbility.new","roaming/screens/SAbility.hx",39,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_70_init,"roaming.screens.SAbility","init",0x37ced48b,"roaming.screens.SAbility.init","roaming/screens/SAbility.hx",70,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_77_put,"roaming.screens.SAbility","put",0x0602d1b4,"roaming.screens.SAbility.put","roaming/screens/SAbility.hx",77,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_104_splice,"roaming.screens.SAbility","splice",0x10e7b3b7,"roaming.screens.SAbility.splice","roaming/screens/SAbility.hx",104,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_115_learn,"roaming.screens.SAbility","learn",0x5165e3a9,"roaming.screens.SAbility.learn","roaming/screens/SAbility.hx",115,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_129_power,"roaming.screens.SAbility","power",0xa5acfe2a,"roaming.screens.SAbility.power","roaming/screens/SAbility.hx",129,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_135_respec,"roaming.screens.SAbility","respec",0x59c9c5a9,"roaming.screens.SAbility.respec","roaming/screens/SAbility.hx",135,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_150_onClick,"roaming.screens.SAbility","onClick",0xad5b600e,"roaming.screens.SAbility.onClick","roaming/screens/SAbility.hx",150,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_171_onRightClick,"roaming.screens.SAbility","onRightClick",0x82391146,"roaming.screens.SAbility.onRightClick","roaming/screens/SAbility.hx",171,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_190_exitX,"roaming.screens.SAbility","exitX",0x562cf59f,"roaming.screens.SAbility.exitX","roaming/screens/SAbility.hx",190,0xf5152209)
HX_LOCAL_STACK_FRAME(_hx_pos_2ffe64ae4eea06a8_195_getAbRadius,"roaming.screens.SAbility","getAbRadius",0x0a9216ae,"roaming.screens.SAbility.getAbRadius","roaming/screens/SAbility.hx",195,0xf5152209)
namespace roaming{
namespace screens{

void SAbility_obj::__construct(::Dynamic canvas){
            	HX_GC_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_39_new)
HXLINE( 186)		this->exitY = ((Float)40);
HXLINE( 185)		this->parCont =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)380,(int)360);
HXLINE( 184)		this->attribCont =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)404,(int)98);
HXLINE( 183)		this->wheelCont =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)370,(int)495);
HXLINE( 182)		this->treeCont =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,(int)50,(int)50);
HXLINE(  52)		super::__construct();
HXLINE(  53)		this->canvas = canvas;
HXLINE(  55)		this->treeContainer =  ::roaming::screens::components::TreeContainer_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
HXLINE(  56)		this->wheelContainer =  ::roaming::screens::components::WheelContainer_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
HXLINE(  57)		this->attribContainer =  ::roaming::screens::components::AttributeContainer_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
HXLINE(  58)		this->parContainer =  ::roaming::screens::components::PointsAndRespec_obj::__alloc( HX_CTX ,hx::ObjectPtr<OBJ_>(this));
HXLINE(  59)		this->closeButton =  ::CloseAbScreen_obj::__alloc( HX_CTX );
HXLINE(  61)		this->add( ::AbilityScreenBG_obj::__alloc( HX_CTX ),(int)0,(int)0);
HXLINE(  62)		this->add(this->treeContainer,this->treeCont->x,this->treeCont->y);
HXLINE(  63)		this->add(this->wheelContainer,this->wheelCont->x,this->wheelCont->y);
HXLINE(  64)		this->add(this->attribContainer,this->attribCont->x,this->attribCont->y);
HXLINE(  65)		this->add(this->parContainer,this->parCont->x,this->parCont->y);
HXLINE(  66)		 ::openfl::display::MovieClip _hx_tmp = this->closeButton;
HXDLIN(  66)		Float _hx_tmp1 = this->exitX();
HXDLIN(  66)		this->add(_hx_tmp,_hx_tmp1,this->exitY);
            	}

Dynamic SAbility_obj::__CreateEmpty() { return new SAbility_obj; }

void *SAbility_obj::_hx_vtable = 0;

Dynamic SAbility_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< SAbility_obj > _hx_result = new SAbility_obj();
	_hx_result->__construct(inArgs[0]);
	return _hx_result;
}

bool SAbility_obj::_hx_isInstanceOf(int inClassId) {
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
			return inClassId==(int)0x390564e5 || inClassId==(int)0x3f2b00af;
		} else {
			return inClassId==(int)0x739fd0b8;
		}
	}
}

static ::roaming::screens::ISAbility_obj _hx_roaming_screens_SAbility__hx_roaming_screens_ISAbility= {
	( Float (hx::Object::*)())&::roaming::screens::SAbility_obj::getAbRadius,
	( void (hx::Object::*)(int,int))&::roaming::screens::SAbility_obj::put,
	( void (hx::Object::*)(int))&::roaming::screens::SAbility_obj::splice,
	( void (hx::Object::*)(int,int))&::roaming::screens::SAbility_obj::learn,
	( void (hx::Object::*)( ::roaming::enums::Attribute))&::roaming::screens::SAbility_obj::power,
	( void (hx::Object::*)())&::roaming::screens::SAbility_obj::respec,
};

static ::roaming::screens::IScreen_obj _hx_roaming_screens_SAbility__hx_roaming_screens_IScreen= {
	( void (hx::Object::*)())&::roaming::screens::SAbility_obj::init,
};

void *SAbility_obj::_hx_getInterface(int inHash) {
	switch(inHash) {
		case (int)0x92cc83d2: return &_hx_roaming_screens_SAbility__hx_roaming_screens_ISAbility;
		case (int)0xb0301507: return &_hx_roaming_screens_SAbility__hx_roaming_screens_IScreen;
	}
	return super::_hx_getInterface(inHash);
}

void SAbility_obj::init(){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_70_init)
HXLINE(  71)		::haxe::Log_obj::trace(this->stage,hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),71,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("init",10,3b,bb,45)));
HXLINE(  72)		this->stage->addEventListener(HX_("click",48,7c,5e,48),this->onClick_dyn(),null(),null(),null());
HXLINE(  73)		this->stage->addEventListener(HX_("rightClick",cc,62,23,4b),this->onRightClick_dyn(),null(),null(),null());
            	}


HX_DEFINE_DYNAMIC_FUNC0(SAbility_obj,init,(void))

void SAbility_obj::put(int i,int j){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_77_put)
HXLINE(  78)		 ::roaming::TreeAbility ab = ::Main_obj::player->tree->get(i,j);
HXLINE(  79)		 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN(  79)		::String _hx_tmp1 = ((((((HX_("putting: ",23,7f,e2,64) + ::Type_obj::enumConstructor(ab->id)) + HX_("(",28,00,00,00)) + i) + HX_("; ",85,33,00,00)) + j) + HX_(")",29,00,00,00));
HXDLIN(  79)		_hx_tmp(_hx_tmp1,hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),79,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("put",cf,62,55,00)));
HXLINE(  81)		if ((ab->currentLvl == (int)0)) {
HXLINE(  83)			::haxe::Log_obj::trace(HX_("Ability isn't learnt",55,ce,61,fb),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),83,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("put",cf,62,55,00)));
HXLINE(  84)			return;
            		}
HXLINE(  86)		if ((::Main_obj::player->wheel->length == (int)8)) {
HXLINE(  88)			::haxe::Log_obj::trace(HX_("Wheel is full, unable to add more abilities",c8,76,85,be),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),88,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("put",cf,62,55,00)));
HXLINE(  89)			return;
            		}
HXLINE(  91)		{
HXLINE(  91)			int _g = (int)0;
HXDLIN(  91)			::Array< ::Dynamic> _g1 = ::Main_obj::player->wheel;
HXDLIN(  91)			while((_g < _g1->length)){
HXLINE(  91)				 ::ID id = _g1->__get(_g).StaticCast<  ::ID >();
HXDLIN(  91)				_g = (_g + (int)1);
HXLINE(  92)				if (hx::IsEq( id,ab->id )) {
HXLINE(  94)					::haxe::Log_obj::trace(HX_("Ability is already on the wheel",53,4a,f4,27),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),94,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("put",cf,62,55,00)));
HXLINE(  95)					return;
            				}
            			}
            		}
HXLINE(  98)		::Main_obj::player->wheel->push(ab->id);
HXLINE(  99)		 ::roaming::screens::components::WheelContainer _hx_tmp2 = this->wheelContainer;
HXDLIN(  99)		_hx_tmp2->redrawWheelAb((::Main_obj::player->wheel->length - (int)1));
            	}


HX_DEFINE_DYNAMIC_FUNC2(SAbility_obj,put,(void))

void SAbility_obj::splice(int i){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_104_splice)
HXDLIN( 104)		if ((::Main_obj::player->wheel->length > i)) {
HXLINE( 106)			 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN( 106)			_hx_tmp((HX_("splicing ",47,bc,71,95) + i),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),106,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("splice",7c,85,9e,bf)));
HXLINE( 107)			::Main_obj::player->wheel->removeRange(i,(int)1);
HXLINE( 108)			{
HXLINE( 108)				int _g1 = i;
HXDLIN( 108)				int _g = (::Main_obj::player->wheel->length + (int)1);
HXDLIN( 108)				while((_g1 < _g)){
HXLINE( 108)					_g1 = (_g1 + (int)1);
HXDLIN( 108)					int x = (_g1 - (int)1);
HXLINE( 109)					this->wheelContainer->redrawWheelAb(x);
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(SAbility_obj,splice,(void))

void SAbility_obj::learn(int i,int j){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_115_learn)
HXDLIN( 115)		if ((::Main_obj::player->abilityPoints > (int)0)) {
HXLINE( 116)			if (::Main_obj::player->tree->learn(i,j)) {
HXLINE( 118)				::Main_obj::player->spendAbPoint();
HXLINE( 119)				this->treeContainer->updateBranches(i,j);
HXLINE( 120)				this->parContainer->updateAbpValue();
            			}
            			else {
HXLINE( 123)				::haxe::Log_obj::trace(HX_("You haven't learned abilities required to unlock this ability or it already has maximum level",1b,73,f8,e6),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),123,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("learn",84,31,53,72)));
            			}
            		}
            		else {
HXLINE( 125)			::haxe::Log_obj::trace(HX_("You have no ability points",61,c9,1b,5c),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),125,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("learn",84,31,53,72)));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC2(SAbility_obj,learn,(void))

void SAbility_obj::power( ::roaming::enums::Attribute att){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_129_power)
HXLINE( 130)		this->attribContainer->updateValue(att);
HXLINE( 131)		this->parContainer->updateAttpValue();
            	}


HX_DEFINE_DYNAMIC_FUNC1(SAbility_obj,power,(void))

void SAbility_obj::respec(){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_135_respec)
HXLINE( 136)		::Main_obj::player->reSpec();
HXLINE( 137)		{
HXLINE( 137)			int _g = (int)0;
HXDLIN( 137)			while((_g < (int)8)){
HXLINE( 137)				_g = (_g + (int)1);
HXDLIN( 137)				int i = (_g - (int)1);
HXLINE( 138)				this->wheelContainer->redrawWheelAb(i);
            			}
            		}
HXLINE( 139)		{
HXLINE( 139)			int _g1 = (int)0;
HXDLIN( 139)			int _g2 = ( (int)(::XMLUtils_obj::getGlobal(HX_("tree",5e,99,03,4d),HX_("width",06,b6,62,ca),(int)1)) );
HXDLIN( 139)			while((_g1 < _g2)){
HXLINE( 139)				_g1 = (_g1 + (int)1);
HXDLIN( 139)				int j = (_g1 - (int)1);
HXLINE( 140)				{
HXLINE( 140)					int _g3 = (int)0;
HXDLIN( 140)					int _g21 = ( (int)(::XMLUtils_obj::getGlobal(HX_("tree",5e,99,03,4d),HX_("height",e7,07,4c,02),(int)1)) );
HXDLIN( 140)					while((_g3 < _g21)){
HXLINE( 140)						_g3 = (_g3 + (int)1);
HXDLIN( 140)						int i1 = (_g3 - (int)1);
HXLINE( 141)						this->treeContainer->updateBranches(i1,j);
            					}
            				}
            			}
            		}
HXLINE( 142)		{
HXLINE( 142)			int _g4 = (int)0;
HXDLIN( 142)			::Array< ::Dynamic> _g11 = ::Type_obj::allEnums(hx::ClassOf< ::roaming::enums::Attribute >());
HXDLIN( 142)			while((_g4 < _g11->length)){
HXLINE( 142)				 ::roaming::enums::Attribute att = _g11->__get(_g4).StaticCast<  ::roaming::enums::Attribute >();
HXDLIN( 142)				_g4 = (_g4 + (int)1);
HXLINE( 143)				this->attribContainer->updateValue(att);
            			}
            		}
HXLINE( 144)		this->parContainer->updateAbpValue();
HXLINE( 145)		this->parContainer->updateAttpValue();
HXLINE( 146)		::haxe::Log_obj::trace(HX_("Re-spec successful",65,88,d8,9a),hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),146,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("respec",6e,97,80,08)));
            	}


HX_DEFINE_DYNAMIC_FUNC0(SAbility_obj,respec,(void))

void SAbility_obj::onClick( ::openfl::events::MouseEvent e){
            	HX_GC_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_150_onClick)
HXLINE( 151)		 ::openfl::geom::Point point =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,e->stageX,e->stageY);
HXLINE( 152)		 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN( 152)		::String _hx_tmp1 = (HX_("Click: ",ce,78,7d,c7) + ::Std_obj::string(point));
HXDLIN( 152)		_hx_tmp(_hx_tmp1,hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),152,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("onClick",a9,1a,9c,de)));
HXLINE( 154)		 ::openfl::geom::Rectangle field = this->closeButton->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 154)		bool _hx_tmp2;
HXDLIN( 154)		bool _hx_tmp3;
HXDLIN( 154)		bool _hx_tmp4;
HXDLIN( 154)		if ((point->x >= field->x)) {
HXLINE( 154)			Float point1 = point->x;
HXDLIN( 154)			_hx_tmp4 = (point1 <= (field->x + field->width));
            		}
            		else {
HXLINE( 154)			_hx_tmp4 = false;
            		}
HXDLIN( 154)		if (_hx_tmp4) {
HXLINE( 154)			if ((point->y >= field->y)) {
HXLINE( 154)				Float point2 = point->y;
HXDLIN( 154)				_hx_tmp3 = (point2 <= (field->y + field->height));
            			}
            			else {
HXLINE( 154)				_hx_tmp3 = false;
            			}
            		}
            		else {
HXLINE( 154)			_hx_tmp3 = false;
            		}
HXDLIN( 154)		if (_hx_tmp3) {
HXLINE( 154)			_hx_tmp2 = true;
            		}
            		else {
HXLINE( 154)			_hx_tmp2 = false;
            		}
HXDLIN( 154)		if (_hx_tmp2) {
HXLINE( 156)			this->stage->removeEventListener(HX_("click",48,7c,5e,48),this->onClick_dyn(),null());
HXLINE( 157)			::roaming::screens::ICanvas_obj::switchTo(this->canvas,::roaming::screens::Screen_obj::Roaming_dyn());
            		}
            		else {
HXLINE( 159)			 ::openfl::geom::Rectangle field1 = this->wheelContainer->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 159)			bool _hx_tmp5;
HXDLIN( 159)			bool _hx_tmp6;
HXDLIN( 159)			bool _hx_tmp7;
HXDLIN( 159)			if ((point->x >= field1->x)) {
HXLINE( 159)				Float point3 = point->x;
HXDLIN( 159)				_hx_tmp7 = (point3 <= (field1->x + field1->width));
            			}
            			else {
HXLINE( 159)				_hx_tmp7 = false;
            			}
HXDLIN( 159)			if (_hx_tmp7) {
HXLINE( 159)				if ((point->y >= field1->y)) {
HXLINE( 159)					Float point4 = point->y;
HXDLIN( 159)					_hx_tmp6 = (point4 <= (field1->y + field1->height));
            				}
            				else {
HXLINE( 159)					_hx_tmp6 = false;
            				}
            			}
            			else {
HXLINE( 159)				_hx_tmp6 = false;
            			}
HXDLIN( 159)			if (_hx_tmp6) {
HXLINE( 159)				_hx_tmp5 = true;
            			}
            			else {
HXLINE( 159)				_hx_tmp5 = false;
            			}
HXDLIN( 159)			if (_hx_tmp5) {
HXLINE( 160)				 ::roaming::screens::components::WheelContainer _hx_tmp8 = this->wheelContainer;
HXDLIN( 160)				_hx_tmp8->onClick(point->subtract(this->wheelCont));
            			}
            			else {
HXLINE( 161)				 ::openfl::geom::Rectangle field2 = this->treeContainer->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 161)				bool _hx_tmp9;
HXDLIN( 161)				bool _hx_tmp10;
HXDLIN( 161)				bool _hx_tmp11;
HXDLIN( 161)				if ((point->x >= field2->x)) {
HXLINE( 161)					Float point5 = point->x;
HXDLIN( 161)					_hx_tmp11 = (point5 <= (field2->x + field2->width));
            				}
            				else {
HXLINE( 161)					_hx_tmp11 = false;
            				}
HXDLIN( 161)				if (_hx_tmp11) {
HXLINE( 161)					if ((point->y >= field2->y)) {
HXLINE( 161)						Float point6 = point->y;
HXDLIN( 161)						_hx_tmp10 = (point6 <= (field2->y + field2->height));
            					}
            					else {
HXLINE( 161)						_hx_tmp10 = false;
            					}
            				}
            				else {
HXLINE( 161)					_hx_tmp10 = false;
            				}
HXDLIN( 161)				if (_hx_tmp10) {
HXLINE( 161)					_hx_tmp9 = true;
            				}
            				else {
HXLINE( 161)					_hx_tmp9 = false;
            				}
HXDLIN( 161)				if (_hx_tmp9) {
HXLINE( 162)					 ::roaming::screens::components::TreeContainer _hx_tmp12 = this->treeContainer;
HXDLIN( 162)					_hx_tmp12->onClick(point->subtract(this->treeCont));
            				}
            				else {
HXLINE( 163)					 ::openfl::geom::Rectangle field3 = this->attribContainer->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 163)					bool _hx_tmp13;
HXDLIN( 163)					bool _hx_tmp14;
HXDLIN( 163)					bool _hx_tmp15;
HXDLIN( 163)					if ((point->x >= field3->x)) {
HXLINE( 163)						Float point7 = point->x;
HXDLIN( 163)						_hx_tmp15 = (point7 <= (field3->x + field3->width));
            					}
            					else {
HXLINE( 163)						_hx_tmp15 = false;
            					}
HXDLIN( 163)					if (_hx_tmp15) {
HXLINE( 163)						if ((point->y >= field3->y)) {
HXLINE( 163)							Float point8 = point->y;
HXDLIN( 163)							_hx_tmp14 = (point8 <= (field3->y + field3->height));
            						}
            						else {
HXLINE( 163)							_hx_tmp14 = false;
            						}
            					}
            					else {
HXLINE( 163)						_hx_tmp14 = false;
            					}
HXDLIN( 163)					if (_hx_tmp14) {
HXLINE( 163)						_hx_tmp13 = true;
            					}
            					else {
HXLINE( 163)						_hx_tmp13 = false;
            					}
HXDLIN( 163)					if (_hx_tmp13) {
HXLINE( 164)						 ::roaming::screens::components::AttributeContainer _hx_tmp16 = this->attribContainer;
HXDLIN( 164)						_hx_tmp16->onClick(point->subtract(this->attribCont));
            					}
            					else {
HXLINE( 165)						 ::openfl::geom::Rectangle field4 = this->parContainer->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 165)						bool _hx_tmp17;
HXDLIN( 165)						bool _hx_tmp18;
HXDLIN( 165)						bool _hx_tmp19;
HXDLIN( 165)						if ((point->x >= field4->x)) {
HXLINE( 165)							Float point9 = point->x;
HXDLIN( 165)							_hx_tmp19 = (point9 <= (field4->x + field4->width));
            						}
            						else {
HXLINE( 165)							_hx_tmp19 = false;
            						}
HXDLIN( 165)						if (_hx_tmp19) {
HXLINE( 165)							if ((point->y >= field4->y)) {
HXLINE( 165)								Float point10 = point->y;
HXDLIN( 165)								_hx_tmp18 = (point10 <= (field4->y + field4->height));
            							}
            							else {
HXLINE( 165)								_hx_tmp18 = false;
            							}
            						}
            						else {
HXLINE( 165)							_hx_tmp18 = false;
            						}
HXDLIN( 165)						if (_hx_tmp18) {
HXLINE( 165)							_hx_tmp17 = true;
            						}
            						else {
HXLINE( 165)							_hx_tmp17 = false;
            						}
HXDLIN( 165)						if (_hx_tmp17) {
HXLINE( 166)							 ::roaming::screens::components::PointsAndRespec _hx_tmp20 = this->parContainer;
HXDLIN( 166)							_hx_tmp20->onClick(point->subtract(this->parCont));
            						}
            					}
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(SAbility_obj,onClick,(void))

void SAbility_obj::onRightClick( ::openfl::events::MouseEvent e){
            	HX_GC_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_171_onRightClick)
HXLINE( 172)		 ::openfl::geom::Point point =  ::openfl::geom::Point_obj::__alloc( HX_CTX ,e->stageX,e->stageY);
HXLINE( 173)		 ::Dynamic _hx_tmp = ::haxe::Log_obj::trace;
HXDLIN( 173)		::String _hx_tmp1 = (HX_("Rightclick: ",b2,04,9c,df) + ::Std_obj::string(point));
HXDLIN( 173)		_hx_tmp(_hx_tmp1,hx::SourceInfo(HX_("SAbility.hx",87,91,40,72),173,HX_("roaming.screens.SAbility",d3,38,bd,56),HX_("onRightClick",cb,04,67,23)));
HXLINE( 175)		 ::openfl::geom::Rectangle field = this->treeContainer->getRect(hx::ObjectPtr<OBJ_>(this));
HXDLIN( 175)		bool _hx_tmp2;
HXDLIN( 175)		bool _hx_tmp3;
HXDLIN( 175)		bool _hx_tmp4;
HXDLIN( 175)		if ((point->x >= field->x)) {
HXLINE( 175)			Float point1 = point->x;
HXDLIN( 175)			_hx_tmp4 = (point1 <= (field->x + field->width));
            		}
            		else {
HXLINE( 175)			_hx_tmp4 = false;
            		}
HXDLIN( 175)		if (_hx_tmp4) {
HXLINE( 175)			if ((point->y >= field->y)) {
HXLINE( 175)				Float point2 = point->y;
HXDLIN( 175)				_hx_tmp3 = (point2 <= (field->y + field->height));
            			}
            			else {
HXLINE( 175)				_hx_tmp3 = false;
            			}
            		}
            		else {
HXLINE( 175)			_hx_tmp3 = false;
            		}
HXDLIN( 175)		if (_hx_tmp3) {
HXLINE( 175)			_hx_tmp2 = true;
            		}
            		else {
HXLINE( 175)			_hx_tmp2 = false;
            		}
HXDLIN( 175)		if (_hx_tmp2) {
HXLINE( 176)			 ::roaming::screens::components::TreeContainer _hx_tmp5 = this->treeContainer;
HXDLIN( 176)			_hx_tmp5->onRightClick(point->subtract(this->treeCont));
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC1(SAbility_obj,onRightClick,(void))

Float SAbility_obj::exitX(){
            	HX_GC_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_190_exitX)
HXDLIN( 190)		return ((int)900 - ( ::CloseAbScreen_obj::__alloc( HX_CTX )->get_width() * (int)2));
            	}


HX_DEFINE_DYNAMIC_FUNC0(SAbility_obj,exitX,return )

Float SAbility_obj::getAbRadius(){
            	HX_STACKFRAME(&_hx_pos_2ffe64ae4eea06a8_195_getAbRadius)
HXDLIN( 195)		return (int)18;
            	}


HX_DEFINE_DYNAMIC_FUNC0(SAbility_obj,getAbRadius,return )


hx::ObjectPtr< SAbility_obj > SAbility_obj::__new(::Dynamic canvas) {
	hx::ObjectPtr< SAbility_obj > __this = new SAbility_obj();
	__this->__construct(canvas);
	return __this;
}

hx::ObjectPtr< SAbility_obj > SAbility_obj::__alloc(hx::Ctx *_hx_ctx,::Dynamic canvas) {
	SAbility_obj *__this = (SAbility_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(SAbility_obj), true, "roaming.screens.SAbility"));
	*(void **)__this = SAbility_obj::_hx_vtable;
	__this->__construct(canvas);
	return __this;
}

SAbility_obj::SAbility_obj()
{
}

void SAbility_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(SAbility);
	HX_MARK_MEMBER_NAME(canvas,"canvas");
	HX_MARK_MEMBER_NAME(treeContainer,"treeContainer");
	HX_MARK_MEMBER_NAME(wheelContainer,"wheelContainer");
	HX_MARK_MEMBER_NAME(attribContainer,"attribContainer");
	HX_MARK_MEMBER_NAME(parContainer,"parContainer");
	HX_MARK_MEMBER_NAME(closeButton,"closeButton");
	HX_MARK_MEMBER_NAME(treeCont,"treeCont");
	HX_MARK_MEMBER_NAME(wheelCont,"wheelCont");
	HX_MARK_MEMBER_NAME(attribCont,"attribCont");
	HX_MARK_MEMBER_NAME(parCont,"parCont");
	HX_MARK_MEMBER_NAME(exitY,"exitY");
	 ::openfl::display::Sprite_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void SAbility_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(canvas,"canvas");
	HX_VISIT_MEMBER_NAME(treeContainer,"treeContainer");
	HX_VISIT_MEMBER_NAME(wheelContainer,"wheelContainer");
	HX_VISIT_MEMBER_NAME(attribContainer,"attribContainer");
	HX_VISIT_MEMBER_NAME(parContainer,"parContainer");
	HX_VISIT_MEMBER_NAME(closeButton,"closeButton");
	HX_VISIT_MEMBER_NAME(treeCont,"treeCont");
	HX_VISIT_MEMBER_NAME(wheelCont,"wheelCont");
	HX_VISIT_MEMBER_NAME(attribCont,"attribCont");
	HX_VISIT_MEMBER_NAME(parCont,"parCont");
	HX_VISIT_MEMBER_NAME(exitY,"exitY");
	 ::openfl::display::Sprite_obj::__Visit(HX_VISIT_ARG);
}

hx::Val SAbility_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"put") ) { return hx::Val( put_dyn() ); }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"init") ) { return hx::Val( init_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"learn") ) { return hx::Val( learn_dyn() ); }
		if (HX_FIELD_EQ(inName,"power") ) { return hx::Val( power_dyn() ); }
		if (HX_FIELD_EQ(inName,"exitY") ) { return hx::Val( exitY ); }
		if (HX_FIELD_EQ(inName,"exitX") ) { return hx::Val( exitX_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"canvas") ) { return hx::Val( canvas ); }
		if (HX_FIELD_EQ(inName,"splice") ) { return hx::Val( splice_dyn() ); }
		if (HX_FIELD_EQ(inName,"respec") ) { return hx::Val( respec_dyn() ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"onClick") ) { return hx::Val( onClick_dyn() ); }
		if (HX_FIELD_EQ(inName,"parCont") ) { return hx::Val( parCont ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"treeCont") ) { return hx::Val( treeCont ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"wheelCont") ) { return hx::Val( wheelCont ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"attribCont") ) { return hx::Val( attribCont ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"closeButton") ) { return hx::Val( closeButton ); }
		if (HX_FIELD_EQ(inName,"getAbRadius") ) { return hx::Val( getAbRadius_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"parContainer") ) { return hx::Val( parContainer ); }
		if (HX_FIELD_EQ(inName,"onRightClick") ) { return hx::Val( onRightClick_dyn() ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"treeContainer") ) { return hx::Val( treeContainer ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"wheelContainer") ) { return hx::Val( wheelContainer ); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"attribContainer") ) { return hx::Val( attribContainer ); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val SAbility_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"exitY") ) { exitY=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"canvas") ) { canvas=inValue.Cast< ::Dynamic >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"parCont") ) { parCont=inValue.Cast<  ::openfl::geom::Point >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"treeCont") ) { treeCont=inValue.Cast<  ::openfl::geom::Point >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"wheelCont") ) { wheelCont=inValue.Cast<  ::openfl::geom::Point >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"attribCont") ) { attribCont=inValue.Cast<  ::openfl::geom::Point >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"closeButton") ) { closeButton=inValue.Cast<  ::openfl::display::MovieClip >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"parContainer") ) { parContainer=inValue.Cast<  ::roaming::screens::components::PointsAndRespec >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"treeContainer") ) { treeContainer=inValue.Cast<  ::roaming::screens::components::TreeContainer >(); return inValue; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"wheelContainer") ) { wheelContainer=inValue.Cast<  ::roaming::screens::components::WheelContainer >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"attribContainer") ) { attribContainer=inValue.Cast<  ::roaming::screens::components::AttributeContainer >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void SAbility_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("canvas","\xd8","\x54","\x42","\xb8"));
	outFields->push(HX_HCSTRING("treeContainer","\x03","\xa0","\xdf","\xf8"));
	outFields->push(HX_HCSTRING("wheelContainer","\x26","\x35","\xbc","\x1d"));
	outFields->push(HX_HCSTRING("attribContainer","\x97","\x34","\x5b","\x65"));
	outFields->push(HX_HCSTRING("parContainer","\xa0","\x4f","\x76","\x9a"));
	outFields->push(HX_HCSTRING("closeButton","\xca","\x87","\x30","\x94"));
	outFields->push(HX_HCSTRING("treeCont","\x70","\x86","\x8c","\x25"));
	outFields->push(HX_HCSTRING("wheelCont","\x2d","\x04","\x9e","\x70"));
	outFields->push(HX_HCSTRING("attribCont","\x5c","\x3a","\x61","\x76"));
	outFields->push(HX_HCSTRING("parCont","\xf3","\xfb","\x4d","\xca"));
	outFields->push(HX_HCSTRING("exitY","\x7b","\x43","\x1a","\x77"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo SAbility_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::roaming::screens::ICanvas*/ ,(int)offsetof(SAbility_obj,canvas),HX_HCSTRING("canvas","\xd8","\x54","\x42","\xb8")},
	{hx::fsObject /*::roaming::screens::components::TreeContainer*/ ,(int)offsetof(SAbility_obj,treeContainer),HX_HCSTRING("treeContainer","\x03","\xa0","\xdf","\xf8")},
	{hx::fsObject /*::roaming::screens::components::WheelContainer*/ ,(int)offsetof(SAbility_obj,wheelContainer),HX_HCSTRING("wheelContainer","\x26","\x35","\xbc","\x1d")},
	{hx::fsObject /*::roaming::screens::components::AttributeContainer*/ ,(int)offsetof(SAbility_obj,attribContainer),HX_HCSTRING("attribContainer","\x97","\x34","\x5b","\x65")},
	{hx::fsObject /*::roaming::screens::components::PointsAndRespec*/ ,(int)offsetof(SAbility_obj,parContainer),HX_HCSTRING("parContainer","\xa0","\x4f","\x76","\x9a")},
	{hx::fsObject /*::openfl::display::MovieClip*/ ,(int)offsetof(SAbility_obj,closeButton),HX_HCSTRING("closeButton","\xca","\x87","\x30","\x94")},
	{hx::fsObject /*::openfl::geom::Point*/ ,(int)offsetof(SAbility_obj,treeCont),HX_HCSTRING("treeCont","\x70","\x86","\x8c","\x25")},
	{hx::fsObject /*::openfl::geom::Point*/ ,(int)offsetof(SAbility_obj,wheelCont),HX_HCSTRING("wheelCont","\x2d","\x04","\x9e","\x70")},
	{hx::fsObject /*::openfl::geom::Point*/ ,(int)offsetof(SAbility_obj,attribCont),HX_HCSTRING("attribCont","\x5c","\x3a","\x61","\x76")},
	{hx::fsObject /*::openfl::geom::Point*/ ,(int)offsetof(SAbility_obj,parCont),HX_HCSTRING("parCont","\xf3","\xfb","\x4d","\xca")},
	{hx::fsFloat,(int)offsetof(SAbility_obj,exitY),HX_HCSTRING("exitY","\x7b","\x43","\x1a","\x77")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *SAbility_obj_sStaticStorageInfo = 0;
#endif

static ::String SAbility_obj_sMemberFields[] = {
	HX_HCSTRING("canvas","\xd8","\x54","\x42","\xb8"),
	HX_HCSTRING("treeContainer","\x03","\xa0","\xdf","\xf8"),
	HX_HCSTRING("wheelContainer","\x26","\x35","\xbc","\x1d"),
	HX_HCSTRING("attribContainer","\x97","\x34","\x5b","\x65"),
	HX_HCSTRING("parContainer","\xa0","\x4f","\x76","\x9a"),
	HX_HCSTRING("closeButton","\xca","\x87","\x30","\x94"),
	HX_HCSTRING("init","\x10","\x3b","\xbb","\x45"),
	HX_HCSTRING("put","\xcf","\x62","\x55","\x00"),
	HX_HCSTRING("splice","\x7c","\x85","\x9e","\xbf"),
	HX_HCSTRING("learn","\x84","\x31","\x53","\x72"),
	HX_HCSTRING("power","\x05","\x4c","\x9a","\xc6"),
	HX_HCSTRING("respec","\x6e","\x97","\x80","\x08"),
	HX_HCSTRING("onClick","\xa9","\x1a","\x9c","\xde"),
	HX_HCSTRING("onRightClick","\xcb","\x04","\x67","\x23"),
	HX_HCSTRING("treeCont","\x70","\x86","\x8c","\x25"),
	HX_HCSTRING("wheelCont","\x2d","\x04","\x9e","\x70"),
	HX_HCSTRING("attribCont","\x5c","\x3a","\x61","\x76"),
	HX_HCSTRING("parCont","\xf3","\xfb","\x4d","\xca"),
	HX_HCSTRING("exitY","\x7b","\x43","\x1a","\x77"),
	HX_HCSTRING("exitX","\x7a","\x43","\x1a","\x77"),
	HX_HCSTRING("getAbRadius","\xc9","\xba","\xd3","\xa2"),
	::String(null()) };

static void SAbility_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(SAbility_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void SAbility_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(SAbility_obj::__mClass,"__mClass");
};

#endif

hx::Class SAbility_obj::__mClass;

void SAbility_obj::__register()
{
	hx::Object *dummy = new SAbility_obj;
	SAbility_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("roaming.screens.SAbility","\xd3","\x38","\xbd","\x56");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = SAbility_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(SAbility_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< SAbility_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = SAbility_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = SAbility_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = SAbility_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace roaming
} // end namespace screens