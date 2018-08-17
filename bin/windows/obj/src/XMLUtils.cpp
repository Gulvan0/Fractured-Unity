// Generated by Haxe 3.4.7
#include <hxcpp.h>

#ifndef INCLUDED_Element
#include <Element.h>
#endif
#ifndef INCLUDED_ID
#include <ID.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Sys
#include <Sys.h>
#endif
#ifndef INCLUDED_Type
#include <Type.h>
#endif
#ifndef INCLUDED_XMLUtils
#include <XMLUtils.h>
#endif
#ifndef INCLUDED_Xml
#include <Xml.h>
#endif
#ifndef INCLUDED_Zone
#include <Zone.h>
#endif
#ifndef INCLUDED_battle_data_BattleEvent
#include <battle/data/BattleEvent.h>
#endif
#ifndef INCLUDED_roaming_Ability
#include <roaming/Ability.h>
#endif
#ifndef INCLUDED_sys_FileSystem
#include <sys/FileSystem.h>
#endif
#ifndef INCLUDED_sys_io_File
#include <sys/io/File.h>
#endif

HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_16_getGlobal,"XMLUtils","getGlobal",0x741c7a25,"XMLUtils.getGlobal","XMLUtils.hx",16,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_26_parseTree,"XMLUtils","parseTree",0x24bdaabd,"XMLUtils.parseTree","XMLUtils.hx",26,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_52_parseTreePaths,"XMLUtils","parseTreePaths",0x1b71c331,"XMLUtils.parseTreePaths","XMLUtils.hx",52,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_83_parseStage,"XMLUtils","parseStage",0x6f208c7f,"XMLUtils.parseStage","XMLUtils.hx",83,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_98_nextZones,"XMLUtils","nextZones",0x7fee1e60,"XMLUtils.nextZones","XMLUtils.hx",98,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_110_stageCount,"XMLUtils","stageCount",0x5ee77425,"XMLUtils.stageCount","XMLUtils.hx",110,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_122_parseAbility,"XMLUtils","parseAbility",0x615335ab,"XMLUtils.parseAbility","XMLUtils.hx",122,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_132_parseTriggers,"XMLUtils","parseTriggers",0xbd32e91a,"XMLUtils.parseTriggers","XMLUtils.hx",132,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_154_parseBuff,"XMLUtils","parseBuff",0x18da1b32,"XMLUtils.parseBuff","XMLUtils.hx",154,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_164_parseUnit,"XMLUtils","parseUnit",0x2563dbe3,"XMLUtils.parseUnit","XMLUtils.hx",164,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_189_getTree,"XMLUtils","getTree",0x2b06cda0,"XMLUtils.getTree","XMLUtils.hx",189,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_199_castNode,"XMLUtils","castNode",0xde809655,"XMLUtils.castNode","XMLUtils.hx",199,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_224_findNode,"XMLUtils","findNode",0xa0918ccf,"XMLUtils.findNode","XMLUtils.hx",224,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_236_parseValueArray,"XMLUtils","parseValueArray",0x87bfa707,"XMLUtils.parseValueArray","XMLUtils.hx",236,0x0ee62204)
HX_LOCAL_STACK_FRAME(_hx_pos_741a171e3cdc6ad7_260_fromFile,"XMLUtils","fromFile",0xa67b12fa,"XMLUtils.fromFile","XMLUtils.hx",260,0x0ee62204)

void XMLUtils_obj::__construct() { }

Dynamic XMLUtils_obj::__CreateEmpty() { return new XMLUtils_obj; }

void *XMLUtils_obj::_hx_vtable = 0;

Dynamic XMLUtils_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< XMLUtils_obj > _hx_result = new XMLUtils_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool XMLUtils_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x32c47d5e;
}

 ::Dynamic XMLUtils_obj::getGlobal(::String node,::String attribute, ::Dynamic typeObj){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_16_getGlobal)
HXLINE(  17)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Globals.xml",47,c6,87,06));
HXLINE(  19)		{
HXLINE(  19)			 ::Dynamic n = xml->elementsNamed(node);
HXDLIN(  19)			while(( (bool)(n->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE(  19)				 ::Xml n1 = ( ( ::Xml)(n->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE(  20)				return ::XMLUtils_obj::castNode(n1->get(attribute),typeObj);
            			}
            		}
HXLINE(  22)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(XMLUtils_obj,getGlobal,return )

::Array< ::Dynamic> XMLUtils_obj::parseTree( ::Element element){
            	HX_GC_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_26_parseTree)
HXLINE(  27)		 ::Xml xml = ::XMLUtils_obj::getTree(element);
HXLINE(  28)		::Array< ::Dynamic> abilityGrid = ::Array_obj< ::Dynamic>::__new(0);
HXLINE(  30)		if (hx::IsNull( xml )) {
HXLINE(  31)			return abilityGrid;
            		}
HXLINE(  33)		{
HXLINE(  33)			 ::Dynamic row = xml->elementsNamed(HX_("row",1a,e2,56,00));
HXDLIN(  33)			while(( (bool)(row->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE(  33)				 ::Xml row1 = ( ( ::Xml)(row->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE(  35)				::Array< ::Dynamic> abilityRow = ::Array_obj< ::Dynamic>::__new(0);
HXLINE(  37)				{
HXLINE(  37)					 ::Dynamic ability = row1->elementsNamed(HX_("ability",aa,61,61,ad));
HXDLIN(  37)					while(( (bool)(ability->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE(  37)						 ::Xml ability1 = ( ( ::Xml)(ability->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE(  39)						 ::ID id = ::Type_obj::createEnum(hx::ClassOf< ::ID >(),ability1->get(HX_("id",db,5b,00,00)),null());
HXLINE(  40)						int maxlvl = ::Std_obj::parseInt(ability1->get(HX_("maxlvl",7e,8e,68,be)));
HXLINE(  42)						abilityRow->push( ::roaming::Ability_obj::__alloc( HX_CTX ,id,maxlvl));
            					}
            				}
HXLINE(  45)				abilityGrid->push(abilityRow);
            			}
            		}
HXLINE(  48)		return abilityGrid;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,parseTree,return )

::Array< ::Dynamic> XMLUtils_obj::parseTreePaths( ::Element element){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_52_parseTreePaths)
HXLINE(  53)		 ::Xml xml = ::XMLUtils_obj::getTree(element);
HXLINE(  54)		::Array< ::Dynamic> requirements = ::Array_obj< ::Dynamic>::__new(0);
HXLINE(  56)		if (hx::IsNull( xml )) {
HXLINE(  57)			return requirements;
            		}
HXLINE(  59)		{
HXLINE(  59)			 ::Dynamic row = xml->elementsNamed(HX_("row",1a,e2,56,00));
HXDLIN(  59)			while(( (bool)(row->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE(  59)				 ::Xml row1 = ( ( ::Xml)(row->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE(  61)				::Array< ::Dynamic> a = ::Array_obj< ::Dynamic>::__new(0);
HXLINE(  62)				{
HXLINE(  62)					 ::Dynamic ability = row1->elementsNamed(HX_("ability",aa,61,61,ad));
HXDLIN(  62)					while(( (bool)(ability->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE(  62)						 ::Xml ability1 = ( ( ::Xml)(ability->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE(  64)						::String reqStr = ability1->get(HX_("requires",6e,91,62,b2));
HXLINE(  65)						::Array< int > reqAr = ::Array_obj< int >::__new(0);
HXLINE(  67)						if ((reqStr.charAt((int)0) == HX_("1",31,00,00,00))) {
HXLINE(  68)							reqAr->push((int)-1);
            						}
HXLINE(  69)						if ((reqStr.charAt((int)1) == HX_("1",31,00,00,00))) {
HXLINE(  70)							reqAr->push((int)0);
            						}
HXLINE(  71)						if ((reqStr.charAt((int)2) == HX_("1",31,00,00,00))) {
HXLINE(  72)							reqAr->push((int)1);
            						}
HXLINE(  74)						a->push(reqAr);
            					}
            				}
HXLINE(  76)				requirements->push(a);
            			}
            		}
HXLINE(  79)		return requirements;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,parseTreePaths,return )

::Array< ::Dynamic> XMLUtils_obj::parseStage( ::Zone zone,int stage){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_83_parseStage)
HXLINE(  84)		::Array< ::Dynamic> output = ::Array_obj< ::Dynamic>::__new(0);
HXLINE(  85)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Stages.xml",70,ce,52,d7));
HXLINE(  87)		xml = ::XMLUtils_obj::findNode(xml,HX_("zone",2c,a2,f8,50),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(zone));
HXLINE(  88)		xml = ::XMLUtils_obj::findNode(xml,HX_("stage",be,6a,0b,84),HX_("number",c9,86,7a,a1),(HX_("",00,00,00,00) + stage));
HXLINE(  89)		bool xml1;
HXDLIN(  89)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE(  89)			xml1 = (xml->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE(  89)			xml1 = false;
            		}
HXDLIN(  89)		if (xml1) {
HXLINE(  89)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + xml->nodeType));
            		}
HXDLIN(  89)		xml = xml->children->__get((int)0).StaticCast<  ::Xml >();
HXLINE(  91)		{
HXLINE(  91)			int _g = (int)0;
HXDLIN(  91)			::Array< ::String > _g1 = ::XMLUtils_obj::parseValueArray(xml);
HXDLIN(  91)			while((_g < _g1->length)){
HXLINE(  91)				::String enemyID = _g1->__get(_g);
HXDLIN(  91)				_g = (_g + (int)1);
HXLINE(  92)				output->push(::Type_obj::createEnum(hx::ClassOf< ::ID >(),enemyID,null()));
            			}
            		}
HXLINE(  94)		return output;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(XMLUtils_obj,parseStage,return )

::Array< ::Dynamic> XMLUtils_obj::nextZones( ::Zone zone){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_98_nextZones)
HXLINE( 100)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Stages.xml",70,ce,52,d7));
HXLINE( 102)		xml = ::XMLUtils_obj::findNode(xml,HX_("zone",2c,a2,f8,50),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(zone));
HXLINE( 103)		xml = ::XMLUtils_obj::findNode(xml,HX_("unlocks",2f,c9,81,75),null(),null());
HXLINE( 104)		bool xml1;
HXDLIN( 104)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 104)			xml1 = (xml->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 104)			xml1 = false;
            		}
HXDLIN( 104)		if (xml1) {
HXLINE( 104)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + xml->nodeType));
            		}
HXDLIN( 104)		xml = xml->children->__get((int)0).StaticCast<  ::Xml >();
HXLINE( 106)		::Array< ::Dynamic> _g = ::Array_obj< ::Dynamic>::__new(0);
HXDLIN( 106)		{
HXLINE( 106)			int _g1 = (int)0;
HXDLIN( 106)			::Array< ::String > _g2 = ::XMLUtils_obj::parseValueArray(xml);
HXDLIN( 106)			while((_g1 < _g2->length)){
HXLINE( 106)				::String id = _g2->__get(_g1);
HXDLIN( 106)				_g1 = (_g1 + (int)1);
HXDLIN( 106)				_g->push(::XMLUtils_obj::castNode(id,hx::ClassOf< ::Zone >()));
            			}
            		}
HXDLIN( 106)		return _g;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,nextZones,return )

int XMLUtils_obj::stageCount( ::Zone zone){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_110_stageCount)
HXLINE( 111)		int count = (int)0;
HXLINE( 112)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Stages.xml",70,ce,52,d7));
HXLINE( 114)		xml = ::XMLUtils_obj::findNode(xml,HX_("zone",2c,a2,f8,50),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(zone));
HXLINE( 115)		{
HXLINE( 115)			 ::Dynamic node = xml->elementsNamed(HX_("stage",be,6a,0b,84));
HXDLIN( 115)			while(( (bool)(node->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE( 115)				 ::Xml node1 = ( ( ::Xml)(node->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE( 116)				count = (count + (int)1);
            			}
            		}
HXLINE( 118)		return count;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,stageCount,return )

 ::Dynamic XMLUtils_obj::parseAbility( ::ID ability,::String param, ::Dynamic paramType){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_122_parseAbility)
HXLINE( 123)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Abilities.xml",9f,48,bd,8a));
HXLINE( 124)		xml = ::XMLUtils_obj::findNode(xml,HX_("ability",aa,61,61,ad),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(ability));
HXLINE( 125)		xml = ::XMLUtils_obj::findNode(xml,param,null(),null());
HXLINE( 126)		bool xml1;
HXDLIN( 126)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 126)			xml1 = (xml->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 126)			xml1 = false;
            		}
HXDLIN( 126)		if (xml1) {
HXLINE( 126)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + xml->nodeType));
            		}
HXDLIN( 126)		xml = xml->children->__get((int)0).StaticCast<  ::Xml >();
HXLINE( 128)		bool _hx_tmp;
HXDLIN( 128)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 128)			_hx_tmp = (xml->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 128)			_hx_tmp = true;
            		}
HXDLIN( 128)		if (_hx_tmp) {
HXLINE( 128)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + xml->nodeType));
            		}
HXDLIN( 128)		return ::XMLUtils_obj::castNode(xml->nodeValue,paramType);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(XMLUtils_obj,parseAbility,return )

::Array< ::Dynamic> XMLUtils_obj::parseTriggers( ::ID object){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_132_parseTriggers)
HXLINE( 133)		::Array< ::Dynamic> output = ::Array_obj< ::Dynamic>::__new(0);
HXLINE( 134)		 ::Xml xml;
HXLINE( 136)		if ((::Type_obj::enumConstructor(object).substr((int)0,(int)4) == HX_("Buff",f3,35,f9,2b))) {
HXLINE( 137)			 ::Xml xml1 = ::XMLUtils_obj::fromFile(HX_("data\\Buffs.xml",57,d0,82,69));
HXDLIN( 137)			xml = ::XMLUtils_obj::findNode(xml1,HX_("buff",d3,09,20,41),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(object));
            		}
            		else {
HXLINE( 139)			 ::Xml xml2 = ::XMLUtils_obj::fromFile(HX_("data\\Abilities.xml",9f,48,bd,8a));
HXDLIN( 139)			xml = ::XMLUtils_obj::findNode(xml2,HX_("ability",aa,61,61,ad),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(object));
            		}
HXLINE( 141)		if (( (bool)(xml->elementsNamed(HX_("triggers",3b,3c,8b,fd))->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )) {
HXLINE( 143)			xml = ::XMLUtils_obj::findNode(xml,HX_("triggers",3b,3c,8b,fd),null(),null());
HXLINE( 144)			bool xml3;
HXDLIN( 144)			if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 144)				xml3 = (xml->nodeType != ::Xml_obj::Element);
            			}
            			else {
HXLINE( 144)				xml3 = false;
            			}
HXDLIN( 144)			if (xml3) {
HXLINE( 144)				HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + xml->nodeType));
            			}
HXDLIN( 144)			xml = xml->children->__get((int)0).StaticCast<  ::Xml >();
HXLINE( 146)			{
HXLINE( 146)				int _g = (int)0;
HXDLIN( 146)				::Array< ::String > _g1 = ::XMLUtils_obj::parseValueArray(xml);
HXDLIN( 146)				while((_g < _g1->length)){
HXLINE( 146)					::String event = _g1->__get(_g);
HXDLIN( 146)					_g = (_g + (int)1);
HXLINE( 147)					output->push(::Type_obj::createEnum(hx::ClassOf< ::battle::data::BattleEvent >(),event,null()));
            				}
            			}
            		}
HXLINE( 150)		return output;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,parseTriggers,return )

 ::Dynamic XMLUtils_obj::parseBuff( ::ID buff,::String param, ::Dynamic paramType){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_154_parseBuff)
HXLINE( 155)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Buffs.xml",57,d0,82,69));
HXLINE( 156)		xml = ::XMLUtils_obj::findNode(xml,HX_("buff",d3,09,20,41),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(buff));
HXLINE( 157)		xml = ::XMLUtils_obj::findNode(xml,param,null(),null());
HXLINE( 158)		bool xml1;
HXDLIN( 158)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 158)			xml1 = (xml->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 158)			xml1 = false;
            		}
HXDLIN( 158)		if (xml1) {
HXLINE( 158)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + xml->nodeType));
            		}
HXDLIN( 158)		xml = xml->children->__get((int)0).StaticCast<  ::Xml >();
HXLINE( 160)		bool _hx_tmp;
HXDLIN( 160)		if ((xml->nodeType != ::Xml_obj::Document)) {
HXLINE( 160)			_hx_tmp = (xml->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 160)			_hx_tmp = true;
            		}
HXDLIN( 160)		if (_hx_tmp) {
HXLINE( 160)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + xml->nodeType));
            		}
HXDLIN( 160)		return ::XMLUtils_obj::castNode(xml->nodeValue,paramType);
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(XMLUtils_obj,parseBuff,return )

 ::Dynamic XMLUtils_obj::parseUnit( ::ID unit){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_164_parseUnit)
HXLINE( 165)		 ::Xml xml = ::XMLUtils_obj::fromFile(HX_("data\\Units.xml",06,ee,cb,96));
HXLINE( 166)		xml = ::XMLUtils_obj::findNode(xml,HX_("unit",84,ca,a9,4d),HX_("id",db,5b,00,00),::Type_obj::enumConstructor(unit));
HXLINE( 168)		::Array< ::Dynamic> wheel = ::Array_obj< ::Dynamic>::__new(0);
HXLINE( 169)		{
HXLINE( 169)			int _g = (int)0;
HXDLIN( 169)			 ::Xml _this = ::XMLUtils_obj::findNode(xml,HX_("wheel",9b,34,ba,c9),null(),null());
HXDLIN( 169)			bool _g1;
HXDLIN( 169)			if ((_this->nodeType != ::Xml_obj::Document)) {
HXLINE( 169)				_g1 = (_this->nodeType != ::Xml_obj::Element);
            			}
            			else {
HXLINE( 169)				_g1 = false;
            			}
HXDLIN( 169)			if (_g1) {
HXLINE( 169)				HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this->nodeType));
            			}
HXDLIN( 169)			::Array< ::String > _g11 = ::XMLUtils_obj::parseValueArray(_this->children->__get((int)0).StaticCast<  ::Xml >());
HXDLIN( 169)			while((_g < _g11->length)){
HXLINE( 169)				::String id = _g11->__get(_g);
HXDLIN( 169)				_g = (_g + (int)1);
HXLINE( 170)				wheel->push(::Type_obj::createEnum(hx::ClassOf< ::ID >(),id,null()));
            			}
            		}
HXLINE( 173)		 ::Xml _this1 = ::XMLUtils_obj::findNode(xml,HX_("name",4b,72,ff,48),null(),null());
HXDLIN( 173)		bool _hx_tmp;
HXDLIN( 173)		if ((_this1->nodeType != ::Xml_obj::Document)) {
HXLINE( 173)			_hx_tmp = (_this1->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 173)			_hx_tmp = false;
            		}
HXDLIN( 173)		if (_hx_tmp) {
HXLINE( 173)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this1->nodeType));
            		}
HXDLIN( 173)		 ::Xml _this2 = _this1->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 173)		bool _hx_tmp1;
HXDLIN( 173)		if ((_this2->nodeType != ::Xml_obj::Document)) {
HXLINE( 173)			_hx_tmp1 = (_this2->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 173)			_hx_tmp1 = true;
            		}
HXDLIN( 173)		if (_hx_tmp1) {
HXLINE( 173)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this2->nodeType));
            		}
HXDLIN( 173)		::String _hx_tmp2 = ( (::String)(::XMLUtils_obj::castNode(_this2->nodeValue,HX_("",00,00,00,00))) );
HXLINE( 174)		 ::Xml _this3 = ::XMLUtils_obj::findNode(xml,HX_("hp",08,5b,00,00),null(),null());
HXDLIN( 174)		bool _hx_tmp3;
HXDLIN( 174)		if ((_this3->nodeType != ::Xml_obj::Document)) {
HXLINE( 174)			_hx_tmp3 = (_this3->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 174)			_hx_tmp3 = false;
            		}
HXDLIN( 174)		if (_hx_tmp3) {
HXLINE( 174)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this3->nodeType));
            		}
HXDLIN( 174)		 ::Xml _this4 = _this3->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 174)		bool _hx_tmp4;
HXDLIN( 174)		if ((_this4->nodeType != ::Xml_obj::Document)) {
HXLINE( 174)			_hx_tmp4 = (_this4->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 174)			_hx_tmp4 = true;
            		}
HXDLIN( 174)		if (_hx_tmp4) {
HXLINE( 174)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this4->nodeType));
            		}
HXDLIN( 174)		int _hx_tmp5 = ( (int)(::XMLUtils_obj::castNode(_this4->nodeValue,(int)1)) );
HXLINE( 175)		 ::Xml _this5 = ::XMLUtils_obj::findNode(xml,HX_("mana",87,3c,56,48),null(),null());
HXDLIN( 175)		bool _hx_tmp6;
HXDLIN( 175)		if ((_this5->nodeType != ::Xml_obj::Document)) {
HXLINE( 175)			_hx_tmp6 = (_this5->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 175)			_hx_tmp6 = false;
            		}
HXDLIN( 175)		if (_hx_tmp6) {
HXLINE( 175)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this5->nodeType));
            		}
HXDLIN( 175)		 ::Xml _this6 = _this5->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 175)		bool _hx_tmp7;
HXDLIN( 175)		if ((_this6->nodeType != ::Xml_obj::Document)) {
HXLINE( 175)			_hx_tmp7 = (_this6->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 175)			_hx_tmp7 = true;
            		}
HXDLIN( 175)		if (_hx_tmp7) {
HXLINE( 175)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this6->nodeType));
            		}
HXDLIN( 175)		int _hx_tmp8 = ( (int)(::XMLUtils_obj::castNode(_this6->nodeValue,(int)1)) );
HXLINE( 176)		 ::Xml _this7 = ::XMLUtils_obj::findNode(xml,HX_("strength",81,d2,8e,8e),null(),null());
HXDLIN( 176)		bool _hx_tmp9;
HXDLIN( 176)		if ((_this7->nodeType != ::Xml_obj::Document)) {
HXLINE( 176)			_hx_tmp9 = (_this7->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 176)			_hx_tmp9 = false;
            		}
HXDLIN( 176)		if (_hx_tmp9) {
HXLINE( 176)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this7->nodeType));
            		}
HXDLIN( 176)		 ::Xml _this8 = _this7->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 176)		bool _hx_tmp10;
HXDLIN( 176)		if ((_this8->nodeType != ::Xml_obj::Document)) {
HXLINE( 176)			_hx_tmp10 = (_this8->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 176)			_hx_tmp10 = true;
            		}
HXDLIN( 176)		if (_hx_tmp10) {
HXLINE( 176)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this8->nodeType));
            		}
HXDLIN( 176)		int _hx_tmp11 = ( (int)(::XMLUtils_obj::castNode(_this8->nodeValue,(int)1)) );
HXLINE( 177)		 ::Xml _this9 = ::XMLUtils_obj::findNode(xml,HX_("flow",ee,17,be,43),null(),null());
HXDLIN( 177)		bool _hx_tmp12;
HXDLIN( 177)		if ((_this9->nodeType != ::Xml_obj::Document)) {
HXLINE( 177)			_hx_tmp12 = (_this9->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 177)			_hx_tmp12 = false;
            		}
HXDLIN( 177)		if (_hx_tmp12) {
HXLINE( 177)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this9->nodeType));
            		}
HXDLIN( 177)		 ::Xml _this10 = _this9->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 177)		bool _hx_tmp13;
HXDLIN( 177)		if ((_this10->nodeType != ::Xml_obj::Document)) {
HXLINE( 177)			_hx_tmp13 = (_this10->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 177)			_hx_tmp13 = true;
            		}
HXDLIN( 177)		if (_hx_tmp13) {
HXLINE( 177)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this10->nodeType));
            		}
HXDLIN( 177)		int _hx_tmp14 = ( (int)(::XMLUtils_obj::castNode(_this10->nodeValue,(int)1)) );
HXLINE( 178)		 ::Xml _this11 = ::XMLUtils_obj::findNode(xml,HX_("intellect",80,07,6d,c9),null(),null());
HXDLIN( 178)		bool _hx_tmp15;
HXDLIN( 178)		if ((_this11->nodeType != ::Xml_obj::Document)) {
HXLINE( 178)			_hx_tmp15 = (_this11->nodeType != ::Xml_obj::Element);
            		}
            		else {
HXLINE( 178)			_hx_tmp15 = false;
            		}
HXDLIN( 178)		if (_hx_tmp15) {
HXLINE( 178)			HX_STACK_DO_THROW((HX_("Bad node type, expected Element or Document but found ",a0,d6,ba,79) + _this11->nodeType));
            		}
HXDLIN( 178)		 ::Xml _this12 = _this11->children->__get((int)0).StaticCast<  ::Xml >();
HXDLIN( 178)		bool _hx_tmp16;
HXDLIN( 178)		if ((_this12->nodeType != ::Xml_obj::Document)) {
HXLINE( 178)			_hx_tmp16 = (_this12->nodeType == ::Xml_obj::Element);
            		}
            		else {
HXLINE( 178)			_hx_tmp16 = true;
            		}
HXDLIN( 178)		if (_hx_tmp16) {
HXLINE( 178)			HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + _this12->nodeType));
            		}
HXLINE( 172)		return  ::Dynamic(hx::Anon_obj::Create(7)
            			->setFixed(0,HX_("strength",81,d2,8e,8e),_hx_tmp11)
            			->setFixed(1,HX_("intellect",80,07,6d,c9),( (int)(::XMLUtils_obj::castNode(_this12->nodeValue,(int)1)) ))
            			->setFixed(2,HX_("wheel",9b,34,ba,c9),wheel)
            			->setFixed(3,HX_("hp",08,5b,00,00),_hx_tmp5)
            			->setFixed(4,HX_("flow",ee,17,be,43),_hx_tmp14)
            			->setFixed(5,HX_("mana",87,3c,56,48),_hx_tmp8)
            			->setFixed(6,HX_("name",4b,72,ff,48),_hx_tmp2));
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,parseUnit,return )

 ::Xml XMLUtils_obj::getTree( ::Element element){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_189_getTree)
HXDLIN( 189)		if ((_hx_getEnumValueIndex(element) == (int)2)) {
HXLINE( 192)			return ::XMLUtils_obj::fromFile(HX_("data\\LightningTree.xml",9f,ae,02,2e));
            		}
            		else {
HXLINE( 194)			return null();
            		}
HXLINE( 189)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,getTree,return )

 ::Dynamic XMLUtils_obj::castNode( ::Dynamic value, ::Dynamic type){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_199_castNode)
HXLINE( 200)		if (::Std_obj::is(type,hx::ClassOf< ::String >())) {
HXLINE( 201)			return value;
            		}
            		else {
HXLINE( 202)			if (::Std_obj::is(type,hx::ClassOf< int >())) {
HXLINE( 203)				return ::Std_obj::parseInt(( (::String)(value) ));
            			}
            			else {
HXLINE( 204)				if (::Std_obj::is(type,hx::ClassOf< bool >())) {
HXLINE( 205)					return hx::IsEq( value,HX_("true",4e,a7,03,4d) );
            				}
            				else {
HXLINE( 206)					if (::Std_obj::is(type,hx::ClassOf< ::Float >())) {
HXLINE( 207)						return ::Std_obj::parseFloat(( (::String)(value) ));
            					}
            					else {
HXLINE( 208)						if (::Std_obj::is(type,hx::ClassOf< ::Enum >())) {
HXLINE( 209)							return ::Type_obj::createEnum(type,( (::String)(value) ),null());
            						}
            					}
            				}
            			}
            		}
HXLINE( 220)		HX_STACK_DO_THROW(HX_("Node casting error: Unknown node type",2f,97,14,4c));
HXDLIN( 220)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(XMLUtils_obj,castNode,return )

 ::Xml XMLUtils_obj::findNode( ::Xml xml,::String nodeName,::String __o_keyAtt,::String __o_keyAttValue){
::String keyAtt = __o_keyAtt.Default(HX_HCSTRING("","\x00","\x00","\x00","\x00"));
::String keyAttValue = __o_keyAttValue.Default(HX_HCSTRING("","\x00","\x00","\x00","\x00"));
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_224_findNode)
HXLINE( 225)		{
HXLINE( 225)			 ::Dynamic node = xml->elementsNamed(nodeName);
HXDLIN( 225)			while(( (bool)(node->__Field(HX_("hasNext",6d,a5,46,18),hx::paccDynamic)()) )){
HXLINE( 225)				 ::Xml node1 = ( ( ::Xml)(node->__Field(HX_("next",f3,84,02,49),hx::paccDynamic)()) );
HXLINE( 226)				bool _hx_tmp;
HXDLIN( 226)				if ((keyAtt != HX_("",00,00,00,00))) {
HXLINE( 226)					_hx_tmp = (node1->get(keyAtt) == keyAttValue);
            				}
            				else {
HXLINE( 226)					_hx_tmp = true;
            				}
HXDLIN( 226)				if (_hx_tmp) {
HXLINE( 227)					return node1;
            				}
            			}
            		}
HXLINE( 229)		if ((keyAtt == HX_("",00,00,00,00))) {
HXLINE( 230)			HX_STACK_DO_THROW((HX_("Node not found: ",5d,46,f6,27) + nodeName));
            		}
            		else {
HXLINE( 232)			HX_STACK_DO_THROW((((((HX_("Node not found: ",5d,46,f6,27) + nodeName) + HX_(" with key attribute ",1f,0a,43,3c)) + keyAtt) + HX_(" = ",63,7d,18,00)) + keyAttValue));
            		}
HXLINE( 229)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC4(XMLUtils_obj,findNode,return )

::Array< ::String > XMLUtils_obj::parseValueArray( ::Xml node){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_236_parseValueArray)
HXLINE( 237)		::Array< ::String > output = ::Array_obj< ::String >::__new(0);
HXLINE( 238)		::String stream = HX_("",00,00,00,00);
HXLINE( 240)		{
HXLINE( 240)			int _g1 = (int)0;
HXDLIN( 240)			bool _g;
HXDLIN( 240)			if ((node->nodeType != ::Xml_obj::Document)) {
HXLINE( 240)				_g = (node->nodeType == ::Xml_obj::Element);
            			}
            			else {
HXLINE( 240)				_g = true;
            			}
HXDLIN( 240)			if (_g) {
HXLINE( 240)				HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + node->nodeType));
            			}
HXDLIN( 240)			int _g2 = node->nodeValue.length;
HXDLIN( 240)			while((_g1 < _g2)){
HXLINE( 240)				_g1 = (_g1 + (int)1);
HXDLIN( 240)				int i = (_g1 - (int)1);
HXLINE( 242)				bool _hx_char;
HXDLIN( 242)				if ((node->nodeType != ::Xml_obj::Document)) {
HXLINE( 242)					_hx_char = (node->nodeType == ::Xml_obj::Element);
            				}
            				else {
HXLINE( 242)					_hx_char = true;
            				}
HXDLIN( 242)				if (_hx_char) {
HXLINE( 242)					HX_STACK_DO_THROW((HX_("Bad node type, unexpected ",be,79,d5,11) + node->nodeType));
            				}
HXDLIN( 242)				::String char1 = node->nodeValue.charAt(i);
HXLINE( 243)				if ((char1 != HX_(" ",20,00,00,00))) {
HXLINE( 244)					if ((char1 != HX_(",",2c,00,00,00))) {
HXLINE( 245)						stream = (stream + char1);
            					}
            					else {
HXLINE( 248)						output->push(stream);
HXLINE( 249)						stream = HX_("",00,00,00,00);
            					}
            				}
            			}
            		}
HXLINE( 253)		if ((stream != HX_("",00,00,00,00))) {
HXLINE( 254)			output->push(stream);
            		}
HXLINE( 256)		return output;
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,parseValueArray,return )

 ::Xml XMLUtils_obj::fromFile(::String path){
            	HX_STACKFRAME(&_hx_pos_741a171e3cdc6ad7_260_fromFile)
HXLINE( 261)		::String srcPath = ::Sys_obj::programPath();
HXDLIN( 261)		::String srcPath1 = (srcPath.substring((int)0,::Sys_obj::programPath().indexOf(HX_("bin",c7,b8,4a,00),null())) + HX_("src\\",f8,60,5a,4c));
HXLINE( 263)		if (::sys::FileSystem_obj::exists(srcPath1)) {
HXLINE( 264)			return ::Xml_obj::parse(::sys::io::File_obj::getContent((srcPath1 + path)));
            		}
            		else {
HXLINE( 266)			HX_STACK_DO_THROW(HX_("Invalid path",8e,c7,5e,91));
            		}
HXLINE( 263)		return null();
            	}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(XMLUtils_obj,fromFile,return )


XMLUtils_obj::XMLUtils_obj()
{
}

bool XMLUtils_obj::__GetStatic(const ::String &inName, Dynamic &outValue, hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"getTree") ) { outValue = getTree_dyn(); return true; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"castNode") ) { outValue = castNode_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"findNode") ) { outValue = findNode_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"fromFile") ) { outValue = fromFile_dyn(); return true; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"getGlobal") ) { outValue = getGlobal_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"parseTree") ) { outValue = parseTree_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"nextZones") ) { outValue = nextZones_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"parseBuff") ) { outValue = parseBuff_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"parseUnit") ) { outValue = parseUnit_dyn(); return true; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"parseStage") ) { outValue = parseStage_dyn(); return true; }
		if (HX_FIELD_EQ(inName,"stageCount") ) { outValue = stageCount_dyn(); return true; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"parseAbility") ) { outValue = parseAbility_dyn(); return true; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"parseTriggers") ) { outValue = parseTriggers_dyn(); return true; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"parseTreePaths") ) { outValue = parseTreePaths_dyn(); return true; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"parseValueArray") ) { outValue = parseValueArray_dyn(); return true; }
	}
	return false;
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *XMLUtils_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *XMLUtils_obj_sStaticStorageInfo = 0;
#endif

static void XMLUtils_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(XMLUtils_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void XMLUtils_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(XMLUtils_obj::__mClass,"__mClass");
};

#endif

hx::Class XMLUtils_obj::__mClass;

static ::String XMLUtils_obj_sStaticFields[] = {
	HX_HCSTRING("getGlobal","\x99","\xba","\x08","\x24"),
	HX_HCSTRING("parseTree","\x31","\xeb","\xa9","\xd4"),
	HX_HCSTRING("parseTreePaths","\x3d","\x5e","\x83","\x6c"),
	HX_HCSTRING("parseStage","\x8b","\xb1","\xec","\xad"),
	HX_HCSTRING("nextZones","\xd4","\x5e","\xda","\x2f"),
	HX_HCSTRING("stageCount","\x31","\x99","\xb3","\x9d"),
	HX_HCSTRING("parseAbility","\xb7","\xb5","\x3b","\x07"),
	HX_HCSTRING("parseTriggers","\x8e","\x73","\xba","\x42"),
	HX_HCSTRING("parseBuff","\xa6","\x5b","\xc6","\xc8"),
	HX_HCSTRING("parseUnit","\x57","\x1c","\x50","\xd5"),
	HX_HCSTRING("getTree","\x14","\x49","\x86","\x1f"),
	HX_HCSTRING("castNode","\x61","\x20","\x8d","\xd9"),
	HX_HCSTRING("findNode","\xdb","\x16","\x9e","\x9b"),
	HX_HCSTRING("parseValueArray","\x7b","\xb6","\x15","\x26"),
	HX_HCSTRING("fromFile","\x06","\x9d","\x87","\xa1"),
	::String(null())
};

void XMLUtils_obj::__register()
{
	hx::Object *dummy = new XMLUtils_obj;
	XMLUtils_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("XMLUtils","\xfa","\x78","\x77","\xcc");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &XMLUtils_obj::__GetStatic;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = XMLUtils_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(XMLUtils_obj_sStaticFields);
	__mClass->mMembers = hx::Class_obj::dupFunctions(0 /* sMemberFields */);
	__mClass->mCanCast = hx::TCanCast< XMLUtils_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = XMLUtils_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = XMLUtils_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = XMLUtils_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}
